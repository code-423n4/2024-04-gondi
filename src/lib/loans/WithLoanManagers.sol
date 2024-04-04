// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.21;

import "@solmate/auth/Owned.sol";

abstract contract WithLoanManagers is Owned {
    mapping(address => bool) internal _loanManagers;

    event LoanManagerAdded(address loanManagerAdded);
    event LoanManagerRemoved(address loanManagerRemoved);

    constructor() Owned(tx.origin) {}

    function addLoanManager(address _loanManager) external onlyOwner {
        _loanManagers[_loanManager] = true;

        emit LoanManagerAdded(_loanManager);
    }

    function removeLoanManager(address _loanManager) external onlyOwner {
        _loanManagers[_loanManager] = false;

        emit LoanManagerRemoved(_loanManager);
    }

    function isLoanManager(address _loanManager) external view returns (bool) {
        return _loanManagers[_loanManager];
    }
}
