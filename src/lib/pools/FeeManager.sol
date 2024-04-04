// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.21;

import "@solmate/utils/FixedPointMathLib.sol";

import "../utils/TwoStepOwned.sol";
import "../../interfaces/pools/IFeeManager.sol";

/// @title FeeManager
/// @author Florida St
/// @notice Pool's Fee Manager
contract FeeManager is IFeeManager, TwoStepOwned {
    using FixedPointMathLib for uint256;

    uint256 public constant WAIT_TIME = 30 days;
    uint256 public constant PRECISION = 1e20;

    Fees private _fees;
    Fees private _pendingFees;
    uint256 private _pendingFeesSetTime;

    event PendingFeesSet(Fees fees);
    event PendingFeesConfirmed(Fees fees);

    error TwoSoonError();
    error InvalidFeesError();

    constructor(Fees memory __fees) TwoStepOwned(tx.origin, WAIT_TIME) {
        _fees = __fees;

        _pendingFeesSetTime = type(uint256).max;
    }

    /// @inheritdoc IFeeManager
    function getFees() external view returns (Fees memory) {
        return _fees;
    }

    /// @inheritdoc IFeeManager
    function setPendingFees(Fees calldata __fees) external onlyOwner {
        _pendingFees = __fees;
        _pendingFeesSetTime = block.timestamp;

        emit PendingFeesSet(__fees);
    }

    /// @inheritdoc IFeeManager
    function confirmFees(Fees calldata __fees) external {
        if (_pendingFeesSetTime + WAIT_TIME > block.timestamp) {
            revert TooSoonError();
        }
        if (_pendingFees.managementFee != __fees.managementFee || _pendingFees.performanceFee != __fees.performanceFee)
        {
            revert InvalidFeesError();
        }
        _fees = __fees;
        _pendingFeesSetTime = type(uint256).max;

        emit PendingFeesConfirmed(__fees);
    }

    /// @inheritdoc IFeeManager
    function getPendingFees() external view returns (Fees memory) {
        return _pendingFees;
    }

    /// @inheritdoc IFeeManager
    function getPendingFeesSetTime() external view returns (uint256) {
        return _pendingFeesSetTime;
    }

    /// @inheritdoc IFeeManager
    function processFees(uint256 _principal, uint256 _interest) external view returns (uint256) {
        /// @dev cached
        Fees memory __fees = _fees;
        return _principal.mulDivDown(__fees.managementFee, PRECISION)
            + _interest.mulDivDown(__fees.performanceFee, PRECISION);
    }
}
