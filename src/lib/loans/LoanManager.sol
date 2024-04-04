// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.21;

import "@openzeppelin/utils/structs/EnumerableSet.sol";

import "../../interfaces/loans/ILoanManager.sol";
import "../InputChecker.sol";
import "../utils/TwoStepOwned.sol";

/// TODO: Documentation
abstract contract LoanManager is ILoanManager, InputChecker, TwoStepOwned {
    using EnumerableSet for EnumerableSet.AddressSet;

    struct PendingCaller {
        address caller;
        bool isLoanContract;
    }

    /// @notice Time to wait before a new underwriter can be set.
    uint256 public immutable UPDATE_WAITING_TIME;

    /// @notice Pending accepted callers
    PendingCaller[] public getPendingAcceptedCallers;
    /// @notice Time when the pending accepted callers were set.
    uint256 public getPendingAcceptedCallersSetTime;
    /// @notice Set of accepted callers.
    EnumerableSet.AddressSet internal _acceptedCallers;
    /// @dev Keep this in a separate variable as well since we need the subset of loan contracts
    /// within acceptedCallers. Alternatively we could save this in a single struct but keep it
    /// this way for simplicity as we can use EnumerableSet.
    mapping(address => bool) internal _isLoanContract;
    /// @notice Underwriter contract
    address public getUnderwriter;
    /// @notice Pending underwriter contract.
    address public getPendingUnderwriter;
    /// @notice Time when the pending underwriter was set.
    uint256 public getPendingUnderwriterSetTime;

    event RequestCallersAdded(PendingCaller[] callers);
    event CallersAdded(PendingCaller[] callers);
    event PendingUnderwriterSet(address underwriter);
    event UnderwriterSet(address underwriter);

    error CallerNotAccepted();

    constructor(address _owner, address __underwriter, uint256 _updateWaitingTime)
        TwoStepOwned(_owner, _updateWaitingTime)
    {
        _checkAddressNotZero(__underwriter);

        getUnderwriter = __underwriter;
        UPDATE_WAITING_TIME = _updateWaitingTime;
        getPendingUnderwriterSetTime = type(uint256).max;
        getPendingAcceptedCallersSetTime = type(uint256).max;
    }

    modifier onlyAcceptedCallers() {
        if (!_acceptedCallers.contains(msg.sender)) {
            revert CallerNotAccepted();
        }
        _;
    }

    /// @notice First step in d a caller to the accepted callers list. Can be a Loan Contract or Liquidator.
    /// @param _callers The callers to add.
    function requestAddCallers(PendingCaller[] calldata _callers) external onlyOwner {
        getPendingAcceptedCallers = _callers;
        getPendingAcceptedCallersSetTime = block.timestamp;

        emit RequestCallersAdded(_callers);
    }

    /// @notice Second step in d a caller to the accepted callers list. Can be a Loan Contract or Liquidator.
    /// @dev Given repayments, we don't allow callers to be removed.
    /// @param _callers The callers to add.
    function addCallers(PendingCaller[] calldata _callers) external onlyOwner {
        if (getPendingAcceptedCallersSetTime + UPDATE_WAITING_TIME > block.timestamp) {
            revert TooSoonError();
        }
        PendingCaller[] memory pendingCallers = getPendingAcceptedCallers;
        for (uint256 i = 0; i < _callers.length;) {
            PendingCaller calldata caller = _callers[i];
            if (pendingCallers[i].caller != caller.caller || pendingCallers[i].isLoanContract != caller.isLoanContract)
            {
                revert InvalidInputError();
            }
            _acceptedCallers.add(caller.caller);
            _isLoanContract[caller.caller] = caller.isLoanContract;

            afterCallerAdded(caller.caller);
            unchecked {
                ++i;
            }
        }

        emit CallersAdded(_callers);
    }

    /// @notice Check if a caller is accepted.
    /// @param _caller The caller to check.
    /// @return Whether the caller is accepted.
    function isCallerAccepted(address _caller) external view returns (bool) {
        return _acceptedCallers.contains(_caller);
    }

    /// @notice First step in settting the Underwriter contract.
    /// @param __underwriter The new underwriter address.
    function setUnderwriter(address __underwriter) external onlyOwner {
        _checkAddressNotZero(__underwriter);

        getPendingUnderwriter = __underwriter;
        getPendingUnderwriterSetTime = block.timestamp;

        emit PendingUnderwriterSet(__underwriter);
    }

    /// @notice Confirm the Underwriter contract.
    /// @param __underwriter The new Underwriter address.
    function confirmUnderwriter(address __underwriter) external onlyOwner {
        if (getPendingUnderwriterSetTime + UPDATE_WAITING_TIME > block.timestamp) {
            revert TooSoonError();
        }
        if (getPendingUnderwriter != __underwriter) {
            revert InvalidInputError();
        }

        getUnderwriter = __underwriter;
        getPendingUnderwriter = address(0);
        getPendingUnderwriterSetTime = type(uint256).max;

        emit UnderwriterSet(__underwriter);
    }

    /// @notice Perform operations after a caller is added. I.e: ERC20s approvals.
    /// @param _caller The caller that was added.
    function afterCallerAdded(address _caller) internal virtual;

    /// @inheritdoc ILoanManager
    function validateOffer(bytes calldata _offer, uint256 _protocolFee) external virtual;

    /// @inheritdoc ILoanManager
    function loanRepayment(
        uint256 _loanId,
        uint256 _principalAmount,
        uint256 _apr,
        uint256 _accruedInterest,
        uint256 _protocolFee,
        uint256 _startTime
    ) external virtual;

    /// @inheritdoc ILoanManager
    function loanLiquidation(
        uint256 _loanId,
        uint256 _principalAmount,
        uint256 _apr,
        uint256 _accruedInterest,
        uint256 _protocolFee,
        uint256 _received,
        uint256 _startTime
    ) external virtual;
}
