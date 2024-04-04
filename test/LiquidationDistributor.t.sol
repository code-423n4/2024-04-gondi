// SPDX-License-Identifier: AGPL-3.0

pragma solidity ^0.8.21;

import "@solmate/utils/FixedPointMathLib.sol";

import "src/lib/loans/LoanManagerRegistry.sol";
import "src/lib/LiquidationDistributor.sol";
import "src/lib/utils/Interest.sol";
import "test/loans/MultiSourceCommons.sol";

contract LiquidationDistributorTest is MultiSourceCommons {
    using FixedPointMathLib for uint256;
    using Interest for uint256;

    LiquidationDistributor private _distributor;

    function setUp() public override {
        super.setUp();
        _distributor = new LiquidationDistributor(address(_loanManagerRegistry));
    }

    function testLoanLiquidatedExcessProceeds() public {
        (, IMultiSourceLoan.Loan memory loan) = _getLoanWithTranches();
        vm.warp(loan.startTime + loan.duration + 10);

        uint256 totalCost = 0;
        uint256 total = 0;
        uint256 totalLenders = loan.tranche.length;
        uint256[] memory balances = new uint256[](totalLenders);
        uint256[] memory cost = new uint256[](totalLenders);
        uint256[] memory expectedRepayment = new uint256[](totalLenders);
        for (uint256 i = 0; i < loan.tranche.length;) {
            IMultiSourceLoan.Tranche memory tranche = loan.tranche[i];
            balances[i] = testToken.balanceOf(tranche.lender);
            cost[i] = tranche.principalAmount + tranche.accruedInterest;
            totalCost += cost[i];
            expectedRepayment[i] =
                cost[i] + tranche.principalAmount.getInterest(tranche.aprBps, block.timestamp - tranche.startTime);
            total += expectedRepayment[i];
            unchecked {
                ++i;
            }
        }
        uint256 extra = 1000;
        uint256 repayment = total + extra;
        testToken.mint(address(this), repayment);
        testToken.approve(address(_distributor), repayment);
        _distributor.distribute(repayment, loan);
        for (uint256 i = 0; i < loan.tranche.length;) {
            IMultiSourceLoan.Tranche memory tranche = loan.tranche[i];
            assertEq(
                testToken.balanceOf(tranche.lender),
                balances[i] + expectedRepayment[i] + extra.mulDivDown(expectedRepayment[i], total)
            );
            unchecked {
                ++i;
            }
        }
    }

    function testLoanLiquidatedLowerProceeds() public {
        (, IMultiSourceLoan.Loan memory loan) = _getLoanWithTranches();
        vm.warp(loan.startTime + loan.duration + 10);

        uint256 totalLenders = loan.tranche.length;
        uint256[] memory balances = new uint256[](totalLenders);
        uint256[] memory owedPerTranche = new uint256[](totalLenders);

        for (uint256 i = 0; i < loan.tranche.length;) {
            IMultiSourceLoan.Tranche memory thisTranche = loan.tranche[i];
            owedPerTranche[i] = thisTranche.principalAmount + thisTranche.accruedInterest
                + thisTranche.principalAmount.getInterest(thisTranche.aprBps, block.timestamp - thisTranche.startTime);
            balances[i] = testToken.balanceOf(thisTranche.lender);
            unchecked {
                ++i;
            }
        }

        /// @dev We have 3 tranches, first one paid back in full, second partially, none for last.
        uint256 repayment = owedPerTranche[0] + owedPerTranche[1] / 2;

        testToken.mint(address(this), repayment);
        testToken.approve(address(_distributor), repayment);
        _distributor.distribute(repayment, loan);

        uint256 trancheIndex = 0;
        assertEq(
            testToken.balanceOf(loan.tranche[trancheIndex].lender),
            balances[trancheIndex] + owedPerTranche[trancheIndex]
        );

        trancheIndex = 1;
        assertEq(
            testToken.balanceOf(loan.tranche[trancheIndex].lender),
            balances[trancheIndex] + owedPerTranche[trancheIndex] / 2
        );

        trancheIndex = 2;
        assertEq(testToken.balanceOf(loan.tranche[trancheIndex].lender), balances[trancheIndex]);
    }

    /// @dev Loan w/ 3 tranches
    function _getLoanWithTranches() private returns (uint256, IMultiSourceLoan.Loan memory) {
        (uint256 loanId, IMultiSourceLoan.Loan memory loan) = _setupMultipleRefi(2);
        uint256 extraPrincipal = 1e7;
        uint256 newApr = 1000;
        IMultiSourceLoan.RenegotiationOffer memory offer =
            _getSampleRenegotiationNewTranche(loanId, loan, extraPrincipal, newApr);
        offer.lender = address(9997);
        _addUser(offer.lender, offer.principalAmount, address(_msLoan));
        (loanId, loan) = _msLoan.addNewTranche(offer, loan, abi.encode());

        offer = _getSampleRenegotiationNewTranche(loanId, loan, extraPrincipal, newApr);
        offer.lender = address(9998);
        _addUser(offer.lender, offer.principalAmount, address(_msLoan));
        ++offer.renegotiationId;
        (loanId, loan) = _msLoan.addNewTranche(offer, loan, abi.encode());

        return (loanId, loan);
    }
}
