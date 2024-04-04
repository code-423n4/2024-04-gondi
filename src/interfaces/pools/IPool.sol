// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.21;

/// @title Interface for a Pool.
/// @author Florida St
/// @notice A pool implements the ERC4626 standard and is focused on underwriting loans.
interface IPool {
    struct OptimalIdleRange {
        uint80 min;
        uint80 max;
        uint80 mid;
    }

    event PoolPaused(bool status);

    /// @notice Maximum number of withdrawal queues at any given point in time.
    function getMaxTotalWithdrawalQueues() external returns (uint256);

    /// @notice Minimum time between two withdrawal queues
    function getMinTimeBetweenWithdrawalQueues() external returns (uint256);

    /// @notice Get the base interest allocator contract address.
    function getBaseInterestAllocator() external returns (address);

    /// @notice Get the pool status.
    function isActive() external returns (bool);

    /// @notice Temporarily (un)pause the pool.
    function pausePool() external;

    /// @notice First stept in setting the pool's base interest rate allocator. If it's the first time,
    ///        (the base interest allocator is not set yet), it sets the base interest allocator.
    function setBaseInterestAllocator(address _newBaseInterestAllocator) external;

    /// @notice Second step in setting the pool's base interest rate allocator.
    function confirmBaseInterestAllocator(address _newBaseInterestAllocator) external;

    /// @notice Get the pending base interest allocator.
    function getPendingBaseInterestAllocator() external returns (address);

    /// @notice Get the time when the pending base interest allocator was set.
    function getPendingBaseInterestAllocatorSetTime() external returns (uint256);

    /// @notice Set optimal range for idle capital.
    function setOptimalIdleRange(OptimalIdleRange memory _optimalIdleRange) external;

    /// @notice Set the reallocation bonus. It mints reallocated * bonus shares to the caller.
    /// @param _newReallocationBonus The new reallocation bonus.
    function setReallocationBonus(uint256 _newReallocationBonus) external;

    /// @notice Reallocate idle capital to the base rate asset if not in optimal range.
    function reallocate() external returns (uint256);
}
