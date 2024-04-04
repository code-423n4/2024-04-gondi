// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.21;

import "../../interfaces/loans/IMultiSourceLoan.sol";
import "../LiquidationHandler.sol";

abstract contract BaseLoanHelpers is LiquidationHandler {
    function initialize(bytes32 _domainSeparator, bytes4 _magicValue) external virtual onlyOwner {}

    /// @notice Base ExecutionData Checks
    /// @dev Note that we do not validate fee < principalAmount since this is done in the child class in this case.
    /// @param _offerExecution The offer execution.
    /// @param _tokenId The token ID.
    /// @param _lender The lender.
    /// @param _offerer The initial offerer.
    /// @param _lenderOfferSignature The signature of the lender of LoanOffer.
    /// @param _feeFraction The protocol fee fraction.
    function validateOfferExecution(
        IMultiSourceLoan.OfferExecution calldata _offerExecution,
        uint256 _tokenId,
        address _lender,
        address _offerer,
        bytes calldata _lenderOfferSignature,
        uint256 _feeFraction
    ) external virtual {}

    function addNewTranche(
        uint256 _newLoanId,
        IMultiSourceLoan.Loan memory _loan,
        IMultiSourceLoan.RenegotiationOffer calldata _renegotiationOffer
    ) external view virtual returns (IMultiSourceLoan.Loan memory) {}

    function mergeTranches(
        IMultiSourceLoan.Loan memory _loan,
        uint256 _minTranche,
        uint256 _maxTranche,
        uint256 _totalSources
    ) external pure virtual returns (IMultiSourceLoan.Loan memory) {}
}
