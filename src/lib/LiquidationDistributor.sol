// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.21;

import "@solmate/utils/FixedPointMathLib.sol";
import "@solmate/utils/ReentrancyGuard.sol";
import "@solmate/utils/SafeTransferLib.sol";
import "@solmate/tokens/ERC20.sol";

import "../interfaces/ILiquidationDistributor.sol";
import "../interfaces/loans/IMultiSourceLoan.sol";
import "../interfaces/loans/ILoanManagerRegistry.sol";
import "./loans/LoanManager.sol";
import "./loans/WithLoanManagers.sol";
import "./utils/Interest.sol";

/// @title Liquidation Distributor
/// @author Florida St
/// @notice Receives proceeds from a liquidation and distributes them based on tranches.
contract LiquidationDistributor is ILiquidationDistributor, ReentrancyGuard {
    using FixedPointMathLib for uint256;
    using Interest for uint256;
    using SafeTransferLib for ERC20;

    ILoanManagerRegistry public immutable getLoanManagerRegistry;

    /// @param _loanManagerRegistry The address of the LoanManagerRegistry
    constructor(address _loanManagerRegistry) {
        getLoanManagerRegistry = ILoanManagerRegistry(_loanManagerRegistry);
    }

    /// @inheritdoc ILiquidationDistributor
    function distribute(uint256 _proceeds, IMultiSourceLoan.Loan calldata _loan) external {
        uint256[] memory owedPerTranche = new uint256[](_loan.tranche.length);
        uint256 totalPrincipalAndPaidInterestOwed = _loan.principalAmount;
        uint256 totalPendingInterestOwed = 0;
        for (uint256 i = 0; i < _loan.tranche.length;) {
            IMultiSourceLoan.Tranche calldata thisTranche = _loan.tranche[i];
            uint256 pendingInterest =
                thisTranche.principalAmount.getInterest(thisTranche.aprBps, block.timestamp - thisTranche.startTime);
            totalPrincipalAndPaidInterestOwed += thisTranche.accruedInterest;
            totalPendingInterestOwed += pendingInterest;
            owedPerTranche[i] += thisTranche.principalAmount + thisTranche.accruedInterest + pendingInterest;
            unchecked {
                ++i;
            }
        }

        if (_proceeds > totalPrincipalAndPaidInterestOwed + totalPendingInterestOwed) {
            for (uint256 i = 0; i < _loan.tranche.length;) {
                IMultiSourceLoan.Tranche calldata thisTranche = _loan.tranche[i];
                _handleTrancheExcess(
                    _loan.principalAddress,
                    thisTranche,
                    msg.sender,
                    _proceeds,
                    totalPrincipalAndPaidInterestOwed + totalPendingInterestOwed
                );
                unchecked {
                    ++i;
                }
            }
        } else {
            for (uint256 i = 0; i < _loan.tranche.length && _proceeds > 0;) {
                IMultiSourceLoan.Tranche calldata thisTranche = _loan.tranche[i];
                _proceeds = _handleTrancheInsufficient(
                    _loan.principalAddress, thisTranche, msg.sender, _proceeds, owedPerTranche[i]
                );
                unchecked {
                    ++i;
                }
            }
        }
    }

    function _handleTrancheExcess(
        address _tokenAddress,
        IMultiSourceLoan.Tranche calldata _tranche,
        address _liquidator,
        uint256 _proceeds,
        uint256 _totalOwed
    ) private {
        uint256 excess = _proceeds - _totalOwed;
        /// Total = principal + accruedInterest +  pendingInterest + pro-rata remainder
        uint256 owed = _tranche.principalAmount + _tranche.accruedInterest
            + _tranche.principalAmount.getInterest(_tranche.aprBps, block.timestamp - _tranche.startTime);
        uint256 total = owed + excess.mulDivDown(owed, _totalOwed);
        _handleLoanManagerCall(_tranche, total);
        ERC20(_tokenAddress).safeTransferFrom(_liquidator, _tranche.lender, total);
    }

    function _handleTrancheInsufficient(
        address _tokenAddress,
        IMultiSourceLoan.Tranche calldata _tranche,
        address _liquidator,
        uint256 _proceedsLeft,
        uint256 _trancheOwed
    ) private returns (uint256) {
        if (_proceedsLeft > _trancheOwed) {
            _handleLoanManagerCall(_tranche, _trancheOwed);
            ERC20(_tokenAddress).safeTransferFrom(_liquidator, _tranche.lender, _trancheOwed);
            _proceedsLeft -= _trancheOwed;
        } else {
            _handleLoanManagerCall(_tranche, _proceedsLeft);
            ERC20(_tokenAddress).safeTransferFrom(_liquidator, _tranche.lender, _proceedsLeft);
            _proceedsLeft = 0;
        }
        return _proceedsLeft;
    }

    function _handleLoanManagerCall(IMultiSourceLoan.Tranche calldata _tranche, uint256 _sent) private {
        if (getLoanManagerRegistry.isLoanManager(_tranche.lender)) {
            LoanManager(_tranche.lender).loanLiquidation(
                _tranche.loanId,
                _tranche.principalAmount,
                _tranche.aprBps,
                _tranche.accruedInterest,
                0,
                _sent,
                _tranche.startTime
            );
        }
    }
}
