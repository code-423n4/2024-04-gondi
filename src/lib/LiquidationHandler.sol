// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.21;

import "@solmate/auth/Owned.sol";
import "@solmate/tokens/ERC721.sol";
import "@solmate/utils/ReentrancyGuard.sol";

import "../interfaces/ILiquidationHandler.sol";
import "../interfaces/loans/IMultiSourceLoan.sol";
import "./callbacks/CallbackHandler.sol";
import "./InputChecker.sol";

/// @title Liquidation Handler
/// @author Florida St
/// @notice Liquidation Handler for defaulted loans
abstract contract LiquidationHandler is ILiquidationHandler, ReentrancyGuard, CallbackHandler {
    uint48 public constant MIN_AUCTION_DURATION = 1 days;
    uint48 public constant MAX_AUCTION_DURATION = 7 days;

    /// @notice Duration of the auction when a loan defaults requires a liquidation.
    uint48 internal _liquidationAuctionDuration = 3 days;

    /// @notice Liquidator used defaulted loans that requires liquidation.
    address internal _loanLiquidator;

    event LoanSentToLiquidator(uint256 loanId, address liquidator);

    event LoanForeclosed(uint256 loanId);

    event LiquidationContractUpdated(address liquidator);

    event LiquidationAuctionDurationUpdated(uint256 newDuration);

    error LiquidatorOnlyError(address _liquidator);

    error LoanNotDueError(uint256 _expirationTime);

    error InvalidDurationError();

    /// @notice Constructor
    /// @param __owner The owner of the contract
    /// @param _updateWaitTime The time to wait before a new owner can be set
    /// @param __loanLiquidator The liquidator contract
    /// @param __protocolFee The protocol fee
    constructor(address __owner, uint256 _updateWaitTime, address __loanLiquidator, ProtocolFee memory __protocolFee)
        CallbackHandler(__owner, _updateWaitTime, __protocolFee)
    {
        _loanLiquidator = __loanLiquidator;
    }

    modifier onlyLiquidator() {
        if (msg.sender != address(_loanLiquidator)) {
            revert LiquidatorOnlyError(address(_loanLiquidator));
        }
        _;
    }

    /// @inheritdoc ILiquidationHandler
    function getLiquidator() external view override returns (address) {
        return _loanLiquidator;
    }

    /// @inheritdoc ILiquidationHandler
    function updateLiquidationContract(address __loanLiquidator) external override onlyOwner {
        _checkAddressNotZero(__loanLiquidator);
        _loanLiquidator = __loanLiquidator;

        emit LiquidationContractUpdated(__loanLiquidator);
    }

    /// @inheritdoc ILiquidationHandler
    function updateLiquidationAuctionDuration(uint48 _newDuration) external override onlyOwner {
        if (_newDuration < MIN_AUCTION_DURATION || _newDuration > MAX_AUCTION_DURATION) {
            revert InvalidDurationError();
        }
        _liquidationAuctionDuration = _newDuration;

        emit LiquidationAuctionDurationUpdated(_newDuration);
    }

    /// @inheritdoc ILiquidationHandler
    function getLiquidationAuctionDuration() external view override returns (uint48) {
        return _liquidationAuctionDuration;
    }

    function _liquidateLoan(uint256 _loanId, IMultiSourceLoan.Loan calldata _loan, bool _canClaim)
        internal
        returns (bool liquidated, bytes memory liquidation)
    {
        uint256 expirationTime = _loan.startTime + _loan.duration;
        if (expirationTime > block.timestamp) {
            revert LoanNotDueError(expirationTime);
        }
        if (_canClaim) {
            ERC721(_loan.nftCollateralAddress).transferFrom(
                address(this), _loan.tranche[0].lender, _loan.nftCollateralTokenId
            );
            emit LoanForeclosed(_loanId);

            liquidated = true;
        } else {
            ERC721(_loan.nftCollateralAddress).transferFrom(address(this), _loanLiquidator, _loan.nftCollateralTokenId);
            liquidation = ILoanLiquidator(_loanLiquidator).liquidateLoan(
                _loanId,
                _loan.nftCollateralAddress,
                _loan.nftCollateralTokenId,
                _loan.principalAddress,
                _liquidationAuctionDuration,
                msg.sender
            );

            emit LoanSentToLiquidator(_loanId, _loanLiquidator);
        }
    }
}
