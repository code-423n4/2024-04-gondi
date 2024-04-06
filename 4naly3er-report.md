# Report

- [Report](#report)
  - [Gas Optimizations](#gas-optimizations)
    - [\[GAS-1\] `a = a + b` is more gas effective than `a += b` for state variables (excluding arrays and mappings)](#gas-1-a--a--b-is-more-gas-effective-than-a--b-for-state-variables-excluding-arrays-and-mappings)
    - [\[GAS-2\] Use assembly to check for `address(0)`](#gas-2-use-assembly-to-check-for-address0)
    - [\[GAS-3\] Using bools for storage incurs overhead](#gas-3-using-bools-for-storage-incurs-overhead)
    - [\[GAS-4\] Cache array length outside of loop](#gas-4-cache-array-length-outside-of-loop)
    - [\[GAS-5\] State variables should be cached in stack variables rather than re-reading them from storage](#gas-5-state-variables-should-be-cached-in-stack-variables-rather-than-re-reading-them-from-storage)
    - [\[GAS-6\] Use calldata instead of memory for function arguments that do not get mutated](#gas-6-use-calldata-instead-of-memory-for-function-arguments-that-do-not-get-mutated)
    - [\[GAS-7\] For Operations that will not overflow, you could use unchecked](#gas-7-for-operations-that-will-not-overflow-you-could-use-unchecked)
    - [\[GAS-8\] Use Custom Errors instead of Revert Strings to save Gas](#gas-8-use-custom-errors-instead-of-revert-strings-to-save-gas)
    - [\[GAS-9\] Avoid contract existence checks by using low level calls](#gas-9-avoid-contract-existence-checks-by-using-low-level-calls)
    - [\[GAS-10\] Stack variable used as a cheaper cache for a state variable is only used once](#gas-10-stack-variable-used-as-a-cheaper-cache-for-a-state-variable-is-only-used-once)
    - [\[GAS-11\] State variables only set in the constructor should be declared `immutable`](#gas-11-state-variables-only-set-in-the-constructor-should-be-declared-immutable)
    - [\[GAS-12\] Functions guaranteed to revert when called by normal users can be marked `payable`](#gas-12-functions-guaranteed-to-revert-when-called-by-normal-users-can-be-marked-payable)
    - [\[GAS-13\] `++i` costs less gas compared to `i++` or `i += 1` (same for `--i` vs `i--` or `i -= 1`)](#gas-13-i-costs-less-gas-compared-to-i-or-i--1-same-for---i-vs-i---or-i---1)
    - [\[GAS-14\] Using `private` rather than `public` for constants, saves gas](#gas-14-using-private-rather-than-public-for-constants-saves-gas)
    - [\[GAS-15\] Use shift right/left instead of division/multiplication if possible](#gas-15-use-shift-rightleft-instead-of-divisionmultiplication-if-possible)
    - [\[GAS-16\] `uint256` to `bool` `mapping`: Utilizing Bitmaps to dramatically save on Gas](#gas-16-uint256-to-bool-mapping-utilizing-bitmaps-to-dramatically-save-on-gas)
    - [\[GAS-17\] Increments/decrements can be unchecked in for-loops](#gas-17-incrementsdecrements-can-be-unchecked-in-for-loops)
    - [\[GAS-18\] Use != 0 instead of \> 0 for unsigned integer comparison](#gas-18-use--0-instead-of--0-for-unsigned-integer-comparison)
    - [\[GAS-19\] `internal` functions not called by the contract should be removed](#gas-19-internal-functions-not-called-by-the-contract-should-be-removed)
    - [\[GAS-20\] WETH address definition can be use directly](#gas-20-weth-address-definition-can-be-use-directly)
  - [Non Critical Issues](#non-critical-issues)
    - [\[NC-1\] Missing checks for `address(0)` when assigning values to address state variables](#nc-1-missing-checks-for-address0-when-assigning-values-to-address-state-variables)
    - [\[NC-2\] Array indices should be referenced via `enum`s rather than via numeric literals](#nc-2-array-indices-should-be-referenced-via-enums-rather-than-via-numeric-literals)
    - [\[NC-3\] Use `string.concat()` or `bytes.concat()` instead of `abi.encodePacked`](#nc-3-use-stringconcat-or-bytesconcat-instead-of-abiencodepacked)
    - [\[NC-4\] `constant`s should be defined rather than using magic numbers](#nc-4-constants-should-be-defined-rather-than-using-magic-numbers)
    - [\[NC-5\] Control structures do not follow the Solidity Style Guide](#nc-5-control-structures-do-not-follow-the-solidity-style-guide)
    - [\[NC-6\] Delete rogue `console.log` imports](#nc-6-delete-rogue-consolelog-imports)
    - [\[NC-7\] Duplicated `require()`/`revert()` Checks Should Be Refactored To A Modifier Or Function](#nc-7-duplicated-requirerevert-checks-should-be-refactored-to-a-modifier-or-function)
    - [\[NC-8\] Unused `error` definition](#nc-8-unused-error-definition)
    - [\[NC-9\] Event missing indexed field](#nc-9-event-missing-indexed-field)
    - [\[NC-10\] Events that mark critical parameter changes should contain both the old and the new value](#nc-10-events-that-mark-critical-parameter-changes-should-contain-both-the-old-and-the-new-value)
    - [\[NC-11\] Function ordering does not follow the Solidity style guide](#nc-11-function-ordering-does-not-follow-the-solidity-style-guide)
    - [\[NC-12\] Functions should not be longer than 50 lines](#nc-12-functions-should-not-be-longer-than-50-lines)
    - [\[NC-13\] Change uint to uint256](#nc-13-change-uint-to-uint256)
    - [\[NC-14\] Lack of checks in setters](#nc-14-lack-of-checks-in-setters)
    - [\[NC-15\] Missing Event for critical parameters change](#nc-15-missing-event-for-critical-parameters-change)
    - [\[NC-16\] NatSpec is completely non-existent on functions that should have them](#nc-16-natspec-is-completely-non-existent-on-functions-that-should-have-them)
    - [\[NC-17\] Incomplete NatSpec: `@param` is missing on actually documented functions](#nc-17-incomplete-natspec-param-is-missing-on-actually-documented-functions)
    - [\[NC-18\] Incomplete NatSpec: `@return` is missing on actually documented functions](#nc-18-incomplete-natspec-return-is-missing-on-actually-documented-functions)
    - [\[NC-19\] File's first line is not an SPDX Identifier](#nc-19-files-first-line-is-not-an-spdx-identifier)
    - [\[NC-20\] Use a `modifier` instead of a `require/if` statement for a special `msg.sender` actor](#nc-20-use-a-modifier-instead-of-a-requireif-statement-for-a-special-msgsender-actor)
    - [\[NC-21\] Constant state variables defined more than once](#nc-21-constant-state-variables-defined-more-than-once)
    - [\[NC-22\] Consider using named mappings](#nc-22-consider-using-named-mappings)
    - [\[NC-23\] `address`s shouldn't be hard-coded](#nc-23-addresss-shouldnt-be-hard-coded)
    - [\[NC-24\] Variable names that consist of all capital letters should be reserved for `constant`/`immutable` variables](#nc-24-variable-names-that-consist-of-all-capital-letters-should-be-reserved-for-constantimmutable-variables)
    - [\[NC-25\] Owner can renounce while system is paused](#nc-25-owner-can-renounce-while-system-is-paused)
    - [\[NC-26\] Adding a `return` statement when the function defines a named return variable, is redundant](#nc-26-adding-a-return-statement-when-the-function-defines-a-named-return-variable-is-redundant)
    - [\[NC-27\] `require()` / `revert()` statements should have descriptive reason strings](#nc-27-requirerevertstatements-should-have-descriptive-reason-strings)
    - [\[NC-28\] Take advantage of Custom Error's return value property](#nc-28-take-advantage-of-custom-errors-return-value-property)
    - [\[NC-29\] Avoid the use of sensitive terms](#nc-29-avoid-the-use-of-sensitive-terms)
    - [\[NC-30\] Contract does not follow the Solidity style guide's suggested layout ordering](#nc-30-contract-does-not-follow-the-solidity-style-guides-suggested-layout-ordering)
    - [\[NC-31\] Use Underscores for Number Literals (add an underscore every 3 digits)](#nc-31-use-underscores-for-number-literals-add-an-underscore-every-3-digits)
    - [\[NC-32\] Internal and private variables and functions names should begin with an underscore](#nc-32-internal-and-private-variables-and-functions-names-should-begin-with-an-underscore)
    - [\[NC-33\] Event is missing `indexed` fields](#nc-33-event-is-missing-indexed-fields)
    - [\[NC-34\] Constants should be defined rather than using magic numbers](#nc-34-constants-should-be-defined-rather-than-using-magic-numbers)
    - [\[NC-35\] `public` functions not called by the contract should be declared `external` instead](#nc-35-public-functions-not-called-by-the-contract-should-be-declared-external-instead)
    - [\[NC-36\] Variables need not be initialized to zero](#nc-36-variables-need-not-be-initialized-to-zero)
  - [Low Issues](#low-issues)
    - [\[L-1\] `approve()`/`safeApprove()` may revert if the current approval is not zero](#l-1-approvesafeapprove-may-revert-if-the-current-approval-is-not-zero)
    - [\[L-2\] Use of `tx.origin` is unsafe in almost every context](#l-2-use-of-txorigin-is-unsafe-in-almost-every-context)
    - [\[L-3\] Some tokens may revert when zero value transfers are made](#l-3-some-tokens-may-revert-when-zero-value-transfers-are-made)
    - [\[L-4\] Missing checks for `address(0)` when assigning values to address state variables](#l-4-missing-checks-for-address0-when-assigning-values-to-address-state-variables)
    - [\[L-5\] `abi.encodePacked()` should not be used with dynamic types when passing the result to a hash function such as `keccak256()`](#l-5-abiencodepacked-should-not-be-used-with-dynamic-types-when-passing-the-result-to-a-hash-function-such-as-keccak256)
    - [\[L-6\] Use of `tx.origin` is unsafe in almost every context](#l-6-use-of-txorigin-is-unsafe-in-almost-every-context)
    - [\[L-7\] Deprecated approve() function](#l-7-deprecated-approve-function)
    - [\[L-8\] Division by zero not prevented](#l-8-division-by-zero-not-prevented)
    - [\[L-9\] `domainSeparator()` isn't protected against replay attacks in case of a future chain split](#l-9-domainseparator-isnt-protected-against-replay-attacks-in-case-of-a-future-chain-split)
    - [\[L-10\] Empty Function Body - Consider commenting why](#l-10-empty-function-body---consider-commenting-why)
    - [\[L-11\] Empty `receive()/payable fallback()` function does not authenticate requests](#l-11-empty-receivepayable-fallback-function-does-not-authenticate-requests)
    - [\[L-12\] External call recipient may consume all transaction gas](#l-12-external-call-recipient-may-consume-all-transaction-gas)
    - [\[L-13\] Initializers could be front-run](#l-13-initializers-could-be-front-run)
    - [\[L-14\] Signature use at deadlines should be allowed](#l-14-signature-use-at-deadlines-should-be-allowed)
    - [\[L-15\] Prevent accidentally burning tokens](#l-15-prevent-accidentally-burning-tokens)
    - [\[L-16\] NFT ownership doesn't support hard forks](#l-16-nft-ownership-doesnt-support-hard-forks)
    - [\[L-17\] Owner can renounce while system is paused](#l-17-owner-can-renounce-while-system-is-paused)
    - [\[L-18\] Possible rounding issue](#l-18-possible-rounding-issue)
    - [\[L-19\] Loss of precision](#l-19-loss-of-precision)
    - [\[L-20\] Solidity version 0.8.20+ may not work on other chains due to `PUSH0`](#l-20-solidity-version-0820-may-not-work-on-other-chains-due-to-push0)
    - [\[L-21\] Use `Ownable2Step.transferOwnership` instead of `Ownable.transferOwnership`](#l-21-use-ownable2steptransferownership-instead-of-ownabletransferownership)
    - [\[L-22\] Consider using OpenZeppelin's SafeCast library to prevent unexpected overflows when downcasting](#l-22-consider-using-openzeppelins-safecast-library-to-prevent-unexpected-overflows-when-downcasting)
    - [\[L-23\] Unsafe ERC20 operation(s)](#l-23-unsafe-erc20-operations)
    - [\[L-24\] Upgradeable contract not initialized](#l-24-upgradeable-contract-not-initialized)
    - [\[L-25\] A year is not always 365 days](#l-25-a-year-is-not-always-365-days)
  - [Medium Issues](#medium-issues)
    - [\[M-1\] Contracts are vulnerable to fee-on-transfer accounting-related issues](#m-1-contracts-are-vulnerable-to-fee-on-transfer-accounting-related-issues)
    - [\[M-2\] Centralization Risk for trusted owners](#m-2-centralization-risk-for-trusted-owners)
      - [Impact](#impact)
    - [\[M-3\] `_safeMint()` should be used rather than `_mint()` wherever possible](#m-3-_safemint-should-be-used-rather-than-_mint-wherever-possible)
    - [\[M-4\] Using `transferFrom` on ERC721 tokens](#m-4-using-transferfrom-on-erc721-tokens)
    - [\[M-5\] Fees can be set to be greater than 100%](#m-5-fees-can-be-set-to-be-greater-than-100)
    - [\[M-6\]  Solmate's SafeTransferLib does not check for token contract's existence](#m-6--solmates-safetransferlib-does-not-check-for-token-contracts-existence)
    - [\[M-7\] Return values of `transfer()`/`transferFrom()` not checked](#m-7-return-values-of-transfertransferfrom-not-checked)
    - [\[M-8\] Unsafe use of `transfer()`/`transferFrom()` with `IERC20`](#m-8-unsafe-use-of-transfertransferfrom-with-ierc20)

## Gas Optimizations

| |Issue|Instances|
|-|:-|:-:|
| [GAS-1](#GAS-1) | `a = a + b` is more gas effective than `a += b` for state variables (excluding arrays and mappings) | 38 |
| [GAS-2](#GAS-2) | Use assembly to check for `address(0)` | 8 |
| [GAS-3](#GAS-3) | Using bools for storage incurs overhead | 8 |
| [GAS-4](#GAS-4) | Cache array length outside of loop | 32 |
| [GAS-5](#GAS-5) | State variables should be cached in stack variables rather than re-reading them from storage | 14 |
| [GAS-6](#GAS-6) | Use calldata instead of memory for function arguments that do not get mutated | 7 |
| [GAS-7](#GAS-7) | For Operations that will not overflow, you could use unchecked | 397 |
| [GAS-8](#GAS-8) | Use Custom Errors instead of Revert Strings to save Gas | 8 |
| [GAS-9](#GAS-9) | Avoid contract existence checks by using low level calls | 12 |
| [GAS-10](#GAS-10) | Stack variable used as a cheaper cache for a state variable is only used once | 1 |
| [GAS-11](#GAS-11) | State variables only set in the constructor should be declared `immutable` | 38 |
| [GAS-12](#GAS-12) | Functions guaranteed to revert when called by normal users can be marked `payable` | 47 |
| [GAS-13](#GAS-13) | `++i` costs less gas compared to `i++` or `i += 1` (same for `--i` vs `i--` or `i -= 1`) | 3 |
| [GAS-14](#GAS-14) | Using `private` rather than `public` for constants, saves gas | 13 |
| [GAS-15](#GAS-15) | Use shift right/left instead of division/multiplication if possible | 2 |
| [GAS-16](#GAS-16) | `uint256` to `bool` `mapping`: Utilizing Bitmaps to dramatically save on Gas | 2 |
| [GAS-17](#GAS-17) | Increments/decrements can be unchecked in for-loops | 2 |
| [GAS-18](#GAS-18) | Use != 0 instead of > 0 for unsigned integer comparison | 17 |
| [GAS-19](#GAS-19) | `internal` functions not called by the contract should be removed | 8 |
| [GAS-20](#GAS-20) | WETH address definition can be use directly | 2 |

### <a name="GAS-1"></a>[GAS-1] `a = a + b` is more gas effective than `a += b` for state variables (excluding arrays and mappings)

This saves **16 gas per instance.**

*Instances (38)*:

```solidity
File: src/lib/AuctionWithBuyoutLoanLiquidator.sol

88:                 totalOwed += owed; 

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionWithBuyoutLoanLiquidator.sol)

```solidity
File: src/lib/LiquidationDistributor.sol

40:             totalPrincipalAndPaidInterestOwed += thisTranche.accruedInterest;

41:             totalPendingInterestOwed += pendingInterest;

42:             owedPerTranche[i] += thisTranche.principalAmount + thisTranche.accruedInterest + pendingInterest;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationDistributor.sol)

```solidity
File: src/lib/UserVault.sol

220:         _vaultERC20s[ETH][_vaultId] += msg.value;

310:         _vaultERC20s[_token][_vaultId] += _amount;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

306:             totalFeeTax += feeTax;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

271:             totalRefinanced += tranche.principalAmount;

272:             totalAnnualInterest += annualInterest;

273:             totalProtocolFee += thisProtocolFee;

582:             totalAnnualInterest += annualInterest;

583:             totalAccruedInterest += accruedInterest;

584:             totalProtocolFee += thisProtocolFee;

622:         accruedInterest += _tranche.accruedInterest;

722:         _loan.tranche[_renegotiationOffer.trancheIndex[lastIdx]].principalAmount += delta;

723:         _loan.principalAmount += delta;

943:                 totalProtocolFee += thisProtocolFee;

947:             totalRepayment += repayment;

1016:             totalAmount += amount;

1017:             totalAmountWithMaxInterest += amount + amount.getInterest(offer.aprBps, _duration);

1020:             totalFee += fee;

1027:                 _used[lender][offer.offerId] += amount;

1078:         _loan.principalAmount += _renegotiationOffer.principalAmount;

1124:             principalAmount += thisTranche.principalAmount;

1125:             cumAprBps += thisTranche.aprBps * thisTranche.principalAmount;

1126:             accruedInterest += thisTranche.accruedInterest;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/pools/Pool.sol

444:         getCollectedFees += fees;

461:         getCollectedFees += fees;

476:             totalOutstandingValue += _getOutstandingValue(queueOutstandingValues).mulDivDown(

504:         outstandingValues.accruedInterest += uint128(

509:         outstandingValues.sumApr += uint128(_apr * _principalAmount);

510:         outstandingValues.principalAmount += uint128(_principalAmount);

546:             getTotalReceived[idx] += _received;

547:             getAvailableToWithdraw += pendingToQueue;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/pools/WithdrawalQueue.sol

67:         getTotalShares += _shares;

97:         getWithdrawn[_tokenId] += available;

99:         _totalWithdrawn += available;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/WithdrawalQueue.sol)

```solidity
File: src/lib/utils/Interest.sol

27:             owed += tranche.principalAmount + tranche.accruedInterest

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/Interest.sol)

### <a name="GAS-2"></a>[GAS-2] Use assembly to check for `address(0)`

*Saves 6 gas per instance*

*Instances (8)*:

```solidity
File: src/lib/AuctionLoanLiquidator.sol

116:         if (liquidationDistributor == address(0) || currencyManager == address(0) || collectionManager == address(0)) {

198:         if (_auctions[_nftAddress][_tokenId] != bytes32(0)) {

266:         if (_auction.highestBidder == address(0)) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/InputChecker.sol

11:         if (_address == address(0)) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/InputChecker.sol)

```solidity
File: src/lib/UserVault.sol

88:         if (_ownerOf[_vaultId] == address(0)) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

909:             } else if ((totalValidators == 1) && (_loanOffer.validators[0].validator == address(0))) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/pools/Pool.sol

204:         if (cachedAllocator != address(0)) {

362:             if (_deployedQueues[idx].contractAddress == address(0)) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

### <a name="GAS-3"></a>[GAS-3] Using bools for storage incurs overhead

Use uint256(1) and uint256(2) for true/false to avoid a Gwarmaccess (100 gas), and to avoid Gsset (20000 gas) when changing from ‘false’ to ‘true’, after having been ‘true’ in the past. See [source](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/58f635312aa21f947cae5f8578638a85aa2519f5/contracts/security/ReentrancyGuard.sol#L23-L27).

*Instances (8)*:

```solidity
File: src/lib/AddressManager.sol

27:     mapping(address => bool) private _whitelist;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AddressManager.sol)

```solidity
File: src/lib/callbacks/CallbackHandler.sol

14:     mapping(address => bool) internal _isWhitelistedCallbackContract;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/CallbackHandler.sol)

```solidity
File: src/lib/loans/BaseLoan.sol

52:     mapping(address => mapping(uint256 => bool)) public isOfferCancelled;

57:     mapping(address => mapping(uint256 => bool)) public isRenegotiationOfferCancelled;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoan.sol)

```solidity
File: src/lib/loans/LoanManager.sol

31:     mapping(address => bool) internal _isLoanContract;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManager.sol)

```solidity
File: src/lib/loans/LoanManagerRegistry.sol

9:     mapping(address => bool) private _loanManagers;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManagerRegistry.sol)

```solidity
File: src/lib/loans/WithLoanManagers.sol

7:     mapping(address => bool) internal _loanManagers;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/WithLoanManagers.sol)

```solidity
File: src/lib/pools/Pool.sol

94:     bool public isActive;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

### <a name="GAS-4"></a>[GAS-4] Cache array length outside of loop

If not cached, the solidity compiler will always read the length of the array during each iteration. That is, if it is a storage array, this is an extra sload operation (100 additional extra gas for each iteration except for the first) and if it is a memory array, this is an extra mload operation (3 additional gas for each iteration except for the first).

*Instances (32)*:

```solidity
File: src/lib/AuctionWithBuyoutLoanLiquidator.sol

69:         for (uint256 i = 0; i < _loan.tranche.length;) {

83:         for (uint256 i; i < _loan.tranche.length;) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionWithBuyoutLoanLiquidator.sol)

```solidity
File: src/lib/LiquidationDistributor.sol

36:         for (uint256 i = 0; i < _loan.tranche.length;) {

49:             for (uint256 i = 0; i < _loan.tranche.length;) {

63:             for (uint256 i = 0; i < _loan.tranche.length && _proceeds > 0;) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationDistributor.sol)

```solidity
File: src/lib/Multicall.sol

13:         for (uint256 i = 0; i < data.length;) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/Multicall.sol)

```solidity
File: src/lib/UserVault.sol

132:         for (uint256 i = 0; i < _collections.length;) {

138:         for (uint256 i = 0; i < _tokens.length;) {

176:         for (uint256 i = 0; i < _tokenIds.length;) {

200:         for (uint256 i = 0; i < _tokenIds.length;) {

237:         for (uint256 i = 0; i < _collections.length;) {

257:         for (uint256 i = 0; i < _collections.length;) {

272:         for (uint256 i = 0; i < _tokens.length;) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

108:         for (uint256 i; i < encodedOutput.length;) {

132:         for (uint256 i = 0; i < _executionData.length;) {

302:         for (uint256 i; i < _loan.tranche.length;) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/LoanManager.sol

81:         for (uint256 i = 0; i < _callers.length;) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManager.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

257:         for (uint256 i; i < _renegotiationOffer.trancheIndex.length;) {

570:         for (uint256 i = 0; i < _loan.tranche.length;) {

936:         for (uint256 i; i < loan.tranche.length;) {

999:         for (uint256 i = 0; i < _offerExecution.length;) {

1144:         for (; originalIndex < _loan.tranche.length;) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/pools/Pool.sol

627:         for (uint256 i; i < _acceptedCallers.length();) {

692:         for (uint256 i; i < pendingWithdrawal.length;) {

701:         for (uint256 i; i < pendingWithdrawal.length;) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/pools/PoolOfferHandler.sol

84:         for (uint256 i = 0; i < __terms.length; i++) {

104:         for (uint256 i = 0; i < __terms.length; i++) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/PoolOfferHandler.sol)

```solidity
File: src/lib/utils/Hash.sol

41:         for (uint256 i = 0; i < _loanOffer.validators.length;) {

85:         for (uint256 i = 0; i < _executionData.offerExecution.length;) {

119:         for (uint256 i; i < _loan.tranche.length;) {

142:         for (uint256 i = 0; i < _refinanceOffer.trancheIndex.length;) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/Hash.sol)

```solidity
File: src/lib/utils/Interest.sol

25:         for (uint256 i = 0; i < _loan.tranche.length;) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/Interest.sol)

### <a name="GAS-5"></a>[GAS-5] State variables should be cached in stack variables rather than re-reading them from storage

The instances below point to the second+ access of a state variable within a function. Caching of a state variable replaces each Gwarmaccess (100 gas) with a much cheaper stack read. Other less obvious fixes/optimizations include having local memory caches of state variable structs, or having local caches of state variable contracts/addresses.

*Saves 100 gas per instance*

*Instances (14)*:

```solidity
File: src/lib/LiquidationHandler.sol

103:             liquidation = ILoanLiquidator(_loanLiquidator).liquidateLoan(

112:             emit LoanSentToLiquidator(_loanId, _loanLiquidator);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationHandler.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

246:         emit MultiSourceLoanUpdated(_pendingMultiSourceLoanAddress);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

536:         INFTFlashAction(getFlashActionContract).execute(

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

68:             IAaveLendingPool(_aavePool).deposit(_usdc, delta, address(this), 0);

71:             IAaveLendingPool(_aavePool).withdraw(_usdc, delta, address(this));

71:             IAaveLendingPool(_aavePool).withdraw(_usdc, delta, address(this));

72:             ERC20(_usdc).transfer(pool, delta);

84:         ERC20(_usdc).transfer(pool, total);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/Pool.sol

400:             IBaseInterestAllocator(getBaseInterestAllocator).getBaseAprWithUpdate(), _offer

410:             IBaseInterestAllocator(getBaseInterestAllocator).reallocate(

585:         IBaseInterestAllocator(getBaseInterestAllocator).reallocate(currentBalance, targetIdle, false);

600:         IBaseInterestAllocator(getBaseInterestAllocator).reallocate(currentBalance, _withdrawn + targetIdle, true);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/pools/WithdrawalQueue.sol

69:         emit WithdrawalPositionMinted(getNextTokenId, _to, _shares);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/WithdrawalQueue.sol)

### <a name="GAS-6"></a>[GAS-6] Use calldata instead of memory for function arguments that do not get mutated

When a function with a `memory` array is called externally, the `abi.decode()` step has to use a for-loop to copy each index of the `calldata` to the `memory` index. Each iteration of this for-loop costs at least 60 gas (i.e. `60 * <mem_array>.length`). Using `calldata` directly bypasses this loop.

If the array is passed to an `internal` function which passes the array to another internal function where the array is modified and therefore `memory` is used in the `external` call, it's still more gas-efficient to use `calldata` when the `external` function uses modifiers, since the modifiers may prevent the internal functions from being called. Structs have the same overhead as an array of length one.

 *Saves 60 gas per instance*

*Instances (7)*:

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

144:     function afterPrincipalTransfer(IMultiSourceLoan.Loan memory _loan, uint256 _fee, bytes calldata _executionData)

182:     function afterNFTTransfer(IMultiSourceLoan.Loan memory _loan, bytes calldata _executionData)

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/BaseLoanHelpers.sol

29:         IMultiSourceLoan.Loan memory _loan,

34:         IMultiSourceLoan.Loan memory _loan,

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoanHelpers.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

235:     function refinancePartial(RenegotiationOffer calldata _renegotiationOffer, Loan memory _loan)

351:         Loan memory _loan,

389:     function mergeTranches(uint256 _loanId, Loan memory _loan, uint256 _minTranche, uint256 _maxTranche)

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

### <a name="GAS-7"></a>[GAS-7] For Operations that will not overflow, you could use unchecked

*Instances (397)*:

```solidity
File: src/lib/AddressManager.sol

4: import "@solmate/auth/Owned.sol";

5: import "@solmate/utils/ReentrancyGuard.sol";

7: import "./InputChecker.sol";

36:                 ++i;

90:             ++_lastAdded;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AddressManager.sol)

```solidity
File: src/lib/AuctionLoanLiquidator.sol

4: import "@openzeppelin/utils/structs/EnumerableSet.sol";

5: import "@solmate/auth/Owned.sol";

6: import "@solmate/utils/FixedPointMathLib.sol";

7: import "@solmate/utils/ReentrancyGuard.sol";

8: import "@solmate/utils/SafeTransferLib.sol";

9: import "@solmate/tokens/ERC20.sol";

10: import "@solmate/tokens/ERC721.sol";

12: import "../interfaces/ILiquidationDistributor.sol";

13: import "../interfaces/IAuctionLoanLiquidator.sol";

14: import "../interfaces/ILoanLiquidator.sol";

15: import "../interfaces/loans/IMultiSourceLoan.sol";

16: import "./AddressManager.sol";

17: import "./InputChecker.sol";

18: import "./utils/Hash.sol";

230:         if (_bid == 0 || (currentHighestBid.mulDivDown(_BPS + MIN_INCREMENT_BPS, _BPS) >= _bid)) {

235:         uint96 expiration = _auction.startTime + _auction.duration;

236:         uint96 withMargin = _auction.lastBidTime + _MIN_NO_ACTION_MARGIN;

271:         uint96 expiration = _auction.startTime + _auction.duration;

272:         uint96 withMargin = _auction.lastBidTime + _MIN_NO_ACTION_MARGIN;

282:         uint256 proceeds = highestBid - 2 * triggerFee;

332:         if (_bid == 0 || (_auction.highestBid.mulDivDown(_BPS + MIN_INCREMENT_BPS, _BPS) >= _bid)) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/AuctionWithBuyoutLoanLiquidator.sol

4: import "./utils/Interest.sol";

5: import "./AuctionLoanLiquidator.sol";

63:         uint256 timeLimit = _auction.startTime + _timeForMainLenderToBuy;

75:                 ++i;

86:                 uint256 owed = thisTranche.principalAmount + thisTranche.accruedInterest

87:                     + thisTranche.principalAmount.getInterest(thisTranche.aprBps, block.timestamp - thisTranche.startTime);

88:                 totalOwed += owed; 

92:                 ++i;

128:         uint256 timeLimit = _auction.startTime + _timeForMainLenderToBuy;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionWithBuyoutLoanLiquidator.sol)

```solidity
File: src/lib/LiquidationDistributor.sol

4: import "@solmate/utils/FixedPointMathLib.sol";

5: import "@solmate/utils/ReentrancyGuard.sol";

6: import "@solmate/utils/SafeTransferLib.sol";

7: import "@solmate/tokens/ERC20.sol";

9: import "../interfaces/ILiquidationDistributor.sol";

10: import "../interfaces/loans/IMultiSourceLoan.sol";

11: import "../interfaces/loans/ILoanManagerRegistry.sol";

12: import "./loans/LoanManager.sol";

13: import "./loans/WithLoanManagers.sol";

14: import "./utils/Interest.sol";

39:                 thisTranche.principalAmount.getInterest(thisTranche.aprBps, block.timestamp - thisTranche.startTime);

40:             totalPrincipalAndPaidInterestOwed += thisTranche.accruedInterest;

41:             totalPendingInterestOwed += pendingInterest;

42:             owedPerTranche[i] += thisTranche.principalAmount + thisTranche.accruedInterest + pendingInterest;

44:                 ++i;

48:         if (_proceeds > totalPrincipalAndPaidInterestOwed + totalPendingInterestOwed) {

56:                     totalPrincipalAndPaidInterestOwed + totalPendingInterestOwed

59:                     ++i;

69:                     ++i;

82:         uint256 excess = _proceeds - _totalOwed;

84:         uint256 owed = _tranche.principalAmount + _tranche.accruedInterest

85:             + _tranche.principalAmount.getInterest(_tranche.aprBps, block.timestamp - _tranche.startTime);

86:         uint256 total = owed + excess.mulDivDown(owed, _totalOwed);

101:             _proceedsLeft -= _trancheOwed;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationDistributor.sol)

```solidity
File: src/lib/LiquidationHandler.sol

4: import "@solmate/auth/Owned.sol";

5: import "@solmate/tokens/ERC721.sol";

6: import "@solmate/utils/ReentrancyGuard.sol";

8: import "../interfaces/ILiquidationHandler.sol";

9: import "../interfaces/loans/IMultiSourceLoan.sol";

10: import "./callbacks/CallbackHandler.sol";

11: import "./InputChecker.sol";

90:         uint256 expirationTime = _loan.startTime + _loan.duration;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationHandler.sol)

```solidity
File: src/lib/Multicall.sol

4: import "../interfaces/IMulticall.sol";

18:                 ++i;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/Multicall.sol)

```solidity
File: src/lib/UserVault.sol

4: import "@openzeppelin/utils/Strings.sol";

5: import "@solmate/auth/Owned.sol";

6: import "@solmate/tokens/ERC721.sol";

7: import "@solmate/utils/SafeTransferLib.sol";

9: import "../interfaces/IOldERC721.sol";

10: import "./AddressManager.sol";

11: import "../interfaces/IUserVault.sol";

19:     string private constant _BASE_URI = "https://gondi.xyz/user_vaults/";

113:             _vaultId = ++_nextId;

135:                 ++i;

141:                 ++i;

179:                 ++i;

203:                 ++i;

220:         _vaultERC20s[ETH][_vaultId] += msg.value;

240:                 ++i;

260:                 ++i;

275:                 ++i;

310:         _vaultERC20s[_token][_vaultId] += _amount;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/callbacks/CallbackHandler.sol

4: import "../utils/TwoStepOwned.sol";

5: import "../InputChecker.sol";

6: import "../utils/WithProtocolFee.sol";

7: import "../../interfaces/callbacks/ILoanCallback.sol";

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/CallbackHandler.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

4: import "@seaport/seaport-types/src/lib/ConsiderationStructs.sol";

5: import "@solmate/auth/Owned.sol";

6: import "@solmate/tokens/ERC721.sol";

7: import "@solmate/tokens/WETH.sol";

8: import "@solmate/utils/FixedPointMathLib.sol";

9: import "@solmate/utils/SafeTransferLib.sol";

11: import "../../interfaces/external/IReservoir.sol";

12: import "../../interfaces/callbacks/IPurchaseBundler.sol";

13: import "../../interfaces/callbacks/ILoanCallback.sol";

14: import "../../interfaces/external/ICryptoPunksMarket.sol";

15: import "../../interfaces/external/IWrappedPunk.sol";

16: import "../utils/WithProtocolFee.sol";

17: import "../loans/MultiSourceLoan.sol";

18: import "../utils/BytesLib.sol";

19: import "../AddressManager.sol";

20: import "../InputChecker.sol";

111:                 ++i;

137:                 ++i;

157:         uint256 borrowed = _loan.principalAmount - _fee;

283:         if (block.timestamp < _pendingTaxesSetTime + TAX_UPDATE_NOTICE) {

306:             totalFeeTax += feeTax;

307:             ERC20(principalAddress).safeTransferFrom(borrower, tranche.lender, taxCost - feeTax);

309:                 ++i;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/BaseLoan.sol

4: import "@openzeppelin/utils/cryptography/MessageHashUtils.sol";

5: import "@openzeppelin/interfaces/IERC1271.sol";

7: import "@solmate/auth/Owned.sol";

8: import "@solmate/tokens/ERC721.sol";

9: import "@solmate/utils/FixedPointMathLib.sol";

11: import "../../interfaces/loans/IBaseLoan.sol";

12: import "../utils/Hash.sol";

13: import "../AddressManager.sol";

14: import "../LiquidationHandler.sol";

15: import "./WithLoanManagers.sol";

199:             return ++getTotalLoansIssued;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoan.sol)

```solidity
File: src/lib/loans/BaseLoanHelpers.sol

4: import "../../interfaces/loans/IMultiSourceLoan.sol";

5: import "../LiquidationHandler.sol";

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoanHelpers.sol)

```solidity
File: src/lib/loans/LoanManager.sol

4: import "@openzeppelin/utils/structs/EnumerableSet.sol";

6: import "../../interfaces/loans/ILoanManager.sol";

7: import "../InputChecker.sol";

8: import "../utils/TwoStepOwned.sol";

77:         if (getPendingAcceptedCallersSetTime + UPDATE_WAITING_TIME > block.timestamp) {

92:                 ++i;

120:         if (getPendingUnderwriterSetTime + UPDATE_WAITING_TIME > block.timestamp) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManager.sol)

```solidity
File: src/lib/loans/LoanManagerRegistry.sol

4: import "@solmate/auth/Owned.sol";

6: import "../../interfaces/loans/ILoanManagerRegistry.sol";

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManagerRegistry.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

4: import "@delegate/IDelegateRegistry.sol";

5: import "@openzeppelin/utils/cryptography/ECDSA.sol";

6: import "@solmate/tokens/ERC20.sol";

7: import "@solmate/tokens/ERC721.sol";

8: import "@solmate/utils/FixedPointMathLib.sol";

9: import "@solmate/utils/ReentrancyGuard.sol";

10: import "@solmate/utils/SafeTransferLib.sol";

12: import "../../interfaces/validators/IOfferValidator.sol";

13: import "../../interfaces/INFTFlashAction.sol";

14: import "../../interfaces/loans/ILoanManager.sol";

15: import "../../interfaces/loans/ILoanManagerRegistry.sol";

16: import "../../interfaces/loans/IMultiSourceLoan.sol";

17: import "../utils/Hash.sol";

18: import "../utils/Interest.sol";

19: import "../Multicall.sol";

20: import "./BaseLoan.sol";

174:         uint256 netNewLender = _renegotiationOffer.principalAmount - _renegotiationOffer.fee;

178:             if (_isLoanLocked(_loan.startTime, _loan.startTime + _loan.duration)) {

184:                 _renegotiationOffer.duration + block.timestamp,

185:                 _loan.duration + _loan.startTime,

187:                 totalAnnualInterest / _loan.principalAmount,

195:             netNewLender -= totalAccruedInterest;

201:                 _loan.borrower, _renegotiationOffer.lender, _loan.principalAmount - netNewLender

205:                 _renegotiationOffer.lender, _loan.borrower, netNewLender - _loan.principalAmount

221:         _loan.duration = (block.timestamp - _loan.startTime) + _renegotiationOffer.duration;

242:         if (_isLoanLocked(_loan.startTime, _loan.startTime + _loan.duration)) {

268:                 _loan.startTime + _loan.duration,

271:             totalRefinanced += tranche.principalAmount;

272:             totalAnnualInterest += annualInterest;

273:             totalProtocolFee += thisProtocolFee;

281:                 ++i;

369:             _renegotiationOffer.lender, _loan.borrower, _renegotiationOffer.principalAmount - _renegotiationOffer.fee

576:                 _loan.startTime + _loan.duration,

582:             totalAnnualInterest += annualInterest;

583:             totalAccruedInterest += accruedInterest;

584:             totalProtocolFee += thisProtocolFee;

586:                 ++i;

615:         annualInterest = _tranche.principalAmount * _tranche.aprBps;

616:         accruedInterest = _tranche.principalAmount.getInterest(_tranche.aprBps, block.timestamp - _tranche.startTime);

622:         accruedInterest += _tranche.accruedInterest;

637:                 _lender, _tranche.lender, _tranche.principalAmount + accruedInterest - thisProtocolFee

649:         if (_loan.startTime + _loan.duration < block.timestamp) {

702:                 && ((_currentAprBps - _targetAprBps).mulDivDown(_PRECISION, _currentAprBps) < __minimum.interest)

714:         uint256 lastIdx = _renegotiationOffer.trancheIndex.length - 1;

716:             _totalAnnualInterest < _renegotiationOffer.principalAmount * _renegotiationOffer.aprBps

717:                 || _renegotiationOffer.trancheIndex[lastIdx] != _loan.tranche.length - 1

721:         uint256 delta = _renegotiationOffer.principalAmount - _totalRefinanced;

722:         _loan.tranche[_renegotiationOffer.trancheIndex[lastIdx]].principalAmount += delta;

723:         _loan.principalAmount += delta;

729:         return _trancheStartTime + (_loanEndTime - _trancheStartTime).mulDivUp(_minLockPeriod, _PRECISION);

734:         return block.timestamp > _loanEndTime - (_loanEndTime - _loanStartTime).mulDivUp(_minLockPeriod, _PRECISION);

773:         if (_offerExecution.amount + _totalAmount > offer.principalAmount) {

774:             revert InvalidAmountError(_offerExecution.amount + _totalAmount, offer.principalAmount);

783:         if ((offer.capacity > 0) && (_used[_offerer][offer.offerId] + _offerExecution.amount > offer.capacity)) {

837:                 (_offerPrincipalAmount - _loanPrincipalAmount > 0)

839:                         (_loanAprBps * _loanPrincipalAmount - _offerAprBps * _offerPrincipalAmount).mulDivDown(

840:                             _PRECISION, _loanAprBps * _loanPrincipalAmount

916:                     ++i;

923:         return _loanPrincipal / (_MAX_RATIO_TRANCHE_MIN_PRINCIPAL * getMaxTranches);

939:                 tranche.principalAmount.getInterest(tranche.aprBps, block.timestamp - tranche.startTime);

943:                 totalProtocolFee += thisProtocolFee;

945:             uint256 repayment = tranche.principalAmount + tranche.accruedInterest + newInterest - thisProtocolFee;

947:             totalRepayment += repayment;

959:                 ++i;

1016:             totalAmount += amount;

1017:             totalAmountWithMaxInterest += amount + amount.getInterest(offer.aprBps, _duration);

1020:             totalFee += fee;

1025:             ERC20(offer.principalAddress).safeTransferFrom(lender, _principalReceiver, amount - fee);

1027:                 _used[lender][offer.offerId] += amount;

1034:                 ++i;

1058:         IMultiSourceLoan.Tranche[] memory tranches = new IMultiSourceLoan.Tranche[](newTrancheIndex + 1);

1064:                 ++i;

1078:         _loan.principalAmount += _renegotiationOffer.principalAmount;

1095:         if (_minTranche >= _maxTranche - 1) {

1100:             new IMultiSourceLoan.Tranche[](_loan.tranche.length - (_maxTranche - _minTranche) + 1);

1107:                 ++originalIndex;

1124:             principalAmount += thisTranche.principalAmount;

1125:             cumAprBps += thisTranche.aprBps * thisTranche.principalAmount;

1126:             accruedInterest += thisTranche.accruedInterest;

1128:                 ++originalIndex;

1139:             cumAprBps / principalAmount

1143:         uint256 remainingIndex = _minTranche + 1;

1147:                 ++originalIndex;

1148:                 ++remainingIndex;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/loans/WithLoanManagers.sol

4: import "@solmate/auth/Owned.sol";

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/WithLoanManagers.sol)

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

4: import "@solmate/auth/Owned.sol";

5: import "@solmate/tokens/ERC20.sol";

6: import "@solmate/tokens/WETH.sol";

7: import "@solmate/utils/FixedPointMathLib.sol";

9: import "./Pool.sol";

10: import "../../interfaces/external/IAaveLendingPool.sol";

11: import "../../interfaces/pools/IBaseInterestAllocator.sol";

66:             uint256 delta = _currentIdle - _targetIdle;

70:             uint256 delta = _targetIdle - _currentIdle;

103:         return currentLiquidityRate * _BPS / _RAY;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/FeeManager.sol

4: import "@solmate/utils/FixedPointMathLib.sol";

6: import "../utils/TwoStepOwned.sol";

7: import "../../interfaces/pools/IFeeManager.sol";

49:         if (_pendingFeesSetTime + WAIT_TIME > block.timestamp) {

77:             + _interest.mulDivDown(__fees.performanceFee, PRECISION);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/FeeManager.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

4: import "@solmate/auth/Owned.sol";

5: import "@solmate/tokens/ERC20.sol";

6: import "@solmate/tokens/WETH.sol";

7: import "@solmate/utils/FixedPointMathLib.sol";

9: import "./Pool.sol";

10: import "../../interfaces/external/ICurve.sol";

11: import "../../interfaces/external/ILido.sol";

12: import "../../interfaces/pools/IBaseInterestAllocator.sol";

78:         if (block.timestamp - lidoData.lastTs > getLidoUpdateTolerance) {

81:                 _BPS * _SECONDS_PER_YEAR * (shareRate - lidoData.shareRate) / lidoData.shareRate

82:                     / (block.timestamp - lidoData.lastTs)

94:         if (block.timestamp - lidoData.lastTs > getLidoUpdateTolerance) {

118:             uint256 amount = _currentIdle - _targetIdle;

125:             _exchangeAndSendWeth(pool, _targetIdle - _currentIdle, _force);

141:         return lido.getTotalPooledEther() * 1e27 / lido.getTotalShares();

155:         uint256 received = ICurve(_curvePool).exchange(1, 0, _amount, _amount.mulDivUp(_BPS - slippage, _BPS));

163:             _BPS * _SECONDS_PER_YEAR * (shareRate - _lidoData.shareRate) / _lidoData.shareRate

164:                 / (block.timestamp - _lidoData.lastTs)

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/Pool.sol

4: import "@solmate/tokens/ERC4626.sol";

5: import "@solmate/utils/FixedPointMathLib.sol";

6: import "@solmate/utils/ReentrancyGuard.sol";

7: import "@solmate/utils/SafeTransferLib.sol";

9: import "../../interfaces/pools/IBaseInterestAllocator.sol";

10: import "../../interfaces/pools/IFeeManager.sol";

11: import "../../interfaces/pools/IPool.sol";

12: import "../../interfaces/pools/IPoolWithWithdrawalQueues.sol";

13: import "../../interfaces/pools/IPoolOfferHandler.sol";

14: import "../loans/LoanManager.sol";

15: import "../utils/Interest.sol";

16: import "./WithdrawalQueue.sol";

152:         _optimalIdleRange.mid = (_optimalIdleRange.min + _optimalIdleRange.max) / 2;

163:         getMinTimeBetweenWithdrawalQueues = (IPoolOfferHandler(_offerHandler).getMaxDuration() + _LOAN_BUFFER_TIME)

166:         _deployedQueues = new DeployedQueue[](_maxTotalWithdrawalQueues + 1);

170:         _queueOutstandingValues = new OutstandingValues[](_maxTotalWithdrawalQueues + 1);

171:         _queueAccounting = new QueueAccounting[](_maxTotalWithdrawalQueues + 1);

185:         _optimalIdleRange.mid = (_optimalIdleRange.min + _optimalIdleRange.max) / 2;

205:             if (getPendingBaseInterestAllocatorSetTime + UPDATE_WAITING_TIME > block.timestamp) {

240:         return _getUndeployedAssets() + _getTotalOutstandingValue();

275:         shares = previewWithdraw(assets); // No need to check for rounding error, previewWithdraw rounds up.

277:             uint256 allowed = allowance[owner][msg.sender]; // Saves gas for limited approvals.

279:             if (allowed != type(uint256).max) allowance[owner][msg.sender] = allowed - shares;

287:             uint256 allowed = allowance[owner][msg.sender]; // Saves gas for limited approvals.

289:             if (allowed != type(uint256).max) allowance[owner][msg.sender] = allowed - shares;

323:         if (block.timestamp - queue.deployedTime < getMinTimeBetweenWithdrawalQueues) {

334:         uint256 lastQueueIndex = (pendingQueueIndex + 1) % totalQueues;

341:             uint128((totalSupplyCached - sharesPendingWithdrawal).mulDivDown(PRINCIPAL_PRECISION, totalSupplyCached));

347:         _queueClaimAll(proRataLiquid + getAvailableToWithdraw, pendingQueueIndex);

355:         uint256 baseIdx = pendingQueueIndex + totalQueues;

360:         for (uint256 i = 1; i < totalQueues - 1;) {

361:             uint256 idx = (baseIdx - i) % totalQueues;

368:             _queueAccounting[idx].netPoolFraction -= newQueueFraction;

371:                 ++i;

387:             totalSupply -= sharesPendingWithdrawal;

396:         uint256 currentBalance = asset.balanceOf(address(this)) - getAvailableToWithdraw;

398:         uint256 undeployedAssets = currentBalance + baseRateBalance;

411:                 currentBalance, principalAmount - currentBalance, true

421:         uint256 delta = currentBalance > targetIdle ? currentBalance - targetIdle : targetIdle - currentBalance;

422:         uint256 shares = delta.mulDivDown(totalSupply * getReallocationBonus, totalAssets() * _BPS);

441:         uint256 interestEarned = _principalAmount.getInterest(netApr, block.timestamp - _startTime);

442:         uint256 received = _principalAmount + interestEarned;

444:         getCollectedFees += fees;

445:         _loanTermination(msg.sender, _loanId, _principalAmount, netApr, interestEarned, received - fees);

459:         uint256 interestEarned = _principalAmount.getInterest(netApr, block.timestamp - _startTime);

461:         getCollectedFees += fees;

462:         _loanTermination(msg.sender, _loanId, _principalAmount, netApr, interestEarned, _received - fees);

471:         uint256 newest = (_pendingQueueIndex + totalQueues - 1) % totalQueues;

472:         for (uint256 i; i < totalQueues - 1;) {

473:             uint256 idx = (newest + totalQueues - i) % totalQueues;

476:             totalOutstandingValue += _getOutstandingValue(queueOutstandingValues).mulDivDown(

480:                 ++i;

489:         return principal + uint256(__outstandingValues.accruedInterest)

490:             + principal.getInterest(

491:                 uint256(_outstandingApr(__outstandingValues)), block.timestamp - uint256(__outstandingValues.lastTs)

504:         outstandingValues.accruedInterest += uint128(

506:                 uint256(_outstandingApr(outstandingValues)), block.timestamp - uint256(outstandingValues.lastTs)

509:         outstandingValues.sumApr += uint128(_apr * _principalAmount);

510:         outstandingValues.principalAmount += uint128(_principalAmount);

525:         uint256 totalQueues = getMaxTotalWithdrawalQueues + 1;

530:             idx = (pendingIndex + i) % totalQueues;

535:                 ++i;

545:                 _received.mulDivDown(PRINCIPAL_PRECISION - _queueAccounting[idx].netPoolFraction, PRINCIPAL_PRECISION);

546:             getTotalReceived[idx] += _received;

547:             getAvailableToWithdraw += pendingToQueue;

564:         return asset.balanceOf(address(this)) + IBaseInterestAllocator(getBaseInterestAllocator).getAssetsAllocated()

565:             - getAvailableToWithdraw - getCollectedFees;

572:         uint256 currentBalance = asset.balanceOf(address(this)) - getAvailableToWithdraw;

577:         uint256 total = currentBalance + baseRateBalance;

598:         uint256 finalBalance = currentBalance + baseRateBalance - _withdrawn;

600:         IBaseInterestAllocator(getBaseInterestAllocator).reallocate(currentBalance, _withdrawn + targetIdle, true);

605:         return _apr.mulDivDown(_BPS - _protocolFee, _BPS);

619:         balanceOf[from] -= amount;

633:                 ++i;

649:         uint256 totalQueues = getMaxTotalWithdrawalQueues + 1;

663:             uint256 secondIdx = (_idx + i) % totalQueues;

667:                     ++i;

672:             if (secondIdx == _cachedPendingQueueIndex + 1) {

676:             totalReceived -= pendingForQueue;

680:                 ++i;

689:         uint256 totalQueues = (getMaxTotalWithdrawalQueues + 1);

690:         uint256 oldestQueueIdx = (_cachedPendingQueueIndex + 1) % totalQueues;

693:             uint256 idx = (oldestQueueIdx + i) % totalQueues;

696:                 ++i;

704:                     ++i;

714:                 ++i;

724:         return __outstandingValues.sumApr / __outstandingValues.principalAmount;

741:             block.timestamp - uint256(__outstandingValues.lastTs), _SECONDS_PER_YEAR * _BPS

743:         uint256 total = __outstandingValues.accruedInterest + newlyAccrued;

749:             __outstandingValues.accruedInterest = uint128(total - _interestEarned);

751:         __outstandingValues.sumApr -= uint128(_apr * _principalAmount);

752:         __outstandingValues.principalAmount -= uint128(_principalAmount);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/pools/PoolOfferHandler.sol

4: import "@forge-std/console.sol";

6: import "@solmate/auth/Owned.sol";

7: import "@solmate/utils/FixedPointMathLib.sol";

9: import "../Multicall.sol";

10: import "../../interfaces/loans/IMultiSourceLoan.sol";

11: import "../../interfaces/pools/IPoolOfferHandler.sol";

84:         for (uint256 i = 0; i < __terms.length; i++) {

101:         if (block.timestamp - pendingTermsSetTime < NEW_TERMS_WAITING_TIME) {

104:         for (uint256 i = 0; i < __terms.length; i++) {

165:         if (offerExecution.offer.aprBps < _baseRate + aprPremium || aprPremium == 0) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/PoolOfferHandler.sol)

```solidity
File: src/lib/pools/WithdrawalQueue.sol

4: import "@openzeppelin/utils/Strings.sol";

5: import "@solmate/tokens/ERC20.sol";

6: import "@solmate/tokens/ERC721.sol";

7: import "@solmate/utils/SafeTransferLib.sol";

9: import "../Multicall.sol";

24:     string private constant _BASE_URI = "https://gondi.xyz/withdrawal-queue/";

67:         getTotalShares += _shares;

71:         return getNextTokenId++;

97:         getWithdrawn[_tokenId] += available;

99:         _totalWithdrawn += available;

124:         if (block.timestamp + _time < getUnlockTime[_tokenId]) {

128:         uint256 unlockTime = block.timestamp + _time;

138:         return getShares[_tokenId] * _getWithdrawablePerShare() - getWithdrawn[_tokenId];

143:         return (_totalWithdrawn + _asset.balanceOf(address(this))) / getTotalShares;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/WithdrawalQueue.sol)

```solidity
File: src/lib/utils/BytesLib.sol

13:         require(_length + 31 >= _length, "slice_overflow");

14:         require(_start + _length >= _start, "slice_overflow");

15:         require(_bytes.length >= _start + _length, "slice_outOfBounds");

73:         require(_start + 20 >= _start, "toAddress_overflow");

74:         require(_bytes.length >= _start + 20, "toAddress_outOfBounds");

85:         require(_start + 3 >= _start, "toUint24_overflow");

86:         require(_bytes.length >= _start + 3, "toUint24_outOfBounds");

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/BytesLib.sol)

```solidity
File: src/lib/utils/Hash.sol

4: import "../../interfaces/loans/IMultiSourceLoan.sol";

5: import "../../interfaces/loans/IBaseLoan.sol";

6: import "../../interfaces/IAuctionLoanLiquidator.sol";

45:                 ++i;

90:                 ++i;

122:                 ++i;

145:                 ++i;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/Hash.sol)

```solidity
File: src/lib/utils/Interest.sol

4: import "@solmate/utils/FixedPointMathLib.sol";

5: import "../../interfaces/loans/IMultiSourceLoan.sol";

6: import "../../interfaces/loans/IBaseLoan.sol";

27:             owed += tranche.principalAmount + tranche.accruedInterest

28:                 + _getInterest(tranche.principalAmount, tranche.aprBps, _timestamp - tranche.startTime);

30:                 ++i;

37:         return _amount.mulDivUp(_aprBps * _duration, _PRECISION * _SECONDS_PER_YEAR);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/Interest.sol)

```solidity
File: src/lib/utils/TwoStepOwned.sol

3: import "@solmate/auth/Owned.sol";

36:         if (pendingOwnerTime + MIN_WAIT_TIME > block.timestamp) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/TwoStepOwned.sol)

```solidity
File: src/lib/utils/WithProtocolFee.sol

4: import "./TwoStepOwned.sol";

6: import "../InputChecker.sol";

7: import "../loans/WithLoanManagers.sol";

78:         if (block.timestamp < _pendingProtocolFeeSetTime + FEE_UPDATE_NOTICE) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/WithProtocolFee.sol)

### <a name="GAS-8"></a>[GAS-8] Use Custom Errors instead of Revert Strings to save Gas

Custom errors are available from solidity version 0.8.4. Custom errors save [**~50 gas**](https://gist.github.com/IllIllI000/ad1bd0d29a0101b25e57c293b4b0c746) each time they're hit by [avoiding having to allocate and store the revert string](https://blog.soliditylang.org/2021/04/21/custom-errors/#errors-in-depth). Not defining the strings also save deployment gas

Additionally, custom errors can be used inside and outside of contracts (including interfaces and libraries).

Source: <https://blog.soliditylang.org/2021/04/21/custom-errors/>:

> Starting from [Solidity v0.8.4](https://github.com/ethereum/solidity/releases/tag/v0.8.4), there is a convenient and gas-efficient way to explain to users why an operation failed through the use of custom errors. Until now, you could already use strings to give more information about failures (e.g., `revert("Insufficient funds.");`), but they are rather expensive, especially when it comes to deploy cost, and it is difficult to use dynamic information in them.

Consider replacing **all revert strings** with custom errors in the solution, and particularly those that have multiple occurrences:

*Instances (8)*:

```solidity
File: src/lib/pools/Pool.sol

293:         require((assets = previewRedeem(shares)) != 0, "ZERO_ASSETS");

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/utils/BytesLib.sol

13:         require(_length + 31 >= _length, "slice_overflow");

14:         require(_start + _length >= _start, "slice_overflow");

15:         require(_bytes.length >= _start + _length, "slice_outOfBounds");

73:         require(_start + 20 >= _start, "toAddress_overflow");

74:         require(_bytes.length >= _start + 20, "toAddress_outOfBounds");

85:         require(_start + 3 >= _start, "toUint24_overflow");

86:         require(_bytes.length >= _start + 3, "toUint24_outOfBounds");

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/BytesLib.sol)

### <a name="GAS-9"></a>[GAS-9] Avoid contract existence checks by using low level calls

Prior to 0.8.10 the compiler inserted extra code, including `EXTCODESIZE` (**100 gas**), to check for contract existence for external function calls. In more recent solidity versions, the compiler will not insert these checks if the external call has a return value. Similar behavior can be achieved in earlier versions by using low-level calls, since low level calls never check for contract existence

*Instances (12)*:

```solidity
File: src/lib/Multicall.sol

15:             (success, results[i]) = address(this).delegatecall(data[i]);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/Multicall.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

216:             uint256 balance = asset.balanceOf(address(this));

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

812:             address recovered = typedDataHash.recover(_signature);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

59:         return ERC20(_aToken).balanceOf(address(this));

79:         uint256 total = ERC20(_aToken).balanceOf(address(this));

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

110:         return ERC20(_lido).balanceOf(address(this));

133:         uint256 total = ERC20(_lido).balanceOf(address(this));

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/Pool.sol

396:         uint256 currentBalance = asset.balanceOf(address(this)) - getAvailableToWithdraw;

564:         return asset.balanceOf(address(this)) + IBaseInterestAllocator(getBaseInterestAllocator).getAssetsAllocated()

572:         uint256 currentBalance = asset.balanceOf(address(this)) - getAvailableToWithdraw;

593:         uint256 currentBalance = asset.balanceOf(address(this));

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/pools/WithdrawalQueue.sol

143:         return (_totalWithdrawn + _asset.balanceOf(address(this))) / getTotalShares;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/WithdrawalQueue.sol)

### <a name="GAS-10"></a>[GAS-10] Stack variable used as a cheaper cache for a state variable is only used once

If the variable is only accessed once, it's cheaper to use the state variable directly that one time, and save the **3 gas** the extra stack assignment would spend

*Instances (1)*:

```solidity
File: src/lib/pools/Pool.sol

524:         uint256 pendingIndex = _pendingQueueIndex;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

### <a name="GAS-11"></a>[GAS-11] State variables only set in the constructor should be declared `immutable`

Variables only set in the constructor and never edited afterwards should be marked as immutable, as it would avoid the expensive storage-writing operation in the constructor (around **20 000 gas** per variable) and replace the expensive storage-reading operations (around **2100 gas** per reading) to a less expensive value reading (**3 gas**)

*Instances (38)*:

```solidity
File: src/lib/AuctionLoanLiquidator.sol

120:         _currencyManager = AddressManager(currencyManager);

121:         _collectionManager = AddressManager(collectionManager);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/LiquidationDistributor.sol

28:         getLoanManagerRegistry = ILoanManagerRegistry(_loanManagerRegistry);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationDistributor.sol)

```solidity
File: src/lib/UserVault.sol

100:         _currencyManager = AddressManager(currencyManager);

101:         _collectionManager = AddressManager(collectionManager);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

79:         _marketplaceContractsAddressManager = AddressManager(_marketplaceContracts);

80:         _weth = WETH(_wethAddress);

81:         _punkMarket = ICryptoPunksMarket(_punkMarketAddress);

82:         _wrappedPunk = IWrappedPunk(_wrappedPunkAddress);

85:         _punkProxy = _wrappedPunk.proxyInfo(address(this));

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/BaseLoan.sol

118:         name = _name;

122:         _currencyManager = AddressManager(currencyManager);

123:         _collectionManager = AddressManager(collectionManager);

125:         INITIAL_CHAIN_ID = block.chainid;

126:         INITIAL_DOMAIN_SEPARATOR = _computeDomainSeparator();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoan.sol)

```solidity
File: src/lib/loans/LoanManager.sol

52:         UPDATE_WAITING_TIME = _updateWaitingTime;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManager.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

117:         getMaxTranches = maxTranches;

120:         getLoanManagerRegistry = ILoanManagerRegistry(loanManagerRegistry);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

39:         getPool = _pool;

40:         _aavePool = __aavePool;

41:         _usdc = __usdc;

42:         _aToken = __aToken;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

58:         getPool = _pool;

59:         _curvePool = __curvePool;

60:         _weth = __weth;

61:         _lido = __lido;

63:         getLidoUpdateTolerance = _lidoUpdateTolerance;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/Pool.sol

148:         getFeeManager = _feeManager;

161:         getMaxTotalWithdrawalQueues = _maxTotalWithdrawalQueues;

163:         getMinTimeBetweenWithdrawalQueues = (IPoolOfferHandler(_offerHandler).getMaxDuration() + _LOAN_BUFFER_TIME)

166:         _deployedQueues = new DeployedQueue[](_maxTotalWithdrawalQueues + 1);

170:         _queueOutstandingValues = new OutstandingValues[](_maxTotalWithdrawalQueues + 1);

171:         _queueAccounting = new QueueAccounting[](_maxTotalWithdrawalQueues + 1);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/pools/PoolOfferHandler.sol

72:         getMaxDuration = _maxDuration;

73:         NEW_TERMS_WAITING_TIME = _newTermsWaitingTime;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/PoolOfferHandler.sol)

```solidity
File: src/lib/pools/WithdrawalQueue.sol

52:         getPool = msg.sender;

54:         _asset = __asset;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/WithdrawalQueue.sol)

```solidity
File: src/lib/utils/TwoStepOwned.sol

21:         MIN_WAIT_TIME = _minWaitTime;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/TwoStepOwned.sol)

### <a name="GAS-12"></a>[GAS-12] Functions guaranteed to revert when called by normal users can be marked `payable`

If a function modifier such as `onlyOwner` is used, the function will revert if a normal user tries to pay the function. Marking the function as `payable` will lower the gas cost for legitimate callers because the compiler will not include checks for whether a payment was provided.

*Instances (47)*:

```solidity
File: src/lib/AddressManager.sol

43:     function add(address _entry) external onlyOwner returns (uint16) {

48:     function addToWhitelist(address _entry) external onlyOwner {

60:     function removeFromWhitelist(address _entry) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AddressManager.sol)

```solidity
File: src/lib/AuctionLoanLiquidator.sol

126:     function addLoanContract(address _loanContract) external onlyOwner {

135:     function removeLoanContract(address _loanContract) external onlyOwner {

149:     function updateLiquidationDistributor(address __liquidationDistributor) external onlyOwner {

163:     function updateTriggerFee(uint256 triggerFee) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/AuctionWithBuyoutLoanLiquidator.sol

108:     function setTimeForMainLenderToBuy(uint256 __timeForMainLenderToBuy) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionWithBuyoutLoanLiquidator.sol)

```solidity
File: src/lib/LiquidationHandler.sol

64:     function updateLiquidationContract(address __loanLiquidator) external override onlyOwner {

72:     function updateLiquidationAuctionDuration(uint48 _newDuration) external override onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationHandler.sol)

```solidity
File: src/lib/UserVault.sol

345:     function _withdrawERC20(uint256 _vaultId, address _token) private onlyReadyForWithdrawal(_vaultId) {

357:     function _thisBurn(uint256 _vaultId, address _assetRecipient) private onlyApproved(_vaultId) {

362:     function _withdrawEth(uint256 _vaultId) private onlyReadyForWithdrawal(_vaultId) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/callbacks/CallbackHandler.sol

27:     function addWhitelistedCallbackContract(address _contract) external onlyOwner {

36:     function removeWhitelistedCallbackContract(address _contract) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/CallbackHandler.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

229:     function updateMultiSourceLoanAddressFirst(address _newAddress) external onlyOwner {

238:     function finalUpdateMultiSourceLoanAddress(address _newAddress) external onlyOwner {

270:     function updateTaxes(Taxes calldata _newTaxes) external onlyOwner {

282:     function setTaxes() external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/BaseLoan.sol

142:     function updateImprovementMinimum(ImprovementMinimum calldata _newMinimum) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoan.sol)

```solidity
File: src/lib/loans/BaseLoanHelpers.sol

8:     function initialize(bytes32 _domainSeparator, bytes4 _magicValue) external virtual onlyOwner {}

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoanHelpers.sol)

```solidity
File: src/lib/loans/LoanManager.sol

66:     function requestAddCallers(PendingCaller[] calldata _callers) external onlyOwner {

76:     function addCallers(PendingCaller[] calldata _callers) external onlyOwner {

108:     function setUnderwriter(address __underwriter) external onlyOwner {

119:     function confirmUnderwriter(address __underwriter) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManager.sol)

```solidity
File: src/lib/loans/LoanManagerRegistry.sol

16:     function addLoanManager(address _loanManager) external onlyOwner {

22:     function removeLoanManager(address _loanManager) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManagerRegistry.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

456:     function loanLiquidated(uint256 _loanId, Loan calldata _loan) external override onlyLiquidator {

494:     function setDelegateRegistry(address _newDelegateRegistry) external onlyOwner {

506:     function setMinLockPeriod(uint256 __minLockPeriod) external onlyOwner {

548:     function setFlashActionContract(address _newFlashActionContract) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/loans/WithLoanManagers.sol

14:     function addLoanManager(address _loanManager) external onlyOwner {

20:     function removeLoanManager(address _loanManager) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/WithLoanManagers.sol)

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

93:     function _onlyPool() private view returns (address) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/FeeManager.sol

40:     function setPendingFees(Fees calldata __fees) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/FeeManager.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

68:     function setMaxSlippage(uint256 _maxSlippage) external onlyOwner {

144:     function _onlyPool() private view returns (address) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/Pool.sol

177:     function pausePool() external onlyOwner {

184:     function setOptimalIdleRange(OptimalIdleRange memory _optimalIdleRange) external onlyOwner {

192:     function setBaseInterestAllocator(address _newBaseInterestAllocator) external onlyOwner {

224:     function setReallocationBonus(uint256 _newReallocationBonus) external onlyOwner {

234:     function afterCallerAdded(address _caller) internal override onlyOwner {

392:     function validateOffer(bytes calldata _offer, uint256 _protocolFee) external override onlyAcceptedCallers {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/pools/PoolOfferHandler.sol

80:     function setTerms(TermsKey[] calldata _termKeys, Terms[] calldata __terms) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/PoolOfferHandler.sol)

```solidity
File: src/lib/utils/TwoStepOwned.sol

26:     function requestTransferOwner(address _newOwner) external onlyOwner {

35:     function transferOwnership(address newOwner) public override onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/TwoStepOwned.sol)

```solidity
File: src/lib/utils/WithProtocolFee.sol

60:     function updateProtocolFee(ProtocolFee calldata _newProtocolFee) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/WithProtocolFee.sol)

### <a name="GAS-13"></a>[GAS-13] `++i` costs less gas compared to `i++` or `i += 1` (same for `--i` vs `i--` or `i -= 1`)

Pre-increments and pre-decrements are cheaper.

For a `uint256 i` variable, the following is true with the Optimizer enabled at 10k:

**Increment:**

- `i += 1` is the most expensive form
- `i++` costs 6 gas less than `i += 1`
- `++i` costs 5 gas less than `i++` (11 gas less than `i += 1`)

**Decrement:**

- `i -= 1` is the most expensive form
- `i--` costs 11 gas less than `i -= 1`
- `--i` costs 5 gas less than `i--` (16 gas less than `i -= 1`)

Note that post-increments (or post-decrements) return the old value before incrementing or decrementing, hence the name *post-increment*:

```solidity
uint i = 1;  
uint j = 2;
require(j == i++, "This will be false as i is incremented after the comparison");
```
  
However, pre-increments (or pre-decrements) return the new value:
  
```solidity
uint i = 1;  
uint j = 2;
require(j == ++i, "This will be true as i is incremented before the comparison");
```

In the pre-increment case, the compiler has to create a temporary variable (when used) for returning `1` instead of `2`.

Consider using pre-increments and pre-decrements where they are relevant (meaning: not where post-increments/decrements logic are relevant).

*Saves 5 gas per instance*

*Instances (3)*:

```solidity
File: src/lib/pools/PoolOfferHandler.sol

84:         for (uint256 i = 0; i < __terms.length; i++) {

104:         for (uint256 i = 0; i < __terms.length; i++) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/PoolOfferHandler.sol)

```solidity
File: src/lib/pools/WithdrawalQueue.sol

71:         return getNextTokenId++;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/WithdrawalQueue.sol)

### <a name="GAS-14"></a>[GAS-14] Using `private` rather than `public` for constants, saves gas

If needed, the values can be read from the verified contract source code, or if there are multiple values there can be a single getter function that [returns a tuple](https://github.com/code-423n4/2022-08-frax/blob/90f55a9ce4e25bceed3a74290b854341d8de6afa/src/contracts/FraxlendPair.sol#L156-L178) of the values of all currently-public constants. Saves **3406-3606 gas** in deployment gas due to the compiler not having to create non-payable getter functions for deployment calldata, not having to store the bytes of the value outside of where it's used, and not adding another entry to the method ID table

*Instances (13)*:

```solidity
File: src/lib/AuctionLoanLiquidator.sol

38:     uint256 public constant MAX_TRIGGER_FEE = 500;

40:     uint256 public constant MIN_INCREMENT_BPS = 500;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/AuctionWithBuyoutLoanLiquidator.sol

18:     uint256 public constant MAX_TIME_FOR_MAIN_LENDER_TO_BUY = 4 days;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionWithBuyoutLoanLiquidator.sol)

```solidity
File: src/lib/LiquidationHandler.sol

17:     uint48 public constant MIN_AUCTION_DURATION = 1 days;

18:     uint48 public constant MAX_AUCTION_DURATION = 7 days;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationHandler.sol)

```solidity
File: src/lib/UserVault.sol

22:     address public constant ETH = address(0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

30:     uint256 public constant TAX_UPDATE_NOTICE = 7 days;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/BaseLoan.sol

37:     bytes public constant VERSION = "3";

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoan.sol)

```solidity
File: src/lib/pools/FeeManager.sol

15:     uint256 public constant WAIT_TIME = 30 days;

16:     uint256 public constant PRECISION = 1e20;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/FeeManager.sol)

```solidity
File: src/lib/pools/Pool.sol

42:     uint80 public constant PRINCIPAL_PRECISION = 1e20;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/utils/WithProtocolFee.sol

16:     uint256 public constant MAX_PROTOCOL_FEE = 2500;

17:     uint256 public constant FEE_UPDATE_NOTICE = 30 days;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/WithProtocolFee.sol)

### <a name="GAS-15"></a>[GAS-15] Use shift right/left instead of division/multiplication if possible

While the `DIV` / `MUL` opcode uses 5 gas, the `SHR` / `SHL` opcode only uses 3 gas. Furthermore, beware that Solidity's division operation also includes a division-by-0 prevention which is bypassed using shifting. Eventually, overflow checks are never performed for shift operations as they are done for arithmetic operations. Instead, the result is always truncated, so the calculation can be unchecked in Solidity version `0.8+`

- Use `>> 1` instead of `/ 2`
- Use `>> 2` instead of `/ 4`
- Use `<< 3` instead of `* 8`
- ...
- Use `>> 5` instead of `/ 2^5 == / 32`
- Use `<< 6` instead of `* 2^6 == * 64`

TL;DR:

- Shifting left by N is like multiplying by 2^N (Each bits to the left is an increased power of 2)
- Shifting right by N is like dividing by 2^N (Each bits to the right is a decreased power of 2)

*Saves around 2 gas + 20 for unchecked per instance*

*Instances (2)*:

```solidity
File: src/lib/pools/Pool.sol

152:         _optimalIdleRange.mid = (_optimalIdleRange.min + _optimalIdleRange.max) / 2;

185:         _optimalIdleRange.mid = (_optimalIdleRange.min + _optimalIdleRange.max) / 2;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

### <a name="GAS-16"></a>[GAS-16] `uint256` to `bool` `mapping`: Utilizing Bitmaps to dramatically save on Gas

<https://soliditydeveloper.com/bitmaps>

<https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/structs/BitMaps.sol>

- [BitMaps.sol#L5-L16](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/structs/BitMaps.sol#L5-L16):

```solidity
/**
 * @dev Library for managing uint256 to bool mapping in a compact and efficient way, provided the keys are sequential.
 * Largely inspired by Uniswap's https://github.com/Uniswap/merkle-distributor/blob/master/contracts/MerkleDistributor.sol[merkle-distributor].
 *
 * BitMaps pack 256 booleans across each bit of a single 256-bit slot of `uint256` type.
 * Hence booleans corresponding to 256 _sequential_ indices would only consume a single slot,
 * unlike the regular `bool` which would consume an entire slot for a single value.
 *
 * This results in gas savings in two ways:
 *
 * - Setting a zero value to non-zero only once every 256 times
 * - Accessing the same warm slot for every 256 _sequential_ indices
 */
```

*Instances (2)*:

```solidity
File: src/lib/loans/BaseLoan.sol

52:     mapping(address => mapping(uint256 => bool)) public isOfferCancelled;

57:     mapping(address => mapping(uint256 => bool)) public isRenegotiationOfferCancelled;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoan.sol)

### <a name="GAS-17"></a>[GAS-17] Increments/decrements can be unchecked in for-loops

In Solidity 0.8+, there's a default overflow check on unsigned integers. It's possible to uncheck this in for-loops and save some gas at each iteration, but at the cost of some code readability, as this uncheck cannot be made inline.

[ethereum/solidity#10695](https://github.com/ethereum/solidity/issues/10695)

The change would be:

```diff
- for (uint256 i; i < numIterations; i++) {
+ for (uint256 i; i < numIterations;) {
 // ...  
+   unchecked { ++i; }
}  
```

These save around **25 gas saved** per instance.

The same can be applied with decrements (which should use `break` when `i == 0`).

The risk of overflow is non-existent for `uint256`.

*Instances (2)*:

```solidity
File: src/lib/pools/PoolOfferHandler.sol

84:         for (uint256 i = 0; i < __terms.length; i++) {

104:         for (uint256 i = 0; i < __terms.length; i++) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/PoolOfferHandler.sol)

### <a name="GAS-18"></a>[GAS-18] Use != 0 instead of > 0 for unsigned integer comparison

*Instances (17)*:

```solidity
File: src/lib/AuctionLoanLiquidator.sol

238:         if (max < currentTime && currentHighestBid > 0) {

243:         if (currentHighestBid > 0) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/LiquidationDistributor.sol

63:             for (uint256 i = 0; i < _loan.tranche.length && _proceeds > 0;) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationDistributor.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

117:         if (remainingBalance > 0) {

312:         if (totalFeeTax > 0) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

371:         if (_renegotiationOffer.fee > 0) {

564:         if (_loan.protocolFee > 0 && _renegotiationOffer.fee > 0) {

618:         if (_protocolFeeFraction > 0) {

683:         if (_fee > 0) {

759:         if (lender.code.length > 0) {

783:         if ((offer.capacity > 0) && (_used[_offerer][offer.offerId] + _offerExecution.amount > offer.capacity)) {

807:         if (_signer.code.length > 0) {

837:                 (_offerPrincipalAmount - _loanPrincipalAmount > 0)

843:             ) || (_offerFee > 0) || (_offerEndTime < _loanEndTime)

927:         return _callbackData.length > 0;

931:         bool withProtocolFee = loan.protocolFee > 0;

1026:             if (offer.capacity > 0) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

### <a name="GAS-19"></a>[GAS-19] `internal` functions not called by the contract should be removed

If the functions are required by an interface, the contract should inherit from that interface and use the `override` keyword

*Instances (8)*:

```solidity
File: src/lib/utils/BytesLib.sol

12:     function slice(bytes memory _bytes, uint256 _start, uint256 _length) internal pure returns (bytes memory) {

72:     function toAddress(bytes memory _bytes, uint256 _start) internal pure returns (address) {

84:     function toUint24(bytes memory _bytes, uint256 _start) internal pure returns (uint24) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/BytesLib.sol)

```solidity
File: src/lib/utils/Interest.sol

15:     function getInterest(IMultiSourceLoan.LoanOffer memory _loanOffer) internal pure returns (uint256) {

19:     function getInterest(uint256 _amount, uint256 _aprBps, uint256 _duration) internal pure returns (uint256) {

23:     function getTotalOwed(IMultiSourceLoan.Loan memory _loan, uint256 _timestamp) internal pure returns (uint256) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/Interest.sol)

```solidity
File: src/lib/utils/ValidatorHelpers.sol

15:     function validateTokenIdPackedList(uint256 _tokenId, uint64 _bytesPerTokenId, bytes memory _tokenIdList)

72:     function validateNFTBitVector(uint256 _tokenId, bytes memory _bitVector) internal pure {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/ValidatorHelpers.sol)

### <a name="GAS-20"></a>[GAS-20] WETH address definition can be use directly

WETH is a wrap Ether contract with a specific address in the Ethereum network, giving the option to define it may cause false recognition, it is healthier to define it directly.

    Advantages of defining a specific contract directly:
    
    It saves gas,
    Prevents incorrect argument definition,
    Prevents execution on a different chain and re-signature issues,
    WETH Address : 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2

*Instances (2)*:

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

33:     WETH private immutable _weth;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

31:     address payable private immutable _weth;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

## Non Critical Issues

| |Issue|Instances|
|-|:-|:-:|
| [NC-1](#NC-1) | Missing checks for `address(0)` when assigning values to address state variables | 18 |
| [NC-2](#NC-2) | Array indices should be referenced via `enum`s rather than via numeric literals | 5 |
| [NC-3](#NC-3) | Use `string.concat()` or `bytes.concat()` instead of `abi.encodePacked` | 4 |
| [NC-4](#NC-4) | `constant`s should be defined rather than using magic numbers | 17 |
| [NC-5](#NC-5) | Control structures do not follow the Solidity Style Guide | 20 |
| [NC-6](#NC-6) | Delete rogue `console.log` imports | 1 |
| [NC-7](#NC-7) | Duplicated `require()`/`revert()` Checks Should Be Refactored To A Modifier Or Function | 2 |
| [NC-8](#NC-8) | Unused `error` definition | 6 |
| [NC-9](#NC-9) | Event missing indexed field | 60 |
| [NC-10](#NC-10) | Events that mark critical parameter changes should contain both the old and the new value | 21 |
| [NC-11](#NC-11) | Function ordering does not follow the Solidity style guide | 8 |
| [NC-12](#NC-12) | Functions should not be longer than 50 lines | 208 |
| [NC-13](#NC-13) | Change uint to uint256 | 1 |
| [NC-14](#NC-14) | Lack of checks in setters | 15 |
| [NC-15](#NC-15) | Missing Event for critical parameters change | 2 |
| [NC-16](#NC-16) | NatSpec is completely non-existent on functions that should have them | 7 |
| [NC-17](#NC-17) | Incomplete NatSpec: `@param` is missing on actually documented functions | 3 |
| [NC-18](#NC-18) | Incomplete NatSpec: `@return` is missing on actually documented functions | 1 |
| [NC-19](#NC-19) | File's first line is not an SPDX Identifier | 1 |
| [NC-20](#NC-20) | Use a `modifier` instead of a `require/if` statement for a special `msg.sender` actor | 20 |
| [NC-21](#NC-21) | Constant state variables defined more than once | 16 |
| [NC-22](#NC-22) | Consider using named mappings | 17 |
| [NC-23](#NC-23) | `address`s shouldn't be hard-coded | 1 |
| [NC-24](#NC-24) | Variable names that consist of all capital letters should be reserved for `constant`/`immutable` variables | 1 |
| [NC-25](#NC-25) | Owner can renounce while system is paused | 1 |
| [NC-26](#NC-26) | Adding a `return` statement when the function defines a named return variable, is redundant | 1 |
| [NC-27](#NC-27) | `require()` / `revert()` statements should have descriptive reason strings | 2 |
| [NC-28](#NC-28) | Take advantage of Custom Error's return value property | 101 |
| [NC-29](#NC-29) | Avoid the use of sensitive terms | 57 |
| [NC-30](#NC-30) | Contract does not follow the Solidity style guide's suggested layout ordering | 15 |
| [NC-31](#NC-31) | Use Underscores for Number Literals (add an underscore every 3 digits) | 12 |
| [NC-32](#NC-32) | Internal and private variables and functions names should begin with an underscore | 18 |
| [NC-33](#NC-33) | Event is missing `indexed` fields | 60 |
| [NC-34](#NC-34) | Constants should be defined rather than using magic numbers | 2 |
| [NC-35](#NC-35) | `public` functions not called by the contract should be declared `external` instead | 1 |
| [NC-36](#NC-36) | Variables need not be initialized to zero | 32 |

### <a name="NC-1"></a>[NC-1] Missing checks for `address(0)` when assigning values to address state variables

*Instances (18)*:

```solidity
File: src/lib/LiquidationHandler.sol

48:         _loanLiquidator = __loanLiquidator;

66:         _loanLiquidator = __loanLiquidator;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationHandler.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

232:         _pendingMultiSourceLoanAddress = _newAddress;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/LoanManager.sol

51:         getUnderwriter = __underwriter;

111:         getPendingUnderwriter = __underwriter;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManager.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

118:         getDelegateRegistry = delegateRegistry;

119:         getFlashActionContract = flashActionContract;

495:         getDelegateRegistry = _newDelegateRegistry;

549:         getFlashActionContract = _newFlashActionContract;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

39:         getPool = _pool;

40:         _aavePool = __aavePool;

41:         _usdc = __usdc;

42:         _aToken = __aToken;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

58:         getPool = _pool;

61:         _lido = __lido;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/Pool.sol

148:         getFeeManager = _feeManager;

195:         getPendingBaseInterestAllocator = _newBaseInterestAllocator;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/utils/TwoStepOwned.sol

27:         pendingOwner = _newOwner;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/TwoStepOwned.sol)

### <a name="NC-2"></a>[NC-2] Array indices should be referenced via `enum`s rather than via numeric literals

*Instances (5)*:

```solidity
File: src/lib/LiquidationHandler.sol

96:                 address(this), _loan.tranche[0].lender, _loan.nftCollateralTokenId

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationHandler.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

211:         newTranche[0] = Tranche(

447:             _loanId, _loan, _loan.tranche.length == 1 && !getLoanManagerRegistry.isLoanManager(_loan.tranche[0].lender)

858:         LoanOffer calldata one = _executionData.offerExecution[0].offer;

909:             } else if ((totalValidators == 1) && (_loanOffer.validators[0].validator == address(0))) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

### <a name="NC-3"></a>[NC-3] Use `string.concat()` or `bytes.concat()` instead of `abi.encodePacked`

Solidity version 0.8.4 introduces `bytes.concat()` (vs `abi.encodePacked(<bytes>,<bytes>)`)

Solidity version 0.8.12 introduces `string.concat()` (vs `abi.encodePacked(<str>,<str>), which catches concatenation errors (in the event of a`bytes`data mixed in the concatenation)`)

*Instances (4)*:

```solidity
File: src/lib/utils/Hash.sol

42:             encodedValidators = abi.encodePacked(encodedValidators, _hashValidator(_loanOffer.validators[i]));

87:                 abi.encodePacked(encodedOfferExecution, _hashOfferExecution(_executionData.offerExecution[i]));

120:             trancheHashes = abi.encodePacked(trancheHashes, _hashTranche(_loan.tranche[i]));

143:             encodedIndexes = abi.encodePacked(encodedIndexes, _refinanceOffer.trancheIndex[i]);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/Hash.sol)

### <a name="NC-4"></a>[NC-4] `constant`s should be defined rather than using magic numbers

Even [assembly](https://github.com/code-423n4/2022-05-opensea-seaport/blob/9d7ce4d08bf3c3010304a0476a785c70c0e90ae7/contracts/lib/TokenTransferrer.sol#L35-L39) can benefit from using readable constants instead of hex/numeric literals

*Instances (17)*:

```solidity
File: src/lib/AuctionLoanLiquidator.sol

282:         uint256 proceeds = highestBid - 2 * triggerFee;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/LiquidationHandler.sol

21:     uint48 internal _liquidationAuctionDuration = 3 days;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationHandler.sol)

```solidity
File: src/lib/loans/BaseLoan.sol

40:     ImprovementMinimum internal _minimum = ImprovementMinimum(500, 100, 100);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoan.sol)

```solidity
File: src/lib/pools/Pool.sol

50:     uint16 private _MAX_BONUS = 500;

152:         _optimalIdleRange.mid = (_optimalIdleRange.min + _optimalIdleRange.max) / 2;

185:         _optimalIdleRange.mid = (_optimalIdleRange.min + _optimalIdleRange.max) / 2;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/utils/BytesLib.sol

13:         require(_length + 31 >= _length, "slice_overflow");

34:                 let lengthmod := and(_length, 31)

56:                 mstore(0x40, and(add(mc, 31), not(31)))

73:         require(_start + 20 >= _start, "toAddress_overflow");

74:         require(_bytes.length >= _start + 20, "toAddress_outOfBounds");

85:         require(_start + 3 >= _start, "toUint24_overflow");

86:         require(_bytes.length >= _start + 3, "toUint24_outOfBounds");

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/BytesLib.sol)

```solidity
File: src/lib/utils/ValidatorHelpers.sol

19:         if (_bytesPerTokenId == 0 || _bytesPerTokenId > 32) {

29:         uint256 bitMask = ~(type(uint256).max << (_bytesPerTokenId << 3));

74:         if (_tokenId >= _bitVector.length << 3) {

78:         if (!(uint8(_bitVector[_tokenId >> 3]) & (0x80 >> (_tokenId & 7)) != 0)) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/ValidatorHelpers.sol)

### <a name="NC-5"></a>[NC-5] Control structures do not follow the Solidity Style Guide

See the [control structures](https://docs.soliditylang.org/en/latest/style-guide.html#control-structures) section of the Solidity Style Guide

*Instances (20)*:

```solidity
File: src/lib/AuctionLoanLiquidator.sol

107:     error CouldNotModifyValidLoansError();

128:             revert CouldNotModifyValidLoansError();

137:             revert CouldNotModifyValidLoansError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/Multicall.sol

16:             if (!success) revert MulticallFailed(i, results[i]);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/Multicall.sol)

```solidity
File: src/lib/UserVault.sol

71:         if (

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/callbacks/CallbackHandler.sol

58:         if (

76:         if (

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/CallbackHandler.sol)

```solidity
File: src/lib/loans/BaseLoan.sol

208:                 keccak256("EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)"),

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoan.sol)

```solidity
File: src/lib/loans/LoanManager.sol

83:             if (pendingCallers[i].caller != caller.caller || pendingCallers[i].isLoanContract != caller.isLoanContract)

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManager.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

659:         if (

700:         if (

715:         if (

835:         if (

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/pools/FeeManager.sol

7: import "../../interfaces/pools/IFeeManager.sol";

52:         if (_pendingFees.managementFee != __fees.managementFee || _pendingFees.performanceFee != __fees.performanceFee)

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/FeeManager.sol)

```solidity
File: src/lib/pools/Pool.sol

10: import "../../interfaces/pools/IFeeManager.sol";

279:             if (allowed != type(uint256).max) allowance[owner][msg.sender] = allowed - shares;

289:             if (allowed != type(uint256).max) allowance[owner][msg.sender] = allowed - shares;

443:         uint256 fees = IFeeManager(getFeeManager).processFees(_principalAmount, interestEarned);

460:         uint256 fees = IFeeManager(getFeeManager).processFees(_received, 0);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

### <a name="NC-6"></a>[NC-6] Delete rogue `console.log` imports

These shouldn't be deployed in production

*Instances (1)*:

```solidity
File: src/lib/pools/PoolOfferHandler.sol

4: import "@forge-std/console.sol";

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/PoolOfferHandler.sol)

### <a name="NC-7"></a>[NC-7] Duplicated `require()`/`revert()` Checks Should Be Refactored To A Modifier Or Function

*Instances (2)*:

```solidity
File: src/lib/utils/BytesLib.sol

13:         require(_length + 31 >= _length, "slice_overflow");

14:         require(_start + _length >= _start, "slice_overflow");

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/BytesLib.sol)

### <a name="NC-8"></a>[NC-8] Unused `error` definition

Note that there may be cases where an error superficially appears to be used, but this is only because there are multiple definitions of the error in different files. In such cases, the error definition should be moved into a separate file. The instances below are the unused definitions.

*Instances (6)*:

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

54:     error CurrencyNotSupportedError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

72:     error InvalidAPRError();

75:     error MinLockPeriodTooHighError(uint256 minLockPeriod);

77:     error TargetPrincipalTooLowError(uint256 tranchePrincipal, uint256 loanPrincipal);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/pools/FeeManager.sol

25:     error TwoSoonError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/FeeManager.sol)

```solidity
File: src/lib/pools/Pool.sol

118:     error CannotDeployQueueTooSoonError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

### <a name="NC-9"></a>[NC-9] Event missing indexed field

Index event fields make the field more quickly accessible [to off-chain tools](https://ethereum.stackexchange.com/questions/40396/can-somebody-please-explain-the-concept-of-event-indexing) that parse events. This is especially useful when it comes to filtering based on an address. However, note that each index field costs extra gas during emission, so it's not necessarily best to index the maximum allowed per event (three fields). Where applicable, each `event` should use three `indexed` fields if there are three or more fields, and gas usage is not particularly of concern for the events in question. If there are fewer than three applicable fields, all of the applicable fields should be indexed.

*Instances (60)*:

```solidity
File: src/lib/AddressManager.sol

13:     event AddressAdded(address address_added);

15:     event AddressRemovedFromWhitelist(address address_removed);

17:     event AddressWhitelisted(address address_whitelisted);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AddressManager.sol)

```solidity
File: src/lib/AuctionLoanLiquidator.sol

58:     event LoanContractAdded(address loan);

60:     event LoanContractRemoved(address loan);

62:     event LiquidationDistributorUpdated(address liquidationDistributor);

64:     event LoanLiquidationStarted(address collection, uint256 tokenId, Auction auction);

66:     event BidPlaced(

70:     event AuctionSettled(

81:     event TriggerFeeUpdated(uint256 triggerFee);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/AuctionWithBuyoutLoanLiquidator.sol

20:     event AuctionSettledWithBuyout(

24:     event TimeForMainLenderToBuyUpdated(uint256 timeForMainLenderToBuy);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionWithBuyoutLoanLiquidator.sol)

```solidity
File: src/lib/LiquidationHandler.sol

26:     event LoanSentToLiquidator(uint256 loanId, address liquidator);

28:     event LoanForeclosed(uint256 loanId);

30:     event LiquidationContractUpdated(address liquidator);

32:     event LiquidationAuctionDurationUpdated(uint256 newDuration);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationHandler.sol)

```solidity
File: src/lib/UserVault.sol

40:     event ERC721Deposited(uint256 vaultId, address collection, uint256 tokenId);

42:     event OldERC721Deposited(uint256 vaultId, address collection, uint256 tokenId);

44:     event OldERC721Withdrawn(uint256 vaultId, address collection, uint256 tokenId);

46:     event ERC20Deposited(uint256 vaultId, address token, uint256 amount);

48:     event ERC721Withdrawn(uint256 vaultId, address collection, uint256 tokenId);

50:     event ERC20Withdrawn(uint256 vaultId, address token, uint256 amount);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/callbacks/CallbackHandler.sol

18:     event WhitelistedCallbackContractAdded(address contractAdded);

19:     event WhitelistedCallbackContractRemoved(address contractRemoved);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/CallbackHandler.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

46:     event BNPLLoansStarted(uint256[] loanIds);

47:     event SellAndRepayExecuted(uint256[] loanIds);

48:     event MultiSourceLoanPendingUpdate(address newAddress);

49:     event MultiSourceLoanUpdated(address newAddress);

50:     event TaxesPendingUpdate(Taxes newTaxes);

51:     event TaxesUpdated(Taxes taxes);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/BaseLoan.sol

67:     event OfferCancelled(address lender, uint256 offerId);

69:     event AllOffersCancelled(address lender, uint256 minOfferId);

71:     event RenegotiationOfferCancelled(address lender, uint256 renegotiationId);

73:     event ImprovementMinimumUpdated(ImprovementMinimum minimum);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoan.sol)

```solidity
File: src/lib/loans/LoanManager.sol

39:     event RequestCallersAdded(PendingCaller[] callers);

40:     event CallersAdded(PendingCaller[] callers);

41:     event PendingUnderwriterSet(address underwriter);

42:     event UnderwriterSet(address underwriter);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManager.sol)

```solidity
File: src/lib/loans/LoanManagerRegistry.sol

11:     event LoanManagerAdded(address loanManagerAdded);

12:     event LoanManagerRemoved(address loanManagerRemoved);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManagerRegistry.sol)

```solidity
File: src/lib/loans/WithLoanManagers.sol

9:     event LoanManagerAdded(address loanManagerAdded);

10:     event LoanManagerRemoved(address loanManagerRemoved);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/WithLoanManagers.sol)

```solidity
File: src/lib/pools/FeeManager.sol

22:     event PendingFeesSet(Fees fees);

23:     event PendingFeesConfirmed(Fees fees);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/FeeManager.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

40:     event MaxSlippageSet(uint256 maxSlippage);

41:     event LidoValuesUpdated(LidoData lidoData);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/Pool.sol

121:     event ReallocationBonusUpdated(uint256 newReallocationBonus);

122:     event PendingBaseInterestAllocatorSet(address newBaseInterestAllocator);

123:     event BaseInterestAllocatorSet(address newBaseInterestAllocator);

124:     event OptimalIdleRangeSet(OptimalIdleRange optimalIdleRange);

125:     event QueueClaimed(address queue, uint256 amount);

126:     event Reallocated(uint256 delta, uint256 bonusShares);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/pools/PoolOfferHandler.sol

64:     event PendingTermsSet(TermsKey[] keys, Terms[] terms, uint256 ts);

65:     event TermsSet(TermsKey[] keys, Terms[] terms);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/PoolOfferHandler.sol)

```solidity
File: src/lib/pools/WithdrawalQueue.sol

42:     event WithdrawalPositionMinted(uint256 tokenId, address to, uint256 shares);

43:     event Withdrawn(address to, uint256 tokenId, uint256 available);

44:     event WithdrawalLocked(uint256 tokenId, uint256 unlockTime);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/WithdrawalQueue.sol)

```solidity
File: src/lib/utils/TwoStepOwned.sol

9:     event TransferOwnerRequested(address newOwner);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/TwoStepOwned.sol)

```solidity
File: src/lib/utils/WithProtocolFee.sol

26:     event ProtocolFeeUpdated(ProtocolFee fee);

27:     event ProtocolFeePendingUpdate(ProtocolFee fee);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/WithProtocolFee.sol)

### <a name="NC-10"></a>[NC-10] Events that mark critical parameter changes should contain both the old and the new value

This should especially be done if the new value is not required to be different from the old value

*Instances (21)*:

```solidity
File: src/lib/AuctionLoanLiquidator.sol

149:     function updateLiquidationDistributor(address __liquidationDistributor) external onlyOwner {
             _checkAddressNotZero(__liquidationDistributor);
     
             _liquidationDistributor = ILiquidationDistributor(__liquidationDistributor);
     
             emit LiquidationDistributorUpdated(__liquidationDistributor);

261:     function settleAuction(Auction calldata _auction, IMultiSourceLoan.Loan calldata _loan) external nonReentrant {
             address collateralAddress = _loan.nftCollateralAddress;
             uint256 tokenId = _loan.nftCollateralTokenId;
             _checkAuction(collateralAddress, tokenId, _auction);
     
             if (_auction.highestBidder == address(0)) {
                 revert NoBidsError();
             }
     
             uint256 currentTime = block.timestamp;
             uint96 expiration = _auction.startTime + _auction.duration;
             uint96 withMargin = _auction.lastBidTime + _MIN_NO_ACTION_MARGIN;
             if ((withMargin > currentTime) || (currentTime < expiration)) {
                 uint96 max = withMargin > expiration ? withMargin : expiration;
                 revert AuctionNotOverError(max);
             }
     
             ERC721(collateralAddress).transferFrom(address(this), _auction.highestBidder, tokenId);
     
             uint256 highestBid = _auction.highestBid;
             uint256 triggerFee = highestBid.mulDivDown(_auction.triggerFee, _BPS);
             uint256 proceeds = highestBid - 2 * triggerFee;
             ERC20 asset = ERC20(_auction.asset);
     
             asset.safeTransfer(_auction.originator, triggerFee);
             asset.safeTransfer(msg.sender, triggerFee);
             asset.approve(address(_liquidationDistributor), proceeds);
             _liquidationDistributor.distribute(proceeds, _loan);
             IMultiSourceLoan(_auction.loanAddress).loanLiquidated(_auction.loanId, _loan);
             emit AuctionSettled(

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/AuctionWithBuyoutLoanLiquidator.sol

55:     function settleWithBuyout(
            address _nftAddress,
            uint256 _tokenId,
            Auction calldata _auction,
            IMultiSourceLoan.Loan calldata _loan
        ) external nonReentrant {
            /// TODO: Originator fee
            _checkAuction(_nftAddress, _tokenId, _auction);
            uint256 timeLimit = _auction.startTime + _timeForMainLenderToBuy;
            if (timeLimit < block.timestamp) {
                revert OptionToBuyExpiredError(timeLimit);
            }
            uint256 largestTrancheIdx;
            uint256 largestPrincipal;
            for (uint256 i = 0; i < _loan.tranche.length;) {
                if (_loan.tranche[i].principalAmount > largestPrincipal) {
                    largestPrincipal = _loan.tranche[i].principalAmount;
                    largestTrancheIdx = i;
                }
                unchecked {
                    ++i;
                }
            }
            if (msg.sender != _loan.tranche[largestTrancheIdx].lender) {
                revert NotMainLenderError();
            }
            ERC20 asset = ERC20(_auction.asset); 
            uint256 totalOwed;
            for (uint256 i; i < _loan.tranche.length;) {
                if (i != largestTrancheIdx) {
                    IMultiSourceLoan.Tranche calldata thisTranche = _loan.tranche[i];
                    uint256 owed = thisTranche.principalAmount + thisTranche.accruedInterest
                        + thisTranche.principalAmount.getInterest(thisTranche.aprBps, block.timestamp - thisTranche.startTime);
                    totalOwed += owed; 
                    asset.safeTransferFrom(msg.sender, thisTranche.lender, owed);
                }
                unchecked {
                    ++i;
                }
            }
            IMultiSourceLoan(_auction.loanAddress).loanLiquidated(_auction.loanId, _loan);
    
            asset.safeTransfer(_auction.originator, totalOwed.mulDivDown(_auction.triggerFee, _BPS));
    
            ERC721(_loan.nftCollateralAddress).transferFrom(address(this), msg.sender, _tokenId);
    
            delete _auctions[_nftAddress][_tokenId];
    
            emit AuctionSettledWithBuyout(_auction.loanAddress, _auction.loanId, _nftAddress, _tokenId, largestTrancheIdx);

108:     function setTimeForMainLenderToBuy(uint256 __timeForMainLenderToBuy) external onlyOwner {
             if (__timeForMainLenderToBuy > MAX_TIME_FOR_MAIN_LENDER_TO_BUY) {
                 revert InvalidInputError();
             }
             _timeForMainLenderToBuy = __timeForMainLenderToBuy;
     
             emit TimeForMainLenderToBuyUpdated(__timeForMainLenderToBuy);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionWithBuyoutLoanLiquidator.sol)

```solidity
File: src/lib/LiquidationHandler.sol

64:     function updateLiquidationContract(address __loanLiquidator) external override onlyOwner {
            _checkAddressNotZero(__loanLiquidator);
            _loanLiquidator = __loanLiquidator;
    
            emit LiquidationContractUpdated(__loanLiquidator);

72:     function updateLiquidationAuctionDuration(uint48 _newDuration) external override onlyOwner {
            if (_newDuration < MIN_AUCTION_DURATION || _newDuration > MAX_AUCTION_DURATION) {
                revert InvalidDurationError();
            }
            _liquidationAuctionDuration = _newDuration;
    
            emit LiquidationAuctionDurationUpdated(_newDuration);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationHandler.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

229:     function updateMultiSourceLoanAddressFirst(address _newAddress) external onlyOwner {
             _checkAddressNotZero(_newAddress);
     
             _pendingMultiSourceLoanAddress = _newAddress;
     
             emit MultiSourceLoanPendingUpdate(_newAddress);

270:     function updateTaxes(Taxes calldata _newTaxes) external onlyOwner {
             if (_newTaxes.buyTax > _MAX_TAX || (_newTaxes.sellTax > _MAX_TAX)) {
                 revert InvalidTaxesError(_newTaxes);
             }
     
             _pendingTaxes = _newTaxes;
             _pendingTaxesSetTime = block.timestamp;
     
             emit TaxesPendingUpdate(_newTaxes);

282:     function setTaxes() external onlyOwner {
             if (block.timestamp < _pendingTaxesSetTime + TAX_UPDATE_NOTICE) {
                 revert TooEarlyError(_pendingTaxesSetTime);
             }
             Taxes memory taxes = _pendingTaxes;
             _taxes = taxes;
     
             emit TaxesUpdated(taxes);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/BaseLoan.sol

142:     function updateImprovementMinimum(ImprovementMinimum calldata _newMinimum) external onlyOwner {
             _minimum = _newMinimum;
     
             emit ImprovementMinimumUpdated(_newMinimum);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoan.sol)

```solidity
File: src/lib/loans/LoanManager.sol

108:     function setUnderwriter(address __underwriter) external onlyOwner {
             _checkAddressNotZero(__underwriter);
     
             getPendingUnderwriter = __underwriter;
             getPendingUnderwriterSetTime = block.timestamp;
     
             emit PendingUnderwriterSet(__underwriter);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManager.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

494:     function setDelegateRegistry(address _newDelegateRegistry) external onlyOwner {
             getDelegateRegistry = _newDelegateRegistry;
     
             emit DelegateRegistryUpdated(_newDelegateRegistry);

506:     function setMinLockPeriod(uint256 __minLockPeriod) external onlyOwner {
             _minLockPeriod = __minLockPeriod;
     
             emit MinLockPeriodUpdated(__minLockPeriod);

548:     function setFlashActionContract(address _newFlashActionContract) external onlyOwner {
             getFlashActionContract = _newFlashActionContract;
     
             emit FlashActionContractUpdated(_newFlashActionContract);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/pools/FeeManager.sol

40:     function setPendingFees(Fees calldata __fees) external onlyOwner {
            _pendingFees = __fees;
            _pendingFeesSetTime = block.timestamp;
    
            emit PendingFeesSet(__fees);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/FeeManager.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

68:     function setMaxSlippage(uint256 _maxSlippage) external onlyOwner {
            getMaxSlippage = _maxSlippage;
    
            emit MaxSlippageSet(_maxSlippage);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/Pool.sol

184:     function setOptimalIdleRange(OptimalIdleRange memory _optimalIdleRange) external onlyOwner {
             _optimalIdleRange.mid = (_optimalIdleRange.min + _optimalIdleRange.max) / 2;
             getOptimalIdleRange = _optimalIdleRange;
     
             emit OptimalIdleRangeSet(_optimalIdleRange);

192:     function setBaseInterestAllocator(address _newBaseInterestAllocator) external onlyOwner {
             _checkAddressNotZero(_newBaseInterestAllocator);
     
             getPendingBaseInterestAllocator = _newBaseInterestAllocator;
             getPendingBaseInterestAllocatorSetTime = block.timestamp;
     
             emit PendingBaseInterestAllocatorSet(_newBaseInterestAllocator);

224:     function setReallocationBonus(uint256 _newReallocationBonus) external onlyOwner {
             if (_newReallocationBonus > _MAX_BONUS) {
                 revert InvalidInputError();
             }
             getReallocationBonus = _newReallocationBonus;
     
             emit ReallocationBonusUpdated(_newReallocationBonus);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/pools/PoolOfferHandler.sol

80:     function setTerms(TermsKey[] calldata _termKeys, Terms[] calldata __terms) external onlyOwner {
            if (_termKeys.length != __terms.length) {
                revert InvalidInputError();
            }
            for (uint256 i = 0; i < __terms.length; i++) {
                if (_termKeys[i].duration > getMaxDuration) {
                    revert InvalidDurationError();
                }
                _pendingTerms[_termKeys[i].collection][_termKeys[i].duration][_termKeys[i].maxSeniorRepayment][__terms[i]
                    .principalAmount] = __terms[i].aprPremium;
            }
            uint256 ts = block.timestamp;
            pendingTermsSetTime = ts;
    
            emit PendingTermsSet(_termKeys, __terms, ts);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/PoolOfferHandler.sol)

```solidity
File: src/lib/utils/WithProtocolFee.sol

60:     function updateProtocolFee(ProtocolFee calldata _newProtocolFee) external onlyOwner {
            if (_newProtocolFee.fraction > MAX_PROTOCOL_FEE) {
                revert InvalidProtocolFeeError(_newProtocolFee.fraction);
            }
            _checkAddressNotZero(_newProtocolFee.recipient);
    
            _pendingProtocolFee = _newProtocolFee;
            _pendingProtocolFeeSetTime = block.timestamp;
    
            emit ProtocolFeePendingUpdate(_pendingProtocolFee);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/WithProtocolFee.sol)

### <a name="NC-11"></a>[NC-11] Function ordering does not follow the Solidity style guide

According to the [Solidity style guide](https://docs.soliditylang.org/en/v0.8.17/style-guide.html#order-of-functions), functions should be laid out in the following order :`constructor()`, `receive()`, `fallback()`, `external`, `public`, `internal`, `private`, but the cases below do not follow this pattern

*Instances (8)*:

```solidity
File: src/lib/AuctionLoanLiquidator.sol

1: 
   Current order:
   external addLoanContract
   external removeLoanContract
   external getValidLoanContracts
   external updateLiquidationDistributor
   external getLiquidationDistributor
   external updateTriggerFee
   external getTriggerFee
   external liquidateLoan
   external placeBid
   external settleAuction
   external getAuctionHash
   private _updateTriggerFee
   internal _checkAuction
   internal _placeBidChecks
   
   Suggested order:
   external addLoanContract
   external removeLoanContract
   external getValidLoanContracts
   external updateLiquidationDistributor
   external getLiquidationDistributor
   external updateTriggerFee
   external getTriggerFee
   external liquidateLoan
   external placeBid
   external settleAuction
   external getAuctionHash
   internal _checkAuction
   internal _placeBidChecks
   private _updateTriggerFee

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/UserVault.sol

1: 
   Current order:
   public tokenURI
   external mint
   external burn
   external burnAndWithdraw
   external ERC721OwnerOf
   external OldERC721OwnerOf
   external ERC20BalanceOf
   external depositERC721
   external depositERC721s
   external depositOldERC721
   external depositOldERC721s
   external depositERC20
   external depositEth
   external withdrawERC721
   external withdrawERC721s
   external withdrawOldERC721
   external withdrawOldERC721s
   external withdrawERC20
   external withdrawERC20s
   external withdrawEth
   private _depositERC721
   private _depositOldERC721
   private _depositERC20
   private _withdrawERC721
   private _withdrawOldERC721
   private _withdrawERC20
   private _thisBurn
   private _withdrawEth
   
   Suggested order:
   external mint
   external burn
   external burnAndWithdraw
   external ERC721OwnerOf
   external OldERC721OwnerOf
   external ERC20BalanceOf
   external depositERC721
   external depositERC721s
   external depositOldERC721
   external depositOldERC721s
   external depositERC20
   external depositEth
   external withdrawERC721
   external withdrawERC721s
   external withdrawOldERC721
   external withdrawOldERC721s
   external withdrawERC20
   external withdrawERC20s
   external withdrawEth
   public tokenURI
   private _depositERC721
   private _depositOldERC721
   private _depositERC20
   private _withdrawERC721
   private _withdrawOldERC721
   private _withdrawERC20
   private _thisBurn
   private _withdrawEth

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/loans/BaseLoan.sol

1: 
   Current order:
   public DOMAIN_SEPARATOR
   external getImprovementMinimum
   external updateImprovementMinimum
   external getCurrencyManager
   external getCollectionManager
   external cancelOffer
   external cancelAllOffers
   external cancelRenegotiationOffer
   external getUsedCapacity
   internal _getAndSetNewLoanId
   private _computeDomainSeparator
   
   Suggested order:
   external getImprovementMinimum
   external updateImprovementMinimum
   external getCurrencyManager
   external getCollectionManager
   external cancelOffer
   external cancelAllOffers
   external cancelRenegotiationOffer
   external getUsedCapacity
   public DOMAIN_SEPARATOR
   internal _getAndSetNewLoanId
   private _computeDomainSeparator

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoan.sol)

```solidity
File: src/lib/loans/LoanManager.sol

1: 
   Current order:
   external requestAddCallers
   external addCallers
   external isCallerAccepted
   external setUnderwriter
   external confirmUnderwriter
   internal afterCallerAdded
   external validateOffer
   external loanRepayment
   external loanLiquidation
   
   Suggested order:
   external requestAddCallers
   external addCallers
   external isCallerAccepted
   external setUnderwriter
   external confirmUnderwriter
   external validateOffer
   external loanRepayment
   external loanLiquidation
   internal afterCallerAdded

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManager.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

1: 
   Current order:
   external emitLoan
   external refinanceFull
   external refinancePartial
   external refinanceFromLoanExecutionData
   external addNewTranche
   external mergeTranches
   external repayLoan
   external liquidateLoan
   external loanLiquidated
   external delegate
   external revokeDelegate
   external setDelegateRegistry
   external getMinLockPeriod
   external setMinLockPeriod
   external getLoanHash
   external getMinTranchePrincipal
   external executeFlashAction
   external setFlashActionContract
   private _processOldTranchesFull
   private _processOldTranche
   private _baseLoanChecks
   private _baseRenegotiationChecks
   private _handleProtocolFeeForFee
   private _checkTrancheStrictly
   private _addTrancheFromPartial
   private _getUnlockedTime
   private _isLoanLocked
   private _validateOfferExecution
   private _validateExecutionData
   internal _checkSignature
   internal _checkStrictlyBetter
   private _getAddressesFromExecutionData
   private _checkWhitelists
   private _checkOffer
   private _checkValidators
   private _getMinTranchePrincipal
   private _hasCallback
   private _processRepayments
   private _processOffersFromExecutionData
   private _addNewTranche
   private _mergeTranches
   
   Suggested order:
   external emitLoan
   external refinanceFull
   external refinancePartial
   external refinanceFromLoanExecutionData
   external addNewTranche
   external mergeTranches
   external repayLoan
   external liquidateLoan
   external loanLiquidated
   external delegate
   external revokeDelegate
   external setDelegateRegistry
   external getMinLockPeriod
   external setMinLockPeriod
   external getLoanHash
   external getMinTranchePrincipal
   external executeFlashAction
   external setFlashActionContract
   internal _checkSignature
   internal _checkStrictlyBetter
   private _processOldTranchesFull
   private _processOldTranche
   private _baseLoanChecks
   private _baseRenegotiationChecks
   private _handleProtocolFeeForFee
   private _checkTrancheStrictly
   private _addTrancheFromPartial
   private _getUnlockedTime
   private _isLoanLocked
   private _validateOfferExecution
   private _validateExecutionData
   private _getAddressesFromExecutionData
   private _checkWhitelists
   private _checkOffer
   private _checkValidators
   private _getMinTranchePrincipal
   private _hasCallback
   private _processRepayments
   private _processOffersFromExecutionData
   private _addNewTranche
   private _mergeTranches

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/pools/Pool.sol

1: 
   Current order:
   external pausePool
   external setOptimalIdleRange
   external setBaseInterestAllocator
   external confirmBaseInterestAllocator
   external setReallocationBonus
   internal afterCallerAdded
   public totalAssets
   external getOutstandingValues
   external getDeployedQueue
   external getOutstandingValuesForQueue
   external getPendingQueueIndex
   external getAccountingValuesForQueue
   public withdraw
   public redeem
   public deposit
   public mint
   external queueClaimAll
   external deployWithdrawalQueue
   external validateOffer
   external reallocate
   external loanRepayment
   external loanLiquidation
   private _getTotalOutstandingValue
   private _getOutstandingValue
   private _getNewLoanAccounting
   private _loanTermination
   private _preDeposit
   private _getUndeployedAssets
   private _reallocate
   private _reallocateOnWithdrawal
   private _netApr
   private _deployQueue
   internal _burn
   private _updateLoanLastIds
   private _updatePendingWithdrawalWithQueue
   private _queueClaimAll
   private _outstandingApr
   private _updateOutstandingValuesOnTermination
   private _withdraw
   
   Suggested order:
   external pausePool
   external setOptimalIdleRange
   external setBaseInterestAllocator
   external confirmBaseInterestAllocator
   external setReallocationBonus
   external getOutstandingValues
   external getDeployedQueue
   external getOutstandingValuesForQueue
   external getPendingQueueIndex
   external getAccountingValuesForQueue
   external queueClaimAll
   external deployWithdrawalQueue
   external validateOffer
   external reallocate
   external loanRepayment
   external loanLiquidation
   public totalAssets
   public withdraw
   public redeem
   public deposit
   public mint
   internal afterCallerAdded
   internal _burn
   private _getTotalOutstandingValue
   private _getOutstandingValue
   private _getNewLoanAccounting
   private _loanTermination
   private _preDeposit
   private _getUndeployedAssets
   private _reallocate
   private _reallocateOnWithdrawal
   private _netApr
   private _deployQueue
   private _updateLoanLastIds
   private _updatePendingWithdrawalWithQueue
   private _queueClaimAll
   private _outstandingApr
   private _updateOutstandingValuesOnTermination
   private _withdraw

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/pools/WithdrawalQueue.sol

1: 
   Current order:
   external mint
   public tokenURI
   external withdraw
   external getAvailable
   external lockWithdrawals
   private _getAvailable
   private _getWithdrawablePerShare
   
   Suggested order:
   external mint
   external withdraw
   external getAvailable
   external lockWithdrawals
   public tokenURI
   private _getAvailable
   private _getWithdrawablePerShare

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/WithdrawalQueue.sol)

```solidity
File: src/lib/utils/Hash.sol

1: 
   Current order:
   internal hash
   private _hashOfferExecution
   internal hash
   internal hash
   internal hash
   internal hash
   internal hash
   private _hashTranche
   private _hashValidator
   
   Suggested order:
   internal hash
   internal hash
   internal hash
   internal hash
   internal hash
   internal hash
   private _hashOfferExecution
   private _hashTranche
   private _hashValidator

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/Hash.sol)

### <a name="NC-12"></a>[NC-12] Functions should not be longer than 50 lines

Overly complex code can make understanding functionality more difficult, try to further modularize your code to ensure readability

*Instances (208)*:

```solidity
File: src/lib/AddressManager.sol

43:     function add(address _entry) external onlyOwner returns (uint16) {

48:     function addToWhitelist(address _entry) external onlyOwner {

60:     function removeFromWhitelist(address _entry) external onlyOwner {

68:     function addressToIndex(address _address) external view returns (uint16) {

74:     function indexToAddress(uint16 _index) external view returns (address) {

80:     function isWhitelisted(address _entry) external view returns (bool) {

84:     function _add(address _entry) private returns (uint16) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AddressManager.sol)

```solidity
File: src/lib/AuctionLoanLiquidator.sol

126:     function addLoanContract(address _loanContract) external onlyOwner {

135:     function removeLoanContract(address _loanContract) external onlyOwner {

144:     function getValidLoanContracts() external view returns (address[] memory) {

149:     function updateLiquidationDistributor(address __liquidationDistributor) external onlyOwner {

158:     function getLiquidationDistributor() external view returns (address) {

163:     function updateTriggerFee(uint256 triggerFee) external onlyOwner {

168:     function getTriggerFee() external view returns (uint256) {

222:     function placeBid(address _nftAddress, uint256 _tokenId, Auction memory _auction, uint256 _bid)

261:     function settleAuction(Auction calldata _auction, IMultiSourceLoan.Loan calldata _loan) external nonReentrant {

306:     function getAuctionHash(address _nftAddress, uint256 _tokenId) external view returns (bytes32) {

310:     function _updateTriggerFee(uint256 triggerFee) private {

320:     function _checkAuction(address _nftAddress, uint256 _tokenId, Auction memory _auction) internal view {

326:     function _placeBidChecks(address _nftAddress, uint256 _tokenId, Auction memory _auction, uint256 _bid)

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/AuctionWithBuyoutLoanLiquidator.sol

108:     function setTimeForMainLenderToBuy(uint256 __timeForMainLenderToBuy) external onlyOwner {

118:     function getTimeForMainLenderToBuy() external view returns (uint256) {

122:     function _placeBidChecks(address _nftAddress, uint256 _tokenId, Auction memory _auction, uint256 _bid)

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionWithBuyoutLoanLiquidator.sol)

```solidity
File: src/lib/InputChecker.sol

10:     function _checkAddressNotZero(address _address) internal pure {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/InputChecker.sol)

```solidity
File: src/lib/LiquidationDistributor.sol

32:     function distribute(uint256 _proceeds, IMultiSourceLoan.Loan calldata _loan) external {

110:     function _handleLoanManagerCall(IMultiSourceLoan.Tranche calldata _tranche, uint256 _sent) private {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationDistributor.sol)

```solidity
File: src/lib/LiquidationHandler.sol

59:     function getLiquidator() external view override returns (address) {

64:     function updateLiquidationContract(address __loanLiquidator) external override onlyOwner {

72:     function updateLiquidationAuctionDuration(uint48 _newDuration) external override onlyOwner {

82:     function getLiquidationAuctionDuration() external view override returns (uint48) {

86:     function _liquidateLoan(uint256 _loanId, IMultiSourceLoan.Loan calldata _loan, bool _canClaim)

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationHandler.sol)

```solidity
File: src/lib/Multicall.sol

10:     function multicall(bytes[] calldata data) external payable override returns (bytes[] memory results) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/Multicall.sol)

```solidity
File: src/lib/UserVault.sol

105:     function tokenURI(uint256 _vaultId) public pure override returns (string memory) {

120:     function burn(uint256 _vaultId, address _assetRecipient) external {

147:     function ERC721OwnerOf(address _collection, uint256 _tokenId) external view returns (uint256) {

151:     function OldERC721OwnerOf(address _collection, uint256 _tokenId) external view returns (uint256) {

155:     function ERC20BalanceOf(uint256 _vaultId, address _token) external view returns (uint256) {

160:     function depositERC721(uint256 _vaultId, address _collection, uint256 _tokenId) external vaultExists(_vaultId) {

169:     function depositERC721s(uint256 _vaultId, address _collection, uint256[] calldata _tokenIds)

185:     function depositOldERC721(uint256 _vaultId, address _collection, uint256 _tokenId) external vaultExists(_vaultId) {

193:     function depositOldERC721s(uint256 _vaultId, address _collection, uint256[] calldata _tokenIds)

210:     function depositERC20(uint256 _vaultId, address _token, uint256 _amount) external vaultExists(_vaultId) {

219:     function depositEth(uint256 _vaultId) external payable vaultExists(_vaultId) vaultExists(_vaultId) {

226:     function withdrawERC721(uint256 _vaultId, address _collection, uint256 _tokenId) external {

231:     function withdrawERC721s(uint256 _vaultId, address[] calldata _collections, uint256[] calldata _tokenIds)

246:     function withdrawOldERC721(uint256 _vaultId, address _collection, uint256 _tokenId) external {

251:     function withdrawOldERC721s(uint256 _vaultId, address[] calldata _collections, uint256[] calldata _tokenIds)

266:     function withdrawERC20(uint256 _vaultId, address _token) external {

271:     function withdrawERC20s(uint256 _vaultId, address[] calldata _tokens) external {

285:     function _depositERC721(address _depositor, uint256 _vaultId, address _collection, uint256 _tokenId) private {

293:     function _depositOldERC721(address _depositor, uint256 _vaultId, address _collection, uint256 _tokenId) private {

304:     function _depositERC20(address _depositor, uint256 _vaultId, address _token, uint256 _amount) private {

317:     function _withdrawERC721(uint256 _vaultId, address _collection, uint256 _tokenId)

331:     function _withdrawOldERC721(uint256 _vaultId, address _collection, uint256 _tokenId)

345:     function _withdrawERC20(uint256 _vaultId, address _token) private onlyReadyForWithdrawal(_vaultId) {

357:     function _thisBurn(uint256 _vaultId, address _assetRecipient) private onlyApproved(_vaultId) {

362:     function _withdrawEth(uint256 _vaultId) private onlyReadyForWithdrawal(_vaultId) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/callbacks/CallbackHandler.sol

27:     function addWhitelistedCallbackContract(address _contract) external onlyOwner {

36:     function removeWhitelistedCallbackContract(address _contract) external onlyOwner {

43:     function isWhitelistedCallbackContract(address _contract) external view returns (bool) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/CallbackHandler.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

129:     function sell(bytes[] calldata _executionData) external {

144:     function afterPrincipalTransfer(IMultiSourceLoan.Loan memory _loan, uint256 _fee, bytes calldata _executionData)

182:     function afterNFTTransfer(IMultiSourceLoan.Loan memory _loan, bytes calldata _executionData)

229:     function updateMultiSourceLoanAddressFirst(address _newAddress) external onlyOwner {

238:     function finalUpdateMultiSourceLoanAddress(address _newAddress) external onlyOwner {

250:     function getMultiSourceLoanAddress() external view override returns (address) {

255:     function getTaxes() external view returns (Taxes memory) {

260:     function getPendingTaxes() external view returns (Taxes memory) {

265:     function getPendingTaxesSetTime() external view returns (uint256) {

270:     function updateTaxes(Taxes calldata _newTaxes) external onlyOwner {

292:     function _handleTax(IMultiSourceLoan.Loan memory _loan, uint256 _tax) private {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/BaseLoan.sol

130:     function DOMAIN_SEPARATOR() public view returns (bytes32) {

135:     function getImprovementMinimum() external view returns (ImprovementMinimum memory) {

142:     function updateImprovementMinimum(ImprovementMinimum calldata _newMinimum) external onlyOwner {

149:     function getCurrencyManager() external view returns (address) {

154:     function getCollectionManager() external view returns (address) {

167:     function cancelAllOffers(uint256 _minOfferId) external virtual {

179:     function cancelRenegotiationOffer(uint256 _renegotiationId) external virtual {

190:     function getUsedCapacity(address _lender, uint256 _offerId) external view returns (uint256) {

197:     function _getAndSetNewLoanId() internal returns (uint256) {

205:     function _computeDomainSeparator() private view returns (bytes32) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoan.sol)

```solidity
File: src/lib/loans/BaseLoanHelpers.sol

8:     function initialize(bytes32 _domainSeparator, bytes4 _magicValue) external virtual onlyOwner {}

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoanHelpers.sol)

```solidity
File: src/lib/loans/LoanManager.sol

66:     function requestAddCallers(PendingCaller[] calldata _callers) external onlyOwner {

76:     function addCallers(PendingCaller[] calldata _callers) external onlyOwner {

102:     function isCallerAccepted(address _caller) external view returns (bool) {

108:     function setUnderwriter(address __underwriter) external onlyOwner {

119:     function confirmUnderwriter(address __underwriter) external onlyOwner {

136:     function afterCallerAdded(address _caller) internal virtual;

139:     function validateOffer(bytes calldata _offer, uint256 _protocolFee) external virtual;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManager.sol)

```solidity
File: src/lib/loans/LoanManagerRegistry.sol

16:     function addLoanManager(address _loanManager) external onlyOwner {

22:     function removeLoanManager(address _loanManager) external onlyOwner {

28:     function isLoanManager(address _loanManager) external view returns (bool) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManagerRegistry.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

124:     function emitLoan(LoanExecutionData calldata _loanExecutionData)

235:     function refinancePartial(RenegotiationOffer calldata _renegotiationOffer, Loan memory _loan)

389:     function mergeTranches(uint256 _loanId, Loan memory _loan, uint256 _minTranche, uint256 _maxTranche)

405:     function repayLoan(LoanRepaymentData calldata _repaymentData) external override nonReentrant {

437:     function liquidateLoan(uint256 _loanId, Loan calldata _loan)

456:     function loanLiquidated(uint256 _loanId, Loan calldata _loan) external override onlyLiquidator {

468:     function delegate(uint256 _loanId, Loan calldata loan, address _delegate, bytes32 _rights, bool _value) external {

483:     function revokeDelegate(address _delegate, address _collection, uint256 _tokenId) external {

494:     function setDelegateRegistry(address _newDelegateRegistry) external onlyOwner {

501:     function getMinLockPeriod() external view returns (uint256) {

506:     function setMinLockPeriod(uint256 __minLockPeriod) external onlyOwner {

513:     function getLoanHash(uint256 _loanId) external view returns (bytes32) {

517:     function getMinTranchePrincipal(uint256 _loanPrincipal) external view returns (uint256) {

522:     function executeFlashAction(uint256 _loanId, Loan calldata _loan, address _target, bytes calldata _data)

548:     function setFlashActionContract(address _newFlashActionContract) external onlyOwner {

645:     function _baseLoanChecks(uint256 _loanId, Loan memory _loan) private view {

655:     function _baseRenegotiationChecks(RenegotiationOffer calldata _renegotiationOffer, Loan memory _loan)

680:     function _handleProtocolFeeForFee(address _principalAddress, address _lender, uint256 _fee, address _feeRecipient)

728:     function _getUnlockedTime(uint256 _trancheStartTime, uint256 _loanEndTime) private view returns (uint256) {

733:     function _isLoanLocked(uint256 _loanStartTime, uint256 _loanEndTime) private view returns (bool) {

791:     function _validateExecutionData(LoanExecutionData calldata _executionData, address _borrower) private view {

804:     function _checkSignature(address _signer, bytes32 _hash, bytes calldata _signature) internal view {

853:     function _getAddressesFromExecutionData(ExecutionData calldata _executionData)

865:     function _checkWhitelists(address _principalAddress, address _nftCollateralAddress) private view {

899:     function _checkValidators(LoanOffer calldata _loanOffer, uint256 _tokenId) private {

922:     function _getMinTranchePrincipal(uint256 _loanPrincipal) private view returns (uint256) {

926:     function _hasCallback(bytes calldata _callbackData) private pure returns (bool) {

930:     function _processRepayments(Loan calldata loan) private returns (uint256, uint256) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/loans/WithLoanManagers.sol

14:     function addLoanManager(address _loanManager) external onlyOwner {

20:     function removeLoanManager(address _loanManager) external onlyOwner {

26:     function isLoanManager(address _loanManager) external view returns (bool) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/WithLoanManagers.sol)

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

48:     function getBaseApr() external view override returns (uint256) {

53:     function getBaseAprWithUpdate() external view returns (uint256) {

58:     function getAssetsAllocated() external view returns (uint256) {

63:     function reallocate(uint256 _currentIdle, uint256 _targetIdle, bool) external {

93:     function _onlyPool() private view returns (address) {

101:     function _getBaseApr() private view returns (uint256) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/FeeManager.sol

35:     function getFees() external view returns (Fees memory) {

40:     function setPendingFees(Fees calldata __fees) external onlyOwner {

48:     function confirmFees(Fees calldata __fees) external {

63:     function getPendingFees() external view returns (Fees memory) {

68:     function getPendingFeesSetTime() external view returns (uint256) {

73:     function processFees(uint256 _principal, uint256 _interest) external view returns (uint256) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/FeeManager.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

68:     function setMaxSlippage(uint256 _maxSlippage) external onlyOwner {

75:     function getBaseApr() external view override returns (uint256) {

92:     function getBaseAprWithUpdate() external returns (uint256) {

109:     function getAssetsAllocated() external view returns (uint256) {

114:     function reallocate(uint256 _currentIdle, uint256 _targetIdle, bool _force) external {

139:     function _currentShareRate() private view returns (uint256) {

144:     function _onlyPool() private view returns (address) {

152:     function _exchangeAndSendWeth(address _pool, uint256 _amount, bool _force) private {

160:     function _updateLidoValues(LidoData memory _lidoData) private {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/Pool.sol

184:     function setOptimalIdleRange(OptimalIdleRange memory _optimalIdleRange) external onlyOwner {

192:     function setBaseInterestAllocator(address _newBaseInterestAllocator) external onlyOwner {

202:     function confirmBaseInterestAllocator(address _newBaseInterestAllocator) external {

224:     function setReallocationBonus(uint256 _newReallocationBonus) external onlyOwner {

234:     function afterCallerAdded(address _caller) internal override onlyOwner {

239:     function totalAssets() public view override returns (uint256) {

245:     function getOutstandingValues() external view returns (OutstandingValues memory) {

250:     function getDeployedQueue(uint256 _idx) external view returns (DeployedQueue memory) {

257:     function getOutstandingValuesForQueue(uint256 _idx) external view returns (OutstandingValues memory) {

262:     function getPendingQueueIndex() external view returns (uint256) {

269:     function getAccountingValuesForQueue(uint256 _idx) external view returns (QueueAccounting memory) {

274:     function withdraw(uint256 assets, address receiver, address owner) public override returns (uint256 shares) {

285:     function redeem(uint256 shares, address receiver, address owner) public override returns (uint256 assets) {

299:     function deposit(uint256 assets, address receiver) public override returns (uint256) {

305:     function mint(uint256 shares, address receiver) public override returns (uint256) {

317:     function deployWithdrawalQueue() external nonReentrant {

392:     function validateOffer(bytes calldata _offer, uint256 _protocolFee) external override onlyAcceptedCallers {

419:     function reallocate() external nonReentrant returns (uint256) {

468:     function _getTotalOutstandingValue() private view returns (uint256) {

487:     function _getOutstandingValue(OutstandingValues memory __outstandingValues) private view returns (uint256) {

498:     function _getNewLoanAccounting(uint256 _principalAmount, uint256 _apr)

563:     function _getUndeployedAssets() private view returns (uint256) {

570:     function _reallocate() private returns (uint256, uint256) {

591:     function _reallocateOnWithdrawal(uint256 _withdrawn) private {

604:     function _netApr(uint256 _apr, uint256 _protocolFee) private pure returns (uint256) {

609:     function _deployQueue(ERC20 _asset) private returns (DeployedQueue memory) {

616:     function _burn(address from, uint256 amount) internal override {

687:     function _queueClaimAll(uint256 _totalToBeWithdrawn, uint256 _cachedPendingQueueIndex) private {

720:     function _outstandingApr(OutstandingValues memory __outstandingValues) private pure returns (uint128) {

757:     function _withdraw(address owner, address receiver, uint256 assets, uint256 shares) private {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/pools/PoolOfferHandler.sol

80:     function setTerms(TermsKey[] calldata _termKeys, Terms[] calldata __terms) external onlyOwner {

100:     function confirmTerms(TermsKey[] calldata _termKeys, Terms[] calldata __terms) external {

154:     function validateOffer(uint256 _baseRate, bytes calldata _offer)

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/PoolOfferHandler.sol)

```solidity
File: src/lib/pools/WithdrawalQueue.sol

61:     function mint(address _to, uint256 _shares) external returns (uint256) {

75:     function tokenURI(uint256 _id) public pure override returns (string memory) {

84:     function withdraw(address _to, uint256 _tokenId) external returns (uint256) {

111:     function getAvailable(uint256 _tokenId) external view returns (uint256) {

118:     function lockWithdrawals(uint256 _tokenId, uint256 _time) external {

137:     function _getAvailable(uint256 _tokenId) private view returns (uint256) {

142:     function _getWithdrawablePerShare() private view returns (uint256) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/WithdrawalQueue.sol)

```solidity
File: src/lib/utils/BytesLib.sol

12:     function slice(bytes memory _bytes, uint256 _start, uint256 _length) internal pure returns (bytes memory) {

72:     function toAddress(bytes memory _bytes, uint256 _start) internal pure returns (address) {

84:     function toUint24(bytes memory _bytes, uint256 _start) internal pure returns (uint24) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/BytesLib.sol)

```solidity
File: src/lib/utils/Hash.sol

39:     function hash(IMultiSourceLoan.LoanOffer memory _loanOffer) internal pure returns (bytes32) {

68:     function _hashOfferExecution(IMultiSourceLoan.OfferExecution memory _offerExecution)

83:     function hash(IMultiSourceLoan.ExecutionData memory _executionData) internal pure returns (bytes32) {

106:     function hash(IMultiSourceLoan.SignableRepaymentData memory _repaymentData) internal pure returns (bytes32) {

117:     function hash(IMultiSourceLoan.Loan memory _loan) internal pure returns (bytes32) {

140:     function hash(IMultiSourceLoan.RenegotiationOffer memory _refinanceOffer) internal pure returns (bytes32) {

164:     function hash(IAuctionLoanLiquidator.Auction memory _auction) internal pure returns (bytes32) {

182:     function _hashTranche(IMultiSourceLoan.Tranche memory _tranche) private pure returns (bytes32) {

197:     function _hashValidator(IBaseLoan.OfferValidator memory _validator) private pure returns (bytes32) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/Hash.sol)

```solidity
File: src/lib/utils/Interest.sol

15:     function getInterest(IMultiSourceLoan.LoanOffer memory _loanOffer) internal pure returns (uint256) {

19:     function getInterest(uint256 _amount, uint256 _aprBps, uint256 _duration) internal pure returns (uint256) {

23:     function getTotalOwed(IMultiSourceLoan.Loan memory _loan, uint256 _timestamp) internal pure returns (uint256) {

36:     function _getInterest(uint256 _amount, uint256 _aprBps, uint256 _duration) private pure returns (uint256) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/Interest.sol)

```solidity
File: src/lib/utils/TwoStepOwned.sol

26:     function requestTransferOwner(address _newOwner) external onlyOwner {

35:     function transferOwnership(address newOwner) public override onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/TwoStepOwned.sol)

```solidity
File: src/lib/utils/ValidatorHelpers.sol

15:     function validateTokenIdPackedList(uint256 _tokenId, uint64 _bytesPerTokenId, bytes memory _tokenIdList)

72:     function validateNFTBitVector(uint256 _tokenId, bytes memory _bitVector) internal pure {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/ValidatorHelpers.sol)

```solidity
File: src/lib/utils/WithProtocolFee.sol

44:     function getProtocolFee() external view returns (ProtocolFee memory) {

49:     function getPendingProtocolFee() external view returns (ProtocolFee memory) {

54:     function getPendingProtocolFeeSetTime() external view returns (uint256) {

60:     function updateProtocolFee(ProtocolFee calldata _newProtocolFee) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/WithProtocolFee.sol)

### <a name="NC-13"></a>[NC-13] Change uint to uint256

Throughout the code base, some variables are declared as `uint`. To favor explicitness, consider changing all instances of `uint` to `uint256`

*Instances (1)*:

```solidity
File: src/lib/utils/BytesLib.sol

90:             tempUint := mload(add(add(_bytes, 0x3), _start))

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/BytesLib.sol)

### <a name="NC-14"></a>[NC-14] Lack of checks in setters

Be it sanity checks (like checks against `0`-values) or initial setting checks: it's best for Setter functions to have them

*Instances (15)*:

```solidity
File: src/lib/AuctionLoanLiquidator.sol

149:     function updateLiquidationDistributor(address __liquidationDistributor) external onlyOwner {
             _checkAddressNotZero(__liquidationDistributor);
     
             _liquidationDistributor = ILiquidationDistributor(__liquidationDistributor);
     
             emit LiquidationDistributorUpdated(__liquidationDistributor);

163:     function updateTriggerFee(uint256 triggerFee) external onlyOwner {
             _updateTriggerFee(triggerFee);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/LiquidationHandler.sol

64:     function updateLiquidationContract(address __loanLiquidator) external override onlyOwner {
            _checkAddressNotZero(__loanLiquidator);
            _loanLiquidator = __loanLiquidator;
    
            emit LiquidationContractUpdated(__loanLiquidator);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationHandler.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

229:     function updateMultiSourceLoanAddressFirst(address _newAddress) external onlyOwner {
             _checkAddressNotZero(_newAddress);
     
             _pendingMultiSourceLoanAddress = _newAddress;
     
             emit MultiSourceLoanPendingUpdate(_newAddress);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/BaseLoan.sol

142:     function updateImprovementMinimum(ImprovementMinimum calldata _newMinimum) external onlyOwner {
             _minimum = _newMinimum;
     
             emit ImprovementMinimumUpdated(_newMinimum);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoan.sol)

```solidity
File: src/lib/loans/LoanManager.sol

108:     function setUnderwriter(address __underwriter) external onlyOwner {
             _checkAddressNotZero(__underwriter);
     
             getPendingUnderwriter = __underwriter;
             getPendingUnderwriterSetTime = block.timestamp;
     
             emit PendingUnderwriterSet(__underwriter);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManager.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

494:     function setDelegateRegistry(address _newDelegateRegistry) external onlyOwner {
             getDelegateRegistry = _newDelegateRegistry;
     
             emit DelegateRegistryUpdated(_newDelegateRegistry);

506:     function setMinLockPeriod(uint256 __minLockPeriod) external onlyOwner {
             _minLockPeriod = __minLockPeriod;
     
             emit MinLockPeriodUpdated(__minLockPeriod);

548:     function setFlashActionContract(address _newFlashActionContract) external onlyOwner {
             getFlashActionContract = _newFlashActionContract;
     
             emit FlashActionContractUpdated(_newFlashActionContract);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/pools/FeeManager.sol

40:     function setPendingFees(Fees calldata __fees) external onlyOwner {
            _pendingFees = __fees;
            _pendingFeesSetTime = block.timestamp;
    
            emit PendingFeesSet(__fees);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/FeeManager.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

68:     function setMaxSlippage(uint256 _maxSlippage) external onlyOwner {
            getMaxSlippage = _maxSlippage;
    
            emit MaxSlippageSet(_maxSlippage);

104:     function updateLidoValues() external {
             _updateLidoValues(getLidoData);

160:     function _updateLidoValues(LidoData memory _lidoData) private {
             uint256 shareRate = _currentShareRate();
             _lidoData.aprBps = uint16(
                 _BPS * _SECONDS_PER_YEAR * (shareRate - _lidoData.shareRate) / _lidoData.shareRate
                     / (block.timestamp - _lidoData.lastTs)
             );
             _lidoData.shareRate = uint144(shareRate);
             _lidoData.lastTs = uint96(block.timestamp);
             getLidoData = _lidoData;
             emit LidoValuesUpdated(_lidoData);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/Pool.sol

184:     function setOptimalIdleRange(OptimalIdleRange memory _optimalIdleRange) external onlyOwner {
             _optimalIdleRange.mid = (_optimalIdleRange.min + _optimalIdleRange.max) / 2;
             getOptimalIdleRange = _optimalIdleRange;
     
             emit OptimalIdleRangeSet(_optimalIdleRange);

192:     function setBaseInterestAllocator(address _newBaseInterestAllocator) external onlyOwner {
             _checkAddressNotZero(_newBaseInterestAllocator);
     
             getPendingBaseInterestAllocator = _newBaseInterestAllocator;
             getPendingBaseInterestAllocatorSetTime = block.timestamp;
     
             emit PendingBaseInterestAllocatorSet(_newBaseInterestAllocator);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

### <a name="NC-15"></a>[NC-15] Missing Event for critical parameters change

Events help non-contract tools to track changes, and events prevent users from being surprised by changes.

*Instances (2)*:

```solidity
File: src/lib/AuctionLoanLiquidator.sol

163:     function updateTriggerFee(uint256 triggerFee) external onlyOwner {
             _updateTriggerFee(triggerFee);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

104:     function updateLidoValues() external {
             _updateLidoValues(getLidoData);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

### <a name="NC-16"></a>[NC-16] NatSpec is completely non-existent on functions that should have them

Public and external functions that aren't view or pure should have NatSpec comments

*Instances (7)*:

```solidity
File: src/lib/Multicall.sol

10:     function multicall(bytes[] calldata data) external payable override returns (bytes[] memory results) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/Multicall.sol)

```solidity
File: src/lib/loans/LoanManagerRegistry.sol

16:     function addLoanManager(address _loanManager) external onlyOwner {

22:     function removeLoanManager(address _loanManager) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManagerRegistry.sol)

```solidity
File: src/lib/loans/WithLoanManagers.sol

14:     function addLoanManager(address _loanManager) external onlyOwner {

20:     function removeLoanManager(address _loanManager) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/WithLoanManagers.sol)

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

78:     function transferAll() external {

89:     function claimRewards() external {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)

### <a name="NC-17"></a>[NC-17] Incomplete NatSpec: `@param` is missing on actually documented functions

The following functions are missing `@param` NatSpec comments.

*Instances (3)*:

```solidity
File: src/lib/AddressManager.sol

41:     /// @notice Adds an address to the directory. If it already exists,
        ///        reverts. It assumes it's whitelisted.
        function add(address _entry) external onlyOwner returns (uint16) {

47:     /// @notice Whitelist an address that's already part of the directory.
        function addToWhitelist(address _entry) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AddressManager.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

67:     /// @notice Set max slippage allow for reallocations.
        function setMaxSlippage(uint256 _maxSlippage) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

### <a name="NC-18"></a>[NC-18] Incomplete NatSpec: `@return` is missing on actually documented functions

The following functions are missing `@return` NatSpec comments.

*Instances (1)*:

```solidity
File: src/lib/AddressManager.sol

41:     /// @notice Adds an address to the directory. If it already exists,
        ///        reverts. It assumes it's whitelisted.
        function add(address _entry) external onlyOwner returns (uint16) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AddressManager.sol)

### <a name="NC-19"></a>[NC-19] File's first line is not an SPDX Identifier

*Instances (1)*:

```solidity
File: src/lib/utils/TwoStepOwned.sol

1: pragma solidity ^0.8.21;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/TwoStepOwned.sol)

### <a name="NC-20"></a>[NC-20] Use a `modifier` instead of a `require/if` statement for a special `msg.sender` actor

If a function is supposed to be access-controlled, a `modifier` should be used instead of a `require/if` statement for more readability.

*Instances (20)*:

```solidity
File: src/lib/AuctionLoanLiquidator.sol

186:         if (!_validLoanContracts.contains(msg.sender)) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/AuctionWithBuyoutLoanLiquidator.sol

78:         if (msg.sender != _loan.tranche[largestTrancheIdx].lender) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionWithBuyoutLoanLiquidator.sol)

```solidity
File: src/lib/LiquidationHandler.sol

52:         if (msg.sender != address(_loanLiquidator)) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationHandler.sol)

```solidity
File: src/lib/UserVault.sol

81:         if (_readyForWithdrawal[_vaultId] != msg.sender) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

91:         if (msg.sender != address(_multiSourceLoan)) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/LoanManager.sol

58:         if (!_acceptedCallers.contains(msg.sender)) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManager.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

190:         } else if (msg.sender != _loan.borrower) {

239:         if (msg.sender != _renegotiationOffer.lender) {

409:         if (msg.sender != loan.borrower) {

472:         if (msg.sender != loan.borrower) {

529:         if (msg.sender != _loan.borrower) {

792:         if (msg.sender != _borrower) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

95:         if (pool != msg.sender) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

146:         if (pool != msg.sender) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/Pool.sol

276:         if (msg.sender != owner) {

279:             if (allowed != type(uint256).max) allowance[owner][msg.sender] = allowed - shares;

286:         if (msg.sender != owner) {

289:             if (allowed != type(uint256).max) allowance[owner][msg.sender] = allowed - shares;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/pools/WithdrawalQueue.sol

62:         if (msg.sender != getPool) {

120:         if (!(msg.sender == owner || isApprovedForAll[owner][msg.sender] || msg.sender == getApproved[_tokenId])) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/WithdrawalQueue.sol)

### <a name="NC-21"></a>[NC-21] Constant state variables defined more than once

Rather than redefining state variable constant, consider using a library to store all constants as this will prevent data redundancy

*Instances (16)*:

```solidity
File: src/lib/AuctionLoanLiquidator.sol

42:     uint256 internal constant _BPS = 10000;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/UserVault.sol

19:     string private constant _BASE_URI = "https://gondi.xyz/user_vaults/";

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

28:     uint256 private constant _PRECISION = 10000;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/BaseLoan.sol

35:     uint256 internal constant _PRECISION = 10000;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoan.sol)

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

21:     uint256 private constant _BPS = 10000;

22:     uint128 private constant _PRINCIPAL_PRECISION = 1e20;

23:     uint256 private constant _SECONDS_PER_YEAR = 365 days;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

27:     uint256 private constant _BPS = 10000;

28:     uint256 private constant _SECONDS_PER_YEAR = 365 days;

29:     uint256 private constant _PRINCIPAL_PRECISION = 1e20;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/Pool.sol

44:     uint256 private constant _SECONDS_PER_YEAR = 31536000;

47:     uint16 private constant _BPS = 10000;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/pools/PoolOfferHandler.sol

36:     uint256 private constant _BPS = 10000;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/PoolOfferHandler.sol)

```solidity
File: src/lib/pools/WithdrawalQueue.sol

24:     string private constant _BASE_URI = "https://gondi.xyz/withdrawal-queue/";

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/WithdrawalQueue.sol)

```solidity
File: src/lib/utils/Interest.sol

11:     uint256 private constant _PRECISION = 10000;

13:     uint256 private constant _SECONDS_PER_YEAR = 31536000;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/Interest.sol)

### <a name="NC-22"></a>[NC-22] Consider using named mappings

Consider moving to solidity version 0.8.18 or later, and using [named mappings](https://ethereum.stackexchange.com/questions/51629/how-to-name-the-arguments-in-mapping/145555#145555) to make it easier to understand the purpose of each mapping

*Instances (17)*:

```solidity
File: src/lib/AddressManager.sol

23:     mapping(address => uint16) private _directory;

25:     mapping(uint16 => address) private _inverseDirectory;

27:     mapping(address => bool) private _whitelist;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AddressManager.sol)

```solidity
File: src/lib/AuctionLoanLiquidator.sol

56:     mapping(address => mapping(uint256 => bytes32)) internal _auctions;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/UserVault.sol

25:     mapping(uint256 => address) _readyForWithdrawal;

28:     mapping(address => mapping(uint256 => uint256)) _vaultERC721s;

31:     mapping(address => mapping(uint256 => uint256)) _vaultOldERC721s;

34:     mapping(address => mapping(uint256 => uint256)) _vaultERC20s;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/callbacks/CallbackHandler.sol

14:     mapping(address => bool) internal _isWhitelistedCallbackContract;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/CallbackHandler.sol)

```solidity
File: src/lib/loans/BaseLoan.sol

49:     mapping(address => mapping(uint256 => uint256)) internal _used;

52:     mapping(address => mapping(uint256 => bool)) public isOfferCancelled;

54:     mapping(address => uint256) public minOfferId;

57:     mapping(address => mapping(uint256 => bool)) public isRenegotiationOfferCancelled;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoan.sol)

```solidity
File: src/lib/loans/LoanManager.sol

31:     mapping(address => bool) internal _isLoanContract;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManager.sol)

```solidity
File: src/lib/loans/LoanManagerRegistry.sol

9:     mapping(address => bool) private _loanManagers;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManagerRegistry.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

45:     mapping(uint256 => bytes32) private _loans;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/loans/WithLoanManagers.sol

7:     mapping(address => bool) internal _loanManagers;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/WithLoanManagers.sol)

### <a name="NC-23"></a>[NC-23] `address`s shouldn't be hard-coded

It is often better to declare `address`es as `immutable`, and assign them via constructor arguments. This allows the code to remain the same across deployments on different networks, and avoids recompilation when addresses need to change.

*Instances (1)*:

```solidity
File: src/lib/UserVault.sol

22:     address public constant ETH = address(0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

### <a name="NC-24"></a>[NC-24] Variable names that consist of all capital letters should be reserved for `constant`/`immutable` variables

If the variable needs to be different based on which class it comes from, a `view`/`pure` *function* should be used instead (e.g. like [this](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/76eee35971c2541585e05cbf258510dda7b2fbc6/contracts/token/ERC20/extensions/draft-IERC20Permit.sol#L59)).

*Instances (1)*:

```solidity
File: src/lib/utils/TwoStepOwned.sol

1: pragma solidity ^0.8.21;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/TwoStepOwned.sol)

### <a name="NC-25"></a>[NC-25] Owner can renounce while system is paused

The contract owner or single user with a role is not prevented from renouncing the role/ownership while the contract is paused, which would cause any user assets stored in the protocol, to be locked indefinitely.

*Instances (1)*:

```solidity
File: src/lib/pools/Pool.sol

177:     function pausePool() external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

### <a name="NC-26"></a>[NC-26] Adding a `return` statement when the function defines a named return variable, is redundant

*Instances (1)*:

```solidity
File: src/lib/pools/PoolOfferHandler.sol

153:     /// @inheritdoc IPoolOfferHandler
         function validateOffer(uint256 _baseRate, bytes calldata _offer)
             external
             view
             override
             returns (uint256 principalAmount, uint256 aprBps)
         {
             /// @dev bring to memory
             IMultiSourceLoan.OfferExecution memory offerExecution = abi.decode(_offer, (IMultiSourceLoan.OfferExecution));
             uint256 aprPremium = _terms[offerExecution.offer.nftCollateralAddress][offerExecution.offer.duration][offerExecution
                 .offer
                 .maxSeniorRepayment][offerExecution.offer.principalAmount];
             if (offerExecution.offer.aprBps < _baseRate + aprPremium || aprPremium == 0) {
                 revert InvalidAprError();
             }
             return (offerExecution.amount, offerExecution.offer.aprBps);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/PoolOfferHandler.sol)

### <a name="NC-27"></a>[NC-27] `require()` / `revert()` statements should have descriptive reason strings

*Instances (2)*:

```solidity
File: src/lib/callbacks/CallbackHandler.sol

63:             revert ILoanCallback.InvalidCallbackError();

81:             revert ILoanCallback.InvalidCallbackError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/CallbackHandler.sol)

### <a name="NC-28"></a>[NC-28] Take advantage of Custom Error's return value property

An important feature of Custom Error is that values such as address, tokenID, msg.value can be written inside the () sign, this kind of approach provides a serious advantage in debugging and examining the revert details of dapps such as tenderly.

*Instances (101)*:

```solidity
File: src/lib/AuctionLoanLiquidator.sol

117:             revert ZeroAddressError();

128:             revert CouldNotModifyValidLoansError();

137:             revert CouldNotModifyValidLoansError();

191:             revert CurrencyNotWhitelistedError();

195:             revert CollectionNotWhitelistedError();

199:             revert AuctionAlreadyInProgressError();

267:             revert NoBidsError();

322:             revert InvalidHashAuctionError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/AuctionWithBuyoutLoanLiquidator.sol

79:             revert NotMainLenderError();

110:             revert InvalidInputError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionWithBuyoutLoanLiquidator.sol)

```solidity
File: src/lib/InputChecker.sol

12:             revert AddressZeroError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/InputChecker.sol)

```solidity
File: src/lib/LiquidationHandler.sol

74:             revert InvalidDurationError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationHandler.sol)

```solidity
File: src/lib/UserVault.sol

162:             revert CollectionNotWhitelistedError();

174:             revert CollectionNotWhitelistedError();

187:             revert CollectionNotWhitelistedError();

198:             revert CollectionNotWhitelistedError();

212:             revert WrongMethodError();

235:             revert LengthMismatchError();

255:             revert LengthMismatchError();

295:             revert InvalidCallerError();

306:             revert CurrencyNotWhitelistedError();

322:             revert AssetNotOwnedError();

336:             revert AssetNotOwnedError();

371:             revert WithdrawingETHError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/callbacks/CallbackHandler.sol

63:             revert ILoanCallback.InvalidCallbackError();

81:             revert ILoanCallback.InvalidCallbackError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/CallbackHandler.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

92:             revert OnlyLoanCallableError();

120:                 revert CouldNotReturnEthError();

152:             revert MarketplaceAddressNotWhitelisted();

155:             revert OnlyWethSupportedError();

163:             revert InvalidCallbackError();

190:             revert MarketplaceAddressNotWhitelisted();

222:             revert InvalidCallbackError();

240:             revert InvalidAddressUpdateError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/LoanManager.sol

59:             revert CallerNotAccepted();

78:             revert TooSoonError();

85:                 revert InvalidInputError();

121:             revert TooSoonError();

124:             revert InvalidInputError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManager.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

179:                 revert LoanLockedError();

191:             revert InvalidCallerError();

240:             revert InvalidCallerError();

243:             revert LoanLockedError();

260:                 revert InvalidRenegotiationOfferError();

287:             revert InvalidRenegotiationOfferError();

323:             revert InvalidAddressesError();

360:             revert TooManyTranchesError();

473:             revert InvalidCallerError();

485:             revert InvalidMethodError();

530:             revert InvalidCallerError();

541:             revert NFTNotReturnedError();

650:             revert LoanExpiredError();

663:             revert InvalidRenegotiationOfferError();

704:             revert InvalidRenegotiationOfferError();

719:             revert InvalidRenegotiationOfferError();

778:             revert ZeroDurationError();

781:             revert ZeroInterestError();

784:             revert MaxCapacityExceededError();

809:                 revert InvalidSignatureError();

814:                 revert InvalidSignatureError();

845:             revert NotStrictlyImprovedError();

867:             revert CurrencyNotWhitelistedError();

870:             revert CollectionNotWhitelistedError();

886:             revert InvalidAddressesError();

889:             revert InvalidTrancheError();

903:                 revert InvalidCollateralIdError();

908:                 revert InvalidCollateralIdError();

1096:             revert InvalidParametersError();

1122:                 revert MismatchError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

37:             revert InvalidPoolError();

96:             revert InvalidCallerError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/FeeManager.sol

50:             revert TooSoonError();

54:             revert InvalidFeesError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/FeeManager.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

56:             revert InvalidPoolError();

86:             revert InvalidAprError();

98:             revert InvalidAprError();

147:             revert InvalidCallerError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/Pool.sol

156:             revert InvalidInputError();

206:                 revert TooSoonError();

209:                 revert InvalidInputError();

226:             revert InvalidInputError();

324:             revert TooSoonError();

329:             revert NoSharesPendingWithdrawalError();

394:             revert PoolStatusError();

408:             revert InsufficientAssetsError();

557:             revert PoolStatusError();

574:             revert AllocationAlreadyOptimalError();

582:             revert AllocationAlreadyOptimalError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/pools/PoolOfferHandler.sol

82:             revert InvalidInputError();

86:                 revert InvalidDurationError();

102:             revert TooSoonError();

106:                 revert InvalidDurationError();

111:                 revert InvalidTermsError();

166:             revert InvalidAprError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/PoolOfferHandler.sol)

```solidity
File: src/lib/pools/WithdrawalQueue.sol

63:             revert PoolOnlyCallableError();

92:             revert NotApprovedOrOwnerError();

121:             revert NotApprovedOrOwnerError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/WithdrawalQueue.sol)

```solidity
File: src/lib/utils/TwoStepOwned.sol

37:             revert TooSoonError();

40:             revert InvalidInputError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/TwoStepOwned.sol)

```solidity
File: src/lib/utils/ValidatorHelpers.sol

24:             revert EmptyTokenIdListError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/ValidatorHelpers.sol)

```solidity
File: src/lib/utils/WithProtocolFee.sol

79:             revert TooSoonError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/WithProtocolFee.sol)

### <a name="NC-29"></a>[NC-29] Avoid the use of sensitive terms

Use [alternative variants](https://www.zdnet.com/article/mysql-drops-master-slave-and-blacklist-whitelist-terminology/), e.g. allowlist/denylist instead of whitelist/blacklist

*Instances (57)*:

```solidity
File: src/lib/AddressManager.sol

15:     event AddressRemovedFromWhitelist(address address_removed);

17:     event AddressWhitelisted(address address_whitelisted);

27:     mapping(address => bool) private _whitelist;

48:     function addToWhitelist(address _entry) external onlyOwner {

52:         _whitelist[_entry] = true;

54:         emit AddressWhitelisted(_entry);

60:     function removeFromWhitelist(address _entry) external onlyOwner {

61:         _whitelist[_entry] = false;

63:         emit AddressRemovedFromWhitelist(_entry);

80:     function isWhitelisted(address _entry) external view returns (bool) {

81:         return _whitelist[_entry];

94:         _whitelist[_entry] = true;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AddressManager.sol)

```solidity
File: src/lib/AuctionLoanLiquidator.sol

97:     error CurrencyNotWhitelistedError();

99:     error CollectionNotWhitelistedError();

190:         if (!_currencyManager.isWhitelisted(_asset)) {

191:             revert CurrencyNotWhitelistedError();

194:         if (!_collectionManager.isWhitelisted(_nftAddress)) {

195:             revert CollectionNotWhitelistedError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/UserVault.sol

52:     error CurrencyNotWhitelistedError();

54:     error CollectionNotWhitelistedError();

161:         if (!_collectionManager.isWhitelisted(_collection)) {

162:             revert CollectionNotWhitelistedError();

173:         if (!_collectionManager.isWhitelisted(_collection)) {

174:             revert CollectionNotWhitelistedError();

186:         if (!_collectionManager.isWhitelisted(_collection)) {

187:             revert CollectionNotWhitelistedError();

197:         if (!_collectionManager.isWhitelisted(_collection)) {

198:             revert CollectionNotWhitelistedError();

305:         if (!_currencyManager.isWhitelisted(_token)) {

306:             revert CurrencyNotWhitelistedError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/callbacks/CallbackHandler.sol

14:     mapping(address => bool) internal _isWhitelistedCallbackContract;

18:     event WhitelistedCallbackContractAdded(address contractAdded);

19:     event WhitelistedCallbackContractRemoved(address contractRemoved);

27:     function addWhitelistedCallbackContract(address _contract) external onlyOwner {

29:         _isWhitelistedCallbackContract[_contract] = true;

31:         emit WhitelistedCallbackContractAdded(_contract);

36:     function removeWhitelistedCallbackContract(address _contract) external onlyOwner {

37:         _isWhitelistedCallbackContract[_contract] = false;

39:         emit WhitelistedCallbackContractRemoved(_contract);

43:     function isWhitelistedCallbackContract(address _contract) external view returns (bool) {

44:         return _isWhitelistedCallbackContract[_contract];

59:             !_isWhitelistedCallbackContract[_callbackAddress]

77:             !_isWhitelistedCallbackContract[_callbackAddress]

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/CallbackHandler.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

53:     error MarketplaceAddressNotWhitelisted();

151:         if (!_marketplaceContractsAddressManager.isWhitelisted(executionInfo.module)) {

152:             revert MarketplaceAddressNotWhitelisted();

189:         if (!_marketplaceContractsAddressManager.isWhitelisted(executionInfo.module)) {

190:             revert MarketplaceAddressNotWhitelisted();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/BaseLoan.sol

89:     error CurrencyNotWhitelistedError();

91:     error CollectionNotWhitelistedError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoan.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

136:         _checkWhitelists(principalAddress, nftCollateralAddress);

320:         _checkWhitelists(principalAddress, nftCollateralAddress);

865:     function _checkWhitelists(address _principalAddress, address _nftCollateralAddress) private view {

866:         if (!_currencyManager.isWhitelisted(_principalAddress)) {

867:             revert CurrencyNotWhitelistedError();

869:         if (!_collectionManager.isWhitelisted(_nftCollateralAddress)) {

870:             revert CollectionNotWhitelistedError();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

### <a name="NC-30"></a>[NC-30] Contract does not follow the Solidity style guide's suggested layout ordering

The [style guide](https://docs.soliditylang.org/en/v0.8.16/style-guide.html#order-of-layout) says that, within a contract, the ordering should be:

1) Type declarations
2) State variables
3) Events
4) Modifiers
5) Functions

However, the contract(s) below do not follow this ordering

*Instances (15)*:

```solidity
File: src/lib/AddressManager.sol

1: 
   Current order:
   EventDefinition.AddressAdded
   EventDefinition.AddressRemovedFromWhitelist
   EventDefinition.AddressWhitelisted
   ErrorDefinition.AddressAlreadyAddedError
   ErrorDefinition.AddressNotAddedError
   VariableDeclaration._directory
   VariableDeclaration._inverseDirectory
   VariableDeclaration._whitelist
   VariableDeclaration._lastAdded
   FunctionDefinition.constructor
   FunctionDefinition.add
   FunctionDefinition.addToWhitelist
   FunctionDefinition.removeFromWhitelist
   FunctionDefinition.addressToIndex
   FunctionDefinition.indexToAddress
   FunctionDefinition.isWhitelisted
   FunctionDefinition._add
   
   Suggested order:
   VariableDeclaration._directory
   VariableDeclaration._inverseDirectory
   VariableDeclaration._whitelist
   VariableDeclaration._lastAdded
   ErrorDefinition.AddressAlreadyAddedError
   ErrorDefinition.AddressNotAddedError
   EventDefinition.AddressAdded
   EventDefinition.AddressRemovedFromWhitelist
   EventDefinition.AddressWhitelisted
   FunctionDefinition.constructor
   FunctionDefinition.add
   FunctionDefinition.addToWhitelist
   FunctionDefinition.removeFromWhitelist
   FunctionDefinition.addressToIndex
   FunctionDefinition.indexToAddress
   FunctionDefinition.isWhitelisted
   FunctionDefinition._add

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AddressManager.sol)

```solidity
File: src/lib/AuctionLoanLiquidator.sol

1: 
   Current order:
   UsingForDirective.EnumerableSet.AddressSet
   UsingForDirective.FixedPointMathLib
   UsingForDirective.Auction
   UsingForDirective.ERC20
   VariableDeclaration.MAX_TRIGGER_FEE
   VariableDeclaration.MIN_INCREMENT_BPS
   VariableDeclaration._BPS
   VariableDeclaration._MIN_NO_ACTION_MARGIN
   VariableDeclaration._liquidationDistributor
   VariableDeclaration._currencyManager
   VariableDeclaration._collectionManager
   VariableDeclaration._triggerFee
   VariableDeclaration._validLoanContracts
   VariableDeclaration._auctions
   EventDefinition.LoanContractAdded
   EventDefinition.LoanContractRemoved
   EventDefinition.LiquidationDistributorUpdated
   EventDefinition.LoanLiquidationStarted
   EventDefinition.BidPlaced
   EventDefinition.AuctionSettled
   EventDefinition.TriggerFeeUpdated
   ErrorDefinition.InvalidHashAuctionError
   ErrorDefinition.NFTNotOwnedError
   ErrorDefinition.MinBidError
   ErrorDefinition.AuctionOverError
   ErrorDefinition.AuctionNotOverError
   ErrorDefinition.AuctionAlreadyInProgressError
   ErrorDefinition.NoBidsError
   ErrorDefinition.CurrencyNotWhitelistedError
   ErrorDefinition.CollectionNotWhitelistedError
   ErrorDefinition.LoanNotAcceptedError
   ErrorDefinition.ZeroAddressError
   ErrorDefinition.InvalidTriggerFee
   ErrorDefinition.CouldNotModifyValidLoansError
   FunctionDefinition.constructor
   FunctionDefinition.addLoanContract
   FunctionDefinition.removeLoanContract
   FunctionDefinition.getValidLoanContracts
   FunctionDefinition.updateLiquidationDistributor
   FunctionDefinition.getLiquidationDistributor
   FunctionDefinition.updateTriggerFee
   FunctionDefinition.getTriggerFee
   FunctionDefinition.liquidateLoan
   FunctionDefinition.placeBid
   FunctionDefinition.settleAuction
   FunctionDefinition.getAuctionHash
   FunctionDefinition._updateTriggerFee
   FunctionDefinition._checkAuction
   FunctionDefinition._placeBidChecks
   
   Suggested order:
   UsingForDirective.EnumerableSet.AddressSet
   UsingForDirective.FixedPointMathLib
   UsingForDirective.Auction
   UsingForDirective.ERC20
   VariableDeclaration.MAX_TRIGGER_FEE
   VariableDeclaration.MIN_INCREMENT_BPS
   VariableDeclaration._BPS
   VariableDeclaration._MIN_NO_ACTION_MARGIN
   VariableDeclaration._liquidationDistributor
   VariableDeclaration._currencyManager
   VariableDeclaration._collectionManager
   VariableDeclaration._triggerFee
   VariableDeclaration._validLoanContracts
   VariableDeclaration._auctions
   ErrorDefinition.InvalidHashAuctionError
   ErrorDefinition.NFTNotOwnedError
   ErrorDefinition.MinBidError
   ErrorDefinition.AuctionOverError
   ErrorDefinition.AuctionNotOverError
   ErrorDefinition.AuctionAlreadyInProgressError
   ErrorDefinition.NoBidsError
   ErrorDefinition.CurrencyNotWhitelistedError
   ErrorDefinition.CollectionNotWhitelistedError
   ErrorDefinition.LoanNotAcceptedError
   ErrorDefinition.ZeroAddressError
   ErrorDefinition.InvalidTriggerFee
   ErrorDefinition.CouldNotModifyValidLoansError
   EventDefinition.LoanContractAdded
   EventDefinition.LoanContractRemoved
   EventDefinition.LiquidationDistributorUpdated
   EventDefinition.LoanLiquidationStarted
   EventDefinition.BidPlaced
   EventDefinition.AuctionSettled
   EventDefinition.TriggerFeeUpdated
   FunctionDefinition.constructor
   FunctionDefinition.addLoanContract
   FunctionDefinition.removeLoanContract
   FunctionDefinition.getValidLoanContracts
   FunctionDefinition.updateLiquidationDistributor
   FunctionDefinition.getLiquidationDistributor
   FunctionDefinition.updateTriggerFee
   FunctionDefinition.getTriggerFee
   FunctionDefinition.liquidateLoan
   FunctionDefinition.placeBid
   FunctionDefinition.settleAuction
   FunctionDefinition.getAuctionHash
   FunctionDefinition._updateTriggerFee
   FunctionDefinition._checkAuction
   FunctionDefinition._placeBidChecks

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/AuctionWithBuyoutLoanLiquidator.sol

1: 
   Current order:
   UsingForDirective.FixedPointMathLib
   UsingForDirective.Interest
   UsingForDirective.ERC20
   VariableDeclaration._timeForMainLenderToBuy
   VariableDeclaration.MAX_TIME_FOR_MAIN_LENDER_TO_BUY
   EventDefinition.AuctionSettledWithBuyout
   EventDefinition.TimeForMainLenderToBuyUpdated
   ErrorDefinition.OptionToBuyExpiredError
   ErrorDefinition.OptionToBuyStilValidError
   ErrorDefinition.NotMainLenderError
   ErrorDefinition.InvalidInputError
   FunctionDefinition.constructor
   FunctionDefinition.settleWithBuyout
   FunctionDefinition.setTimeForMainLenderToBuy
   FunctionDefinition.getTimeForMainLenderToBuy
   FunctionDefinition._placeBidChecks
   
   Suggested order:
   UsingForDirective.FixedPointMathLib
   UsingForDirective.Interest
   UsingForDirective.ERC20
   VariableDeclaration._timeForMainLenderToBuy
   VariableDeclaration.MAX_TIME_FOR_MAIN_LENDER_TO_BUY
   ErrorDefinition.OptionToBuyExpiredError
   ErrorDefinition.OptionToBuyStilValidError
   ErrorDefinition.NotMainLenderError
   ErrorDefinition.InvalidInputError
   EventDefinition.AuctionSettledWithBuyout
   EventDefinition.TimeForMainLenderToBuyUpdated
   FunctionDefinition.constructor
   FunctionDefinition.settleWithBuyout
   FunctionDefinition.setTimeForMainLenderToBuy
   FunctionDefinition.getTimeForMainLenderToBuy
   FunctionDefinition._placeBidChecks

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionWithBuyoutLoanLiquidator.sol)

```solidity
File: src/lib/LiquidationHandler.sol

1: 
   Current order:
   VariableDeclaration.MIN_AUCTION_DURATION
   VariableDeclaration.MAX_AUCTION_DURATION
   VariableDeclaration._liquidationAuctionDuration
   VariableDeclaration._loanLiquidator
   EventDefinition.LoanSentToLiquidator
   EventDefinition.LoanForeclosed
   EventDefinition.LiquidationContractUpdated
   EventDefinition.LiquidationAuctionDurationUpdated
   ErrorDefinition.LiquidatorOnlyError
   ErrorDefinition.LoanNotDueError
   ErrorDefinition.InvalidDurationError
   FunctionDefinition.constructor
   ModifierDefinition.onlyLiquidator
   FunctionDefinition.getLiquidator
   FunctionDefinition.updateLiquidationContract
   FunctionDefinition.updateLiquidationAuctionDuration
   FunctionDefinition.getLiquidationAuctionDuration
   FunctionDefinition._liquidateLoan
   
   Suggested order:
   VariableDeclaration.MIN_AUCTION_DURATION
   VariableDeclaration.MAX_AUCTION_DURATION
   VariableDeclaration._liquidationAuctionDuration
   VariableDeclaration._loanLiquidator
   ErrorDefinition.LiquidatorOnlyError
   ErrorDefinition.LoanNotDueError
   ErrorDefinition.InvalidDurationError
   EventDefinition.LoanSentToLiquidator
   EventDefinition.LoanForeclosed
   EventDefinition.LiquidationContractUpdated
   EventDefinition.LiquidationAuctionDurationUpdated
   ModifierDefinition.onlyLiquidator
   FunctionDefinition.constructor
   FunctionDefinition.getLiquidator
   FunctionDefinition.updateLiquidationContract
   FunctionDefinition.updateLiquidationAuctionDuration
   FunctionDefinition.getLiquidationAuctionDuration
   FunctionDefinition._liquidateLoan

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationHandler.sol)

```solidity
File: src/lib/UserVault.sol

1: 
   Current order:
   UsingForDirective.ERC20
   VariableDeclaration._BASE_URI
   VariableDeclaration._nextId
   VariableDeclaration.ETH
   VariableDeclaration._readyForWithdrawal
   VariableDeclaration._vaultERC721s
   VariableDeclaration._vaultOldERC721s
   VariableDeclaration._vaultERC20s
   VariableDeclaration._currencyManager
   VariableDeclaration._collectionManager
   EventDefinition.ERC721Deposited
   EventDefinition.OldERC721Deposited
   EventDefinition.OldERC721Withdrawn
   EventDefinition.ERC20Deposited
   EventDefinition.ERC721Withdrawn
   EventDefinition.ERC20Withdrawn
   ErrorDefinition.CurrencyNotWhitelistedError
   ErrorDefinition.CollectionNotWhitelistedError
   ErrorDefinition.LengthMismatchError
   ErrorDefinition.NotApprovedError
   ErrorDefinition.WithdrawingETHError
   ErrorDefinition.WrongMethodError
   ErrorDefinition.AssetNotOwnedError
   ErrorDefinition.VaultNotExistsError
   ErrorDefinition.InvalidCallerError
   ModifierDefinition.onlyApproved
   ModifierDefinition.onlyReadyForWithdrawal
   ModifierDefinition.vaultExists
   FunctionDefinition.constructor
   FunctionDefinition.tokenURI
   FunctionDefinition.mint
   FunctionDefinition.burn
   FunctionDefinition.burnAndWithdraw
   FunctionDefinition.ERC721OwnerOf
   FunctionDefinition.OldERC721OwnerOf
   FunctionDefinition.ERC20BalanceOf
   FunctionDefinition.depositERC721
   FunctionDefinition.depositERC721s
   FunctionDefinition.depositOldERC721
   FunctionDefinition.depositOldERC721s
   FunctionDefinition.depositERC20
   FunctionDefinition.depositEth
   FunctionDefinition.withdrawERC721
   FunctionDefinition.withdrawERC721s
   FunctionDefinition.withdrawOldERC721
   FunctionDefinition.withdrawOldERC721s
   FunctionDefinition.withdrawERC20
   FunctionDefinition.withdrawERC20s
   FunctionDefinition.withdrawEth
   FunctionDefinition._depositERC721
   FunctionDefinition._depositOldERC721
   FunctionDefinition._depositERC20
   FunctionDefinition._withdrawERC721
   FunctionDefinition._withdrawOldERC721
   FunctionDefinition._withdrawERC20
   FunctionDefinition._thisBurn
   FunctionDefinition._withdrawEth
   
   Suggested order:
   UsingForDirective.ERC20
   VariableDeclaration._BASE_URI
   VariableDeclaration._nextId
   VariableDeclaration.ETH
   VariableDeclaration._readyForWithdrawal
   VariableDeclaration._vaultERC721s
   VariableDeclaration._vaultOldERC721s
   VariableDeclaration._vaultERC20s
   VariableDeclaration._currencyManager
   VariableDeclaration._collectionManager
   ErrorDefinition.CurrencyNotWhitelistedError
   ErrorDefinition.CollectionNotWhitelistedError
   ErrorDefinition.LengthMismatchError
   ErrorDefinition.NotApprovedError
   ErrorDefinition.WithdrawingETHError
   ErrorDefinition.WrongMethodError
   ErrorDefinition.AssetNotOwnedError
   ErrorDefinition.VaultNotExistsError
   ErrorDefinition.InvalidCallerError
   EventDefinition.ERC721Deposited
   EventDefinition.OldERC721Deposited
   EventDefinition.OldERC721Withdrawn
   EventDefinition.ERC20Deposited
   EventDefinition.ERC721Withdrawn
   EventDefinition.ERC20Withdrawn
   ModifierDefinition.onlyApproved
   ModifierDefinition.onlyReadyForWithdrawal
   ModifierDefinition.vaultExists
   FunctionDefinition.constructor
   FunctionDefinition.tokenURI
   FunctionDefinition.mint
   FunctionDefinition.burn
   FunctionDefinition.burnAndWithdraw
   FunctionDefinition.ERC721OwnerOf
   FunctionDefinition.OldERC721OwnerOf
   FunctionDefinition.ERC20BalanceOf
   FunctionDefinition.depositERC721
   FunctionDefinition.depositERC721s
   FunctionDefinition.depositOldERC721
   FunctionDefinition.depositOldERC721s
   FunctionDefinition.depositERC20
   FunctionDefinition.depositEth
   FunctionDefinition.withdrawERC721
   FunctionDefinition.withdrawERC721s
   FunctionDefinition.withdrawOldERC721
   FunctionDefinition.withdrawOldERC721s
   FunctionDefinition.withdrawERC20
   FunctionDefinition.withdrawERC20s
   FunctionDefinition.withdrawEth
   FunctionDefinition._depositERC721
   FunctionDefinition._depositOldERC721
   FunctionDefinition._depositERC20
   FunctionDefinition._withdrawERC721
   FunctionDefinition._withdrawOldERC721
   FunctionDefinition._withdrawERC20
   FunctionDefinition._thisBurn
   FunctionDefinition._withdrawEth

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

1: 
   Current order:
   UsingForDirective.FixedPointMathLib
   UsingForDirective.BytesLib
   UsingForDirective.ERC20
   UsingForDirective.WETH
   VariableDeclaration._PRECISION
   VariableDeclaration._MAX_TAX
   VariableDeclaration.TAX_UPDATE_NOTICE
   VariableDeclaration._marketplaceContractsAddressManager
   VariableDeclaration._weth
   VariableDeclaration._pendingTaxes
   VariableDeclaration._pendingTaxesSetTime
   VariableDeclaration._taxes
   VariableDeclaration._pendingMultiSourceLoanAddress
   VariableDeclaration._multiSourceLoan
   VariableDeclaration._punkMarket
   VariableDeclaration._wrappedPunk
   VariableDeclaration._punkProxy
   EventDefinition.BNPLLoansStarted
   EventDefinition.SellAndRepayExecuted
   EventDefinition.MultiSourceLoanPendingUpdate
   EventDefinition.MultiSourceLoanUpdated
   EventDefinition.TaxesPendingUpdate
   EventDefinition.TaxesUpdated
   ErrorDefinition.MarketplaceAddressNotWhitelisted
   ErrorDefinition.CurrencyNotSupportedError
   ErrorDefinition.OnlyWethSupportedError
   ErrorDefinition.OnlyLoanCallableError
   ErrorDefinition.InvalidAddressUpdateError
   ErrorDefinition.CouldNotReturnEthError
   ErrorDefinition.InvalidTaxesError
   FunctionDefinition.constructor
   ModifierDefinition.onlyLoanContract
   FunctionDefinition.buy
   FunctionDefinition.sell
   FunctionDefinition.afterPrincipalTransfer
   FunctionDefinition.afterNFTTransfer
   FunctionDefinition.updateMultiSourceLoanAddressFirst
   FunctionDefinition.finalUpdateMultiSourceLoanAddress
   FunctionDefinition.getMultiSourceLoanAddress
   FunctionDefinition.getTaxes
   FunctionDefinition.getPendingTaxes
   FunctionDefinition.getPendingTaxesSetTime
   FunctionDefinition.updateTaxes
   FunctionDefinition.setTaxes
   FunctionDefinition._handleTax
   FunctionDefinition.fallback
   FunctionDefinition.receive
   
   Suggested order:
   UsingForDirective.FixedPointMathLib
   UsingForDirective.BytesLib
   UsingForDirective.ERC20
   UsingForDirective.WETH
   VariableDeclaration._PRECISION
   VariableDeclaration._MAX_TAX
   VariableDeclaration.TAX_UPDATE_NOTICE
   VariableDeclaration._marketplaceContractsAddressManager
   VariableDeclaration._weth
   VariableDeclaration._pendingTaxes
   VariableDeclaration._pendingTaxesSetTime
   VariableDeclaration._taxes
   VariableDeclaration._pendingMultiSourceLoanAddress
   VariableDeclaration._multiSourceLoan
   VariableDeclaration._punkMarket
   VariableDeclaration._wrappedPunk
   VariableDeclaration._punkProxy
   ErrorDefinition.MarketplaceAddressNotWhitelisted
   ErrorDefinition.CurrencyNotSupportedError
   ErrorDefinition.OnlyWethSupportedError
   ErrorDefinition.OnlyLoanCallableError
   ErrorDefinition.InvalidAddressUpdateError
   ErrorDefinition.CouldNotReturnEthError
   ErrorDefinition.InvalidTaxesError
   EventDefinition.BNPLLoansStarted
   EventDefinition.SellAndRepayExecuted
   EventDefinition.MultiSourceLoanPendingUpdate
   EventDefinition.MultiSourceLoanUpdated
   EventDefinition.TaxesPendingUpdate
   EventDefinition.TaxesUpdated
   ModifierDefinition.onlyLoanContract
   FunctionDefinition.constructor
   FunctionDefinition.buy
   FunctionDefinition.sell
   FunctionDefinition.afterPrincipalTransfer
   FunctionDefinition.afterNFTTransfer
   FunctionDefinition.updateMultiSourceLoanAddressFirst
   FunctionDefinition.finalUpdateMultiSourceLoanAddress
   FunctionDefinition.getMultiSourceLoanAddress
   FunctionDefinition.getTaxes
   FunctionDefinition.getPendingTaxes
   FunctionDefinition.getPendingTaxesSetTime
   FunctionDefinition.updateTaxes
   FunctionDefinition.setTaxes
   FunctionDefinition._handleTax
   FunctionDefinition.fallback
   FunctionDefinition.receive

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/BaseLoan.sol

1: 
   Current order:
   UsingForDirective.FixedPointMathLib
   UsingForDirective.MessageHashUtils
   VariableDeclaration.INITIAL_CHAIN_ID
   VariableDeclaration.INITIAL_DOMAIN_SEPARATOR
   VariableDeclaration.MAGICVALUE_1271
   VariableDeclaration._PRECISION
   VariableDeclaration.VERSION
   VariableDeclaration._minimum
   VariableDeclaration.name
   VariableDeclaration.getTotalLoansIssued
   VariableDeclaration._used
   VariableDeclaration.isOfferCancelled
   VariableDeclaration.minOfferId
   VariableDeclaration.isRenegotiationOfferCancelled
   VariableDeclaration._currencyManager
   VariableDeclaration._collectionManager
   EventDefinition.OfferCancelled
   EventDefinition.AllOffersCancelled
   EventDefinition.RenegotiationOfferCancelled
   EventDefinition.ImprovementMinimumUpdated
   ErrorDefinition.CancelledOrExecutedOfferError
   ErrorDefinition.ExpiredOfferError
   ErrorDefinition.LowOfferIdError
   ErrorDefinition.LowRenegotiationOfferIdError
   ErrorDefinition.ZeroDurationError
   ErrorDefinition.ZeroInterestError
   ErrorDefinition.InvalidSignatureError
   ErrorDefinition.CurrencyNotWhitelistedError
   ErrorDefinition.CollectionNotWhitelistedError
   ErrorDefinition.MaxCapacityExceededError
   ErrorDefinition.InvalidLoanError
   ErrorDefinition.NotStrictlyImprovedError
   ErrorDefinition.InvalidAmountError
   FunctionDefinition.constructor
   FunctionDefinition.DOMAIN_SEPARATOR
   FunctionDefinition.getImprovementMinimum
   FunctionDefinition.updateImprovementMinimum
   FunctionDefinition.getCurrencyManager
   FunctionDefinition.getCollectionManager
   FunctionDefinition.cancelOffer
   FunctionDefinition.cancelAllOffers
   FunctionDefinition.cancelRenegotiationOffer
   FunctionDefinition.getUsedCapacity
   FunctionDefinition._getAndSetNewLoanId
   FunctionDefinition._computeDomainSeparator
   
   Suggested order:
   UsingForDirective.FixedPointMathLib
   UsingForDirective.MessageHashUtils
   VariableDeclaration.INITIAL_CHAIN_ID
   VariableDeclaration.INITIAL_DOMAIN_SEPARATOR
   VariableDeclaration.MAGICVALUE_1271
   VariableDeclaration._PRECISION
   VariableDeclaration.VERSION
   VariableDeclaration._minimum
   VariableDeclaration.name
   VariableDeclaration.getTotalLoansIssued
   VariableDeclaration._used
   VariableDeclaration.isOfferCancelled
   VariableDeclaration.minOfferId
   VariableDeclaration.isRenegotiationOfferCancelled
   VariableDeclaration._currencyManager
   VariableDeclaration._collectionManager
   ErrorDefinition.CancelledOrExecutedOfferError
   ErrorDefinition.ExpiredOfferError
   ErrorDefinition.LowOfferIdError
   ErrorDefinition.LowRenegotiationOfferIdError
   ErrorDefinition.ZeroDurationError
   ErrorDefinition.ZeroInterestError
   ErrorDefinition.InvalidSignatureError
   ErrorDefinition.CurrencyNotWhitelistedError
   ErrorDefinition.CollectionNotWhitelistedError
   ErrorDefinition.MaxCapacityExceededError
   ErrorDefinition.InvalidLoanError
   ErrorDefinition.NotStrictlyImprovedError
   ErrorDefinition.InvalidAmountError
   EventDefinition.OfferCancelled
   EventDefinition.AllOffersCancelled
   EventDefinition.RenegotiationOfferCancelled
   EventDefinition.ImprovementMinimumUpdated
   FunctionDefinition.constructor
   FunctionDefinition.DOMAIN_SEPARATOR
   FunctionDefinition.getImprovementMinimum
   FunctionDefinition.updateImprovementMinimum
   FunctionDefinition.getCurrencyManager
   FunctionDefinition.getCollectionManager
   FunctionDefinition.cancelOffer
   FunctionDefinition.cancelAllOffers
   FunctionDefinition.cancelRenegotiationOffer
   FunctionDefinition.getUsedCapacity
   FunctionDefinition._getAndSetNewLoanId
   FunctionDefinition._computeDomainSeparator

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoan.sol)

```solidity
File: src/lib/loans/LoanManager.sol

1: 
   Current order:
   UsingForDirective.EnumerableSet.AddressSet
   StructDefinition.PendingCaller
   VariableDeclaration.UPDATE_WAITING_TIME
   VariableDeclaration.getPendingAcceptedCallers
   VariableDeclaration.getPendingAcceptedCallersSetTime
   VariableDeclaration._acceptedCallers
   VariableDeclaration._isLoanContract
   VariableDeclaration.getUnderwriter
   VariableDeclaration.getPendingUnderwriter
   VariableDeclaration.getPendingUnderwriterSetTime
   EventDefinition.RequestCallersAdded
   EventDefinition.CallersAdded
   EventDefinition.PendingUnderwriterSet
   EventDefinition.UnderwriterSet
   ErrorDefinition.CallerNotAccepted
   FunctionDefinition.constructor
   ModifierDefinition.onlyAcceptedCallers
   FunctionDefinition.requestAddCallers
   FunctionDefinition.addCallers
   FunctionDefinition.isCallerAccepted
   FunctionDefinition.setUnderwriter
   FunctionDefinition.confirmUnderwriter
   FunctionDefinition.afterCallerAdded
   FunctionDefinition.validateOffer
   FunctionDefinition.loanRepayment
   FunctionDefinition.loanLiquidation
   
   Suggested order:
   UsingForDirective.EnumerableSet.AddressSet
   VariableDeclaration.UPDATE_WAITING_TIME
   VariableDeclaration.getPendingAcceptedCallers
   VariableDeclaration.getPendingAcceptedCallersSetTime
   VariableDeclaration._acceptedCallers
   VariableDeclaration._isLoanContract
   VariableDeclaration.getUnderwriter
   VariableDeclaration.getPendingUnderwriter
   VariableDeclaration.getPendingUnderwriterSetTime
   StructDefinition.PendingCaller
   ErrorDefinition.CallerNotAccepted
   EventDefinition.RequestCallersAdded
   EventDefinition.CallersAdded
   EventDefinition.PendingUnderwriterSet
   EventDefinition.UnderwriterSet
   ModifierDefinition.onlyAcceptedCallers
   FunctionDefinition.constructor
   FunctionDefinition.requestAddCallers
   FunctionDefinition.addCallers
   FunctionDefinition.isCallerAccepted
   FunctionDefinition.setUnderwriter
   FunctionDefinition.confirmUnderwriter
   FunctionDefinition.afterCallerAdded
   FunctionDefinition.validateOffer
   FunctionDefinition.loanRepayment
   FunctionDefinition.loanLiquidation

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManager.sol)

```solidity
File: src/lib/pools/FeeManager.sol

1: 
   Current order:
   UsingForDirective.FixedPointMathLib
   VariableDeclaration.WAIT_TIME
   VariableDeclaration.PRECISION
   VariableDeclaration._fees
   VariableDeclaration._pendingFees
   VariableDeclaration._pendingFeesSetTime
   EventDefinition.PendingFeesSet
   EventDefinition.PendingFeesConfirmed
   ErrorDefinition.TwoSoonError
   ErrorDefinition.InvalidFeesError
   FunctionDefinition.constructor
   FunctionDefinition.getFees
   FunctionDefinition.setPendingFees
   FunctionDefinition.confirmFees
   FunctionDefinition.getPendingFees
   FunctionDefinition.getPendingFeesSetTime
   FunctionDefinition.processFees
   
   Suggested order:
   UsingForDirective.FixedPointMathLib
   VariableDeclaration.WAIT_TIME
   VariableDeclaration.PRECISION
   VariableDeclaration._fees
   VariableDeclaration._pendingFees
   VariableDeclaration._pendingFeesSetTime
   ErrorDefinition.TwoSoonError
   ErrorDefinition.InvalidFeesError
   EventDefinition.PendingFeesSet
   EventDefinition.PendingFeesConfirmed
   FunctionDefinition.constructor
   FunctionDefinition.getFees
   FunctionDefinition.setPendingFees
   FunctionDefinition.confirmFees
   FunctionDefinition.getPendingFees
   FunctionDefinition.getPendingFeesSetTime
   FunctionDefinition.processFees

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/FeeManager.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

1: 
   Current order:
   UsingForDirective.FixedPointMathLib
   StructDefinition.LidoData
   VariableDeclaration._BPS
   VariableDeclaration._SECONDS_PER_YEAR
   VariableDeclaration._PRINCIPAL_PRECISION
   VariableDeclaration._curvePool
   VariableDeclaration._weth
   VariableDeclaration._lido
   VariableDeclaration.getPool
   VariableDeclaration.getLidoUpdateTolerance
   VariableDeclaration.getMaxSlippage
   VariableDeclaration.getLidoData
   EventDefinition.MaxSlippageSet
   EventDefinition.LidoValuesUpdated
   ErrorDefinition.InvalidPoolError
   ErrorDefinition.InvalidCallerError
   ErrorDefinition.InvalidAprError
   FunctionDefinition.constructor
   FunctionDefinition.setMaxSlippage
   FunctionDefinition.getBaseApr
   FunctionDefinition.getBaseAprWithUpdate
   FunctionDefinition.updateLidoValues
   FunctionDefinition.getAssetsAllocated
   FunctionDefinition.reallocate
   FunctionDefinition.transferAll
   FunctionDefinition._currentShareRate
   FunctionDefinition._onlyPool
   FunctionDefinition._exchangeAndSendWeth
   FunctionDefinition._updateLidoValues
   FunctionDefinition.receive
   
   Suggested order:
   UsingForDirective.FixedPointMathLib
   VariableDeclaration._BPS
   VariableDeclaration._SECONDS_PER_YEAR
   VariableDeclaration._PRINCIPAL_PRECISION
   VariableDeclaration._curvePool
   VariableDeclaration._weth
   VariableDeclaration._lido
   VariableDeclaration.getPool
   VariableDeclaration.getLidoUpdateTolerance
   VariableDeclaration.getMaxSlippage
   VariableDeclaration.getLidoData
   StructDefinition.LidoData
   ErrorDefinition.InvalidPoolError
   ErrorDefinition.InvalidCallerError
   ErrorDefinition.InvalidAprError
   EventDefinition.MaxSlippageSet
   EventDefinition.LidoValuesUpdated
   FunctionDefinition.constructor
   FunctionDefinition.setMaxSlippage
   FunctionDefinition.getBaseApr
   FunctionDefinition.getBaseAprWithUpdate
   FunctionDefinition.updateLidoValues
   FunctionDefinition.getAssetsAllocated
   FunctionDefinition.reallocate
   FunctionDefinition.transferAll
   FunctionDefinition._currentShareRate
   FunctionDefinition._onlyPool
   FunctionDefinition._exchangeAndSendWeth
   FunctionDefinition._updateLidoValues
   FunctionDefinition.receive

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/Pool.sol

1: 
   Current order:
   UsingForDirective.EnumerableSet.AddressSet
   UsingForDirective.FixedPointMathLib
   UsingForDirective.FixedPointMathLib
   UsingForDirective.Interest
   UsingForDirective.ERC20
   VariableDeclaration.PRINCIPAL_PRECISION
   VariableDeclaration._SECONDS_PER_YEAR
   VariableDeclaration._BPS
   VariableDeclaration._MAX_BONUS
   VariableDeclaration.getCollectedFees
   StructDefinition.OutstandingValues
   StructDefinition.QueueAccounting
   VariableDeclaration._LOAN_BUFFER_TIME
   VariableDeclaration.getFeeManager
   VariableDeclaration.getMaxTotalWithdrawalQueues
   VariableDeclaration.getMinTimeBetweenWithdrawalQueues
   VariableDeclaration.getReallocationBonus
   VariableDeclaration.getPendingBaseInterestAllocator
   VariableDeclaration.getBaseInterestAllocator
   VariableDeclaration.getPendingBaseInterestAllocatorSetTime
   VariableDeclaration.isActive
   VariableDeclaration.getOptimalIdleRange
   VariableDeclaration.getLastLoanId
   VariableDeclaration.getTotalReceived
   VariableDeclaration.getAvailableToWithdraw
   VariableDeclaration._deployedQueues
   VariableDeclaration._outstandingValues
   VariableDeclaration._pendingQueueIndex
   VariableDeclaration._queueOutstandingValues
   VariableDeclaration._queueAccounting
   ErrorDefinition.PoolStatusError
   ErrorDefinition.InsufficientAssetsError
   ErrorDefinition.AllocationAlreadyOptimalError
   ErrorDefinition.CannotDeployQueueTooSoonError
   ErrorDefinition.NoSharesPendingWithdrawalError
   EventDefinition.ReallocationBonusUpdated
   EventDefinition.PendingBaseInterestAllocatorSet
   EventDefinition.BaseInterestAllocatorSet
   EventDefinition.OptimalIdleRangeSet
   EventDefinition.QueueClaimed
   EventDefinition.Reallocated
   FunctionDefinition.constructor
   FunctionDefinition.pausePool
   FunctionDefinition.setOptimalIdleRange
   FunctionDefinition.setBaseInterestAllocator
   FunctionDefinition.confirmBaseInterestAllocator
   FunctionDefinition.setReallocationBonus
   FunctionDefinition.afterCallerAdded
   FunctionDefinition.totalAssets
   FunctionDefinition.getOutstandingValues
   FunctionDefinition.getDeployedQueue
   FunctionDefinition.getOutstandingValuesForQueue
   FunctionDefinition.getPendingQueueIndex
   FunctionDefinition.getAccountingValuesForQueue
   FunctionDefinition.withdraw
   FunctionDefinition.redeem
   FunctionDefinition.deposit
   FunctionDefinition.mint
   FunctionDefinition.queueClaimAll
   FunctionDefinition.deployWithdrawalQueue
   FunctionDefinition.validateOffer
   FunctionDefinition.reallocate
   FunctionDefinition.loanRepayment
   FunctionDefinition.loanLiquidation
   FunctionDefinition._getTotalOutstandingValue
   FunctionDefinition._getOutstandingValue
   FunctionDefinition._getNewLoanAccounting
   FunctionDefinition._loanTermination
   FunctionDefinition._preDeposit
   FunctionDefinition._getUndeployedAssets
   FunctionDefinition._reallocate
   FunctionDefinition._reallocateOnWithdrawal
   FunctionDefinition._netApr
   FunctionDefinition._deployQueue
   FunctionDefinition._burn
   FunctionDefinition._updateLoanLastIds
   FunctionDefinition._updatePendingWithdrawalWithQueue
   FunctionDefinition._queueClaimAll
   FunctionDefinition._outstandingApr
   FunctionDefinition._updateOutstandingValuesOnTermination
   FunctionDefinition._withdraw
   
   Suggested order:
   UsingForDirective.EnumerableSet.AddressSet
   UsingForDirective.FixedPointMathLib
   UsingForDirective.FixedPointMathLib
   UsingForDirective.Interest
   UsingForDirective.ERC20
   VariableDeclaration.PRINCIPAL_PRECISION
   VariableDeclaration._SECONDS_PER_YEAR
   VariableDeclaration._BPS
   VariableDeclaration._MAX_BONUS
   VariableDeclaration.getCollectedFees
   VariableDeclaration._LOAN_BUFFER_TIME
   VariableDeclaration.getFeeManager
   VariableDeclaration.getMaxTotalWithdrawalQueues
   VariableDeclaration.getMinTimeBetweenWithdrawalQueues
   VariableDeclaration.getReallocationBonus
   VariableDeclaration.getPendingBaseInterestAllocator
   VariableDeclaration.getBaseInterestAllocator
   VariableDeclaration.getPendingBaseInterestAllocatorSetTime
   VariableDeclaration.isActive
   VariableDeclaration.getOptimalIdleRange
   VariableDeclaration.getLastLoanId
   VariableDeclaration.getTotalReceived
   VariableDeclaration.getAvailableToWithdraw
   VariableDeclaration._deployedQueues
   VariableDeclaration._outstandingValues
   VariableDeclaration._pendingQueueIndex
   VariableDeclaration._queueOutstandingValues
   VariableDeclaration._queueAccounting
   StructDefinition.OutstandingValues
   StructDefinition.QueueAccounting
   ErrorDefinition.PoolStatusError
   ErrorDefinition.InsufficientAssetsError
   ErrorDefinition.AllocationAlreadyOptimalError
   ErrorDefinition.CannotDeployQueueTooSoonError
   ErrorDefinition.NoSharesPendingWithdrawalError
   EventDefinition.ReallocationBonusUpdated
   EventDefinition.PendingBaseInterestAllocatorSet
   EventDefinition.BaseInterestAllocatorSet
   EventDefinition.OptimalIdleRangeSet
   EventDefinition.QueueClaimed
   EventDefinition.Reallocated
   FunctionDefinition.constructor
   FunctionDefinition.pausePool
   FunctionDefinition.setOptimalIdleRange
   FunctionDefinition.setBaseInterestAllocator
   FunctionDefinition.confirmBaseInterestAllocator
   FunctionDefinition.setReallocationBonus
   FunctionDefinition.afterCallerAdded
   FunctionDefinition.totalAssets
   FunctionDefinition.getOutstandingValues
   FunctionDefinition.getDeployedQueue
   FunctionDefinition.getOutstandingValuesForQueue
   FunctionDefinition.getPendingQueueIndex
   FunctionDefinition.getAccountingValuesForQueue
   FunctionDefinition.withdraw
   FunctionDefinition.redeem
   FunctionDefinition.deposit
   FunctionDefinition.mint
   FunctionDefinition.queueClaimAll
   FunctionDefinition.deployWithdrawalQueue
   FunctionDefinition.validateOffer
   FunctionDefinition.reallocate
   FunctionDefinition.loanRepayment
   FunctionDefinition.loanLiquidation
   FunctionDefinition._getTotalOutstandingValue
   FunctionDefinition._getOutstandingValue
   FunctionDefinition._getNewLoanAccounting
   FunctionDefinition._loanTermination
   FunctionDefinition._preDeposit
   FunctionDefinition._getUndeployedAssets
   FunctionDefinition._reallocate
   FunctionDefinition._reallocateOnWithdrawal
   FunctionDefinition._netApr
   FunctionDefinition._deployQueue
   FunctionDefinition._burn
   FunctionDefinition._updateLoanLastIds
   FunctionDefinition._updatePendingWithdrawalWithQueue
   FunctionDefinition._queueClaimAll
   FunctionDefinition._outstandingApr
   FunctionDefinition._updateOutstandingValuesOnTermination
   FunctionDefinition._withdraw

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/pools/PoolOfferHandler.sol

1: 
   Current order:
   UsingForDirective.FixedPointMathLib
   StructDefinition.TermsKey
   StructDefinition.Terms
   VariableDeclaration._BPS
   VariableDeclaration.NEW_TERMS_WAITING_TIME
   VariableDeclaration.getMaxDuration
   VariableDeclaration._terms
   VariableDeclaration._pendingTerms
   VariableDeclaration.pendingTermsSetTime
   EventDefinition.PendingTermsSet
   EventDefinition.TermsSet
   ErrorDefinition.InvalidInputError
   ErrorDefinition.TooSoonError
   ErrorDefinition.InvalidTermsError
   FunctionDefinition.constructor
   FunctionDefinition.setTerms
   FunctionDefinition.confirmTerms
   FunctionDefinition.getAprPremium
   FunctionDefinition.getPendingAprPremium
   FunctionDefinition.validateOffer
   
   Suggested order:
   UsingForDirective.FixedPointMathLib
   VariableDeclaration._BPS
   VariableDeclaration.NEW_TERMS_WAITING_TIME
   VariableDeclaration.getMaxDuration
   VariableDeclaration._terms
   VariableDeclaration._pendingTerms
   VariableDeclaration.pendingTermsSetTime
   StructDefinition.TermsKey
   StructDefinition.Terms
   ErrorDefinition.InvalidInputError
   ErrorDefinition.TooSoonError
   ErrorDefinition.InvalidTermsError
   EventDefinition.PendingTermsSet
   EventDefinition.TermsSet
   FunctionDefinition.constructor
   FunctionDefinition.setTerms
   FunctionDefinition.confirmTerms
   FunctionDefinition.getAprPremium
   FunctionDefinition.getPendingAprPremium
   FunctionDefinition.validateOffer

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/PoolOfferHandler.sol)

```solidity
File: src/lib/pools/WithdrawalQueue.sol

1: 
   Current order:
   UsingForDirective.ERC20
   VariableDeclaration._NAME
   VariableDeclaration._SYMBOL
   VariableDeclaration._BASE_URI
   VariableDeclaration.getPool
   VariableDeclaration.getTotalShares
   VariableDeclaration.getNextTokenId
   VariableDeclaration.getShares
   VariableDeclaration.getWithdrawn
   VariableDeclaration.getUnlockTime
   VariableDeclaration._asset
   VariableDeclaration._totalWithdrawn
   EventDefinition.WithdrawalPositionMinted
   EventDefinition.Withdrawn
   EventDefinition.WithdrawalLocked
   ErrorDefinition.PoolOnlyCallableError
   ErrorDefinition.NotApprovedOrOwnerError
   ErrorDefinition.WithdrawalsLockedError
   ErrorDefinition.CanOnlyExtendWithdrawalError
   FunctionDefinition.constructor
   FunctionDefinition.mint
   FunctionDefinition.tokenURI
   FunctionDefinition.withdraw
   FunctionDefinition.getAvailable
   FunctionDefinition.lockWithdrawals
   FunctionDefinition._getAvailable
   FunctionDefinition._getWithdrawablePerShare
   
   Suggested order:
   UsingForDirective.ERC20
   VariableDeclaration._NAME
   VariableDeclaration._SYMBOL
   VariableDeclaration._BASE_URI
   VariableDeclaration.getPool
   VariableDeclaration.getTotalShares
   VariableDeclaration.getNextTokenId
   VariableDeclaration.getShares
   VariableDeclaration.getWithdrawn
   VariableDeclaration.getUnlockTime
   VariableDeclaration._asset
   VariableDeclaration._totalWithdrawn
   ErrorDefinition.PoolOnlyCallableError
   ErrorDefinition.NotApprovedOrOwnerError
   ErrorDefinition.WithdrawalsLockedError
   ErrorDefinition.CanOnlyExtendWithdrawalError
   EventDefinition.WithdrawalPositionMinted
   EventDefinition.Withdrawn
   EventDefinition.WithdrawalLocked
   FunctionDefinition.constructor
   FunctionDefinition.mint
   FunctionDefinition.tokenURI
   FunctionDefinition.withdraw
   FunctionDefinition.getAvailable
   FunctionDefinition.lockWithdrawals
   FunctionDefinition._getAvailable
   FunctionDefinition._getWithdrawablePerShare

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/WithdrawalQueue.sol)

```solidity
File: src/lib/utils/TwoStepOwned.sol

1: 
   Current order:
   EventDefinition.TransferOwnerRequested
   ErrorDefinition.TooSoonError
   ErrorDefinition.InvalidInputError
   VariableDeclaration.MIN_WAIT_TIME
   VariableDeclaration.pendingOwner
   VariableDeclaration.pendingOwnerTime
   FunctionDefinition.constructor
   FunctionDefinition.requestTransferOwner
   FunctionDefinition.transferOwnership
   
   Suggested order:
   VariableDeclaration.MIN_WAIT_TIME
   VariableDeclaration.pendingOwner
   VariableDeclaration.pendingOwnerTime
   ErrorDefinition.TooSoonError
   ErrorDefinition.InvalidInputError
   EventDefinition.TransferOwnerRequested
   FunctionDefinition.constructor
   FunctionDefinition.requestTransferOwner
   FunctionDefinition.transferOwnership

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/TwoStepOwned.sol)

```solidity
File: src/lib/utils/WithProtocolFee.sol

1: 
   Current order:
   StructDefinition.ProtocolFee
   VariableDeclaration.MAX_PROTOCOL_FEE
   VariableDeclaration.FEE_UPDATE_NOTICE
   VariableDeclaration._protocolFee
   VariableDeclaration._pendingProtocolFee
   VariableDeclaration._pendingProtocolFeeSetTime
   EventDefinition.ProtocolFeeUpdated
   EventDefinition.ProtocolFeePendingUpdate
   ErrorDefinition.InvalidProtocolFeeError
   ErrorDefinition.TooEarlyError
   FunctionDefinition.constructor
   FunctionDefinition.getProtocolFee
   FunctionDefinition.getPendingProtocolFee
   FunctionDefinition.getPendingProtocolFeeSetTime
   FunctionDefinition.updateProtocolFee
   FunctionDefinition.setProtocolFee
   FunctionDefinition._setProtocolFee
   
   Suggested order:
   VariableDeclaration.MAX_PROTOCOL_FEE
   VariableDeclaration.FEE_UPDATE_NOTICE
   VariableDeclaration._protocolFee
   VariableDeclaration._pendingProtocolFee
   VariableDeclaration._pendingProtocolFeeSetTime
   StructDefinition.ProtocolFee
   ErrorDefinition.InvalidProtocolFeeError
   ErrorDefinition.TooEarlyError
   EventDefinition.ProtocolFeeUpdated
   EventDefinition.ProtocolFeePendingUpdate
   FunctionDefinition.constructor
   FunctionDefinition.getProtocolFee
   FunctionDefinition.getPendingProtocolFee
   FunctionDefinition.getPendingProtocolFeeSetTime
   FunctionDefinition.updateProtocolFee
   FunctionDefinition.setProtocolFee
   FunctionDefinition._setProtocolFee

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/WithProtocolFee.sol)

### <a name="NC-31"></a>[NC-31] Use Underscores for Number Literals (add an underscore every 3 digits)

*Instances (12)*:

```solidity
File: src/lib/AuctionLoanLiquidator.sol

42:     uint256 internal constant _BPS = 10000;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

28:     uint256 private constant _PRECISION = 10000;

29:     uint256 private constant _MAX_TAX = 5000;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/BaseLoan.sol

35:     uint256 internal constant _PRECISION = 10000;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoan.sol)

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

21:     uint256 private constant _BPS = 10000;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

27:     uint256 private constant _BPS = 10000;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/Pool.sol

44:     uint256 private constant _SECONDS_PER_YEAR = 31536000;

47:     uint16 private constant _BPS = 10000;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/pools/PoolOfferHandler.sol

36:     uint256 private constant _BPS = 10000;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/PoolOfferHandler.sol)

```solidity
File: src/lib/utils/Interest.sol

11:     uint256 private constant _PRECISION = 10000;

13:     uint256 private constant _SECONDS_PER_YEAR = 31536000;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/Interest.sol)

```solidity
File: src/lib/utils/WithProtocolFee.sol

16:     uint256 public constant MAX_PROTOCOL_FEE = 2500;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/WithProtocolFee.sol)

### <a name="NC-32"></a>[NC-32] Internal and private variables and functions names should begin with an underscore

According to the Solidity Style Guide, Non-`external` variable and function names should begin with an [underscore](https://docs.soliditylang.org/en/latest/style-guide.html#underscore-prefix-for-non-external-functions-and-variables)

*Instances (18)*:

```solidity
File: src/lib/callbacks/CallbackHandler.sol

52:     function handleAfterPrincipalTransferCallback(

71:     function handleAfterNFTTransferCallback(

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/CallbackHandler.sol)

```solidity
File: src/lib/loans/LoanManager.sol

136:     function afterCallerAdded(address _caller) internal virtual;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManager.sol)

```solidity
File: src/lib/pools/Pool.sol

234:     function afterCallerAdded(address _caller) internal override onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/utils/BytesLib.sol

12:     function slice(bytes memory _bytes, uint256 _start, uint256 _length) internal pure returns (bytes memory) {

72:     function toAddress(bytes memory _bytes, uint256 _start) internal pure returns (address) {

84:     function toUint24(bytes memory _bytes, uint256 _start) internal pure returns (uint24) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/BytesLib.sol)

```solidity
File: src/lib/utils/Hash.sol

39:     function hash(IMultiSourceLoan.LoanOffer memory _loanOffer) internal pure returns (bytes32) {

83:     function hash(IMultiSourceLoan.ExecutionData memory _executionData) internal pure returns (bytes32) {

106:     function hash(IMultiSourceLoan.SignableRepaymentData memory _repaymentData) internal pure returns (bytes32) {

117:     function hash(IMultiSourceLoan.Loan memory _loan) internal pure returns (bytes32) {

140:     function hash(IMultiSourceLoan.RenegotiationOffer memory _refinanceOffer) internal pure returns (bytes32) {

164:     function hash(IAuctionLoanLiquidator.Auction memory _auction) internal pure returns (bytes32) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/Hash.sol)

```solidity
File: src/lib/utils/Interest.sol

15:     function getInterest(IMultiSourceLoan.LoanOffer memory _loanOffer) internal pure returns (uint256) {

19:     function getInterest(uint256 _amount, uint256 _aprBps, uint256 _duration) internal pure returns (uint256) {

23:     function getTotalOwed(IMultiSourceLoan.Loan memory _loan, uint256 _timestamp) internal pure returns (uint256) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/Interest.sol)

```solidity
File: src/lib/utils/ValidatorHelpers.sol

15:     function validateTokenIdPackedList(uint256 _tokenId, uint64 _bytesPerTokenId, bytes memory _tokenIdList)

72:     function validateNFTBitVector(uint256 _tokenId, bytes memory _bitVector) internal pure {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/ValidatorHelpers.sol)

### <a name="NC-33"></a>[NC-33] Event is missing `indexed` fields

Index event fields make the field more quickly accessible to off-chain tools that parse events. However, note that each index field costs extra gas during emission, so it's not necessarily best to index the maximum allowed per event (three fields). Each event should use three indexed fields if there are three or more fields, and gas usage is not particularly of concern for the events in question. If there are fewer than three fields, all of the fields should be indexed.

*Instances (60)*:

```solidity
File: src/lib/AddressManager.sol

13:     event AddressAdded(address address_added);

15:     event AddressRemovedFromWhitelist(address address_removed);

17:     event AddressWhitelisted(address address_whitelisted);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AddressManager.sol)

```solidity
File: src/lib/AuctionLoanLiquidator.sol

58:     event LoanContractAdded(address loan);

60:     event LoanContractRemoved(address loan);

62:     event LiquidationDistributorUpdated(address liquidationDistributor);

64:     event LoanLiquidationStarted(address collection, uint256 tokenId, Auction auction);

66:     event BidPlaced(

70:     event AuctionSettled(

81:     event TriggerFeeUpdated(uint256 triggerFee);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/AuctionWithBuyoutLoanLiquidator.sol

20:     event AuctionSettledWithBuyout(

24:     event TimeForMainLenderToBuyUpdated(uint256 timeForMainLenderToBuy);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionWithBuyoutLoanLiquidator.sol)

```solidity
File: src/lib/LiquidationHandler.sol

26:     event LoanSentToLiquidator(uint256 loanId, address liquidator);

28:     event LoanForeclosed(uint256 loanId);

30:     event LiquidationContractUpdated(address liquidator);

32:     event LiquidationAuctionDurationUpdated(uint256 newDuration);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationHandler.sol)

```solidity
File: src/lib/UserVault.sol

40:     event ERC721Deposited(uint256 vaultId, address collection, uint256 tokenId);

42:     event OldERC721Deposited(uint256 vaultId, address collection, uint256 tokenId);

44:     event OldERC721Withdrawn(uint256 vaultId, address collection, uint256 tokenId);

46:     event ERC20Deposited(uint256 vaultId, address token, uint256 amount);

48:     event ERC721Withdrawn(uint256 vaultId, address collection, uint256 tokenId);

50:     event ERC20Withdrawn(uint256 vaultId, address token, uint256 amount);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/callbacks/CallbackHandler.sol

18:     event WhitelistedCallbackContractAdded(address contractAdded);

19:     event WhitelistedCallbackContractRemoved(address contractRemoved);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/CallbackHandler.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

46:     event BNPLLoansStarted(uint256[] loanIds);

47:     event SellAndRepayExecuted(uint256[] loanIds);

48:     event MultiSourceLoanPendingUpdate(address newAddress);

49:     event MultiSourceLoanUpdated(address newAddress);

50:     event TaxesPendingUpdate(Taxes newTaxes);

51:     event TaxesUpdated(Taxes taxes);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/BaseLoan.sol

67:     event OfferCancelled(address lender, uint256 offerId);

69:     event AllOffersCancelled(address lender, uint256 minOfferId);

71:     event RenegotiationOfferCancelled(address lender, uint256 renegotiationId);

73:     event ImprovementMinimumUpdated(ImprovementMinimum minimum);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoan.sol)

```solidity
File: src/lib/loans/LoanManager.sol

39:     event RequestCallersAdded(PendingCaller[] callers);

40:     event CallersAdded(PendingCaller[] callers);

41:     event PendingUnderwriterSet(address underwriter);

42:     event UnderwriterSet(address underwriter);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManager.sol)

```solidity
File: src/lib/loans/LoanManagerRegistry.sol

11:     event LoanManagerAdded(address loanManagerAdded);

12:     event LoanManagerRemoved(address loanManagerRemoved);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManagerRegistry.sol)

```solidity
File: src/lib/loans/WithLoanManagers.sol

9:     event LoanManagerAdded(address loanManagerAdded);

10:     event LoanManagerRemoved(address loanManagerRemoved);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/WithLoanManagers.sol)

```solidity
File: src/lib/pools/FeeManager.sol

22:     event PendingFeesSet(Fees fees);

23:     event PendingFeesConfirmed(Fees fees);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/FeeManager.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

40:     event MaxSlippageSet(uint256 maxSlippage);

41:     event LidoValuesUpdated(LidoData lidoData);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/Pool.sol

121:     event ReallocationBonusUpdated(uint256 newReallocationBonus);

122:     event PendingBaseInterestAllocatorSet(address newBaseInterestAllocator);

123:     event BaseInterestAllocatorSet(address newBaseInterestAllocator);

124:     event OptimalIdleRangeSet(OptimalIdleRange optimalIdleRange);

125:     event QueueClaimed(address queue, uint256 amount);

126:     event Reallocated(uint256 delta, uint256 bonusShares);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/pools/PoolOfferHandler.sol

64:     event PendingTermsSet(TermsKey[] keys, Terms[] terms, uint256 ts);

65:     event TermsSet(TermsKey[] keys, Terms[] terms);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/PoolOfferHandler.sol)

```solidity
File: src/lib/pools/WithdrawalQueue.sol

42:     event WithdrawalPositionMinted(uint256 tokenId, address to, uint256 shares);

43:     event Withdrawn(address to, uint256 tokenId, uint256 available);

44:     event WithdrawalLocked(uint256 tokenId, uint256 unlockTime);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/WithdrawalQueue.sol)

```solidity
File: src/lib/utils/TwoStepOwned.sol

9:     event TransferOwnerRequested(address newOwner);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/TwoStepOwned.sol)

```solidity
File: src/lib/utils/WithProtocolFee.sol

26:     event ProtocolFeeUpdated(ProtocolFee fee);

27:     event ProtocolFeePendingUpdate(ProtocolFee fee);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/WithProtocolFee.sol)

### <a name="NC-34"></a>[NC-34] Constants should be defined rather than using magic numbers

*Instances (2)*:

```solidity
File: src/lib/loans/BaseLoan.sol

40:     ImprovementMinimum internal _minimum = ImprovementMinimum(500, 100, 100);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoan.sol)

```solidity
File: src/lib/utils/BytesLib.sol

56:                 mstore(0x40, and(add(mc, 31), not(31)))

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/BytesLib.sol)

### <a name="NC-35"></a>[NC-35] `public` functions not called by the contract should be declared `external` instead

*Instances (1)*:

```solidity
File: src/lib/loans/BaseLoan.sol

130:     function DOMAIN_SEPARATOR() public view returns (bytes32) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoan.sol)

### <a name="NC-36"></a>[NC-36] Variables need not be initialized to zero

The default value for variables is zero, so initializing them to zero is superfluous.

*Instances (32)*:

```solidity
File: src/lib/AuctionWithBuyoutLoanLiquidator.sol

69:         for (uint256 i = 0; i < _loan.tranche.length;) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionWithBuyoutLoanLiquidator.sol)

```solidity
File: src/lib/LiquidationDistributor.sol

35:         uint256 totalPendingInterestOwed = 0;

36:         for (uint256 i = 0; i < _loan.tranche.length;) {

49:             for (uint256 i = 0; i < _loan.tranche.length;) {

63:             for (uint256 i = 0; i < _loan.tranche.length && _proceeds > 0;) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationDistributor.sol)

```solidity
File: src/lib/Multicall.sol

13:         for (uint256 i = 0; i < data.length;) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/Multicall.sol)

```solidity
File: src/lib/UserVault.sol

20:     uint256 private _nextId = 0;

132:         for (uint256 i = 0; i < _collections.length;) {

138:         for (uint256 i = 0; i < _tokens.length;) {

176:         for (uint256 i = 0; i < _tokenIds.length;) {

200:         for (uint256 i = 0; i < _tokenIds.length;) {

237:         for (uint256 i = 0; i < _collections.length;) {

257:         for (uint256 i = 0; i < _collections.length;) {

272:         for (uint256 i = 0; i < _tokens.length;) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

132:         for (uint256 i = 0; i < _executionData.length;) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/LoanManager.sol

81:         for (uint256 i = 0; i < _callers.length;) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManager.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

563:         uint256 totalProtocolFee = 0;

570:         for (uint256 i = 0; i < _loan.tranche.length;) {

912:             for (uint256 i = 0; i < totalValidators;) {

932:         uint256 totalRepayment = 0;

933:         uint256 totalProtocolFee = 0;

940:             uint256 thisProtocolFee = 0;

999:         for (uint256 i = 0; i < _offerExecution.length;) {

1061:         for (uint256 i = 0; i < newTrancheIndex;) {

1102:         uint256 originalIndex = 0;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/pools/PoolOfferHandler.sol

84:         for (uint256 i = 0; i < __terms.length; i++) {

104:         for (uint256 i = 0; i < __terms.length; i++) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/PoolOfferHandler.sol)

```solidity
File: src/lib/utils/Hash.sol

41:         for (uint256 i = 0; i < _loanOffer.validators.length;) {

85:         for (uint256 i = 0; i < _executionData.offerExecution.length;) {

142:         for (uint256 i = 0; i < _refinanceOffer.trancheIndex.length;) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/Hash.sol)

```solidity
File: src/lib/utils/Interest.sol

24:         uint256 owed = 0;

25:         for (uint256 i = 0; i < _loan.tranche.length;) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/Interest.sol)

## Low Issues

| |Issue|Instances|
|-|:-|:-:|
| [L-1](#L-1) | `approve()`/`safeApprove()` may revert if the current approval is not zero | 9 |
| [L-2](#L-2) | Use of `tx.origin` is unsafe in almost every context | 12 |
| [L-3](#L-3) | Some tokens may revert when zero value transfers are made | 28 |
| [L-4](#L-4) | Missing checks for `address(0)` when assigning values to address state variables | 18 |
| [L-5](#L-5) | `abi.encodePacked()` should not be used with dynamic types when passing the result to a hash function such as `keccak256()` | 4 |
| [L-6](#L-6) | Use of `tx.origin` is unsafe in almost every context | 12 |
| [L-7](#L-7) | Deprecated approve() function | 5 |
| [L-8](#L-8) | Division by zero not prevented | 9 |
| [L-9](#L-9) | `domainSeparator()` isn't protected against replay attacks in case of a future chain split  | 7 |
| [L-10](#L-10) | Empty Function Body - Consider commenting why | 1 |
| [L-11](#L-11) | Empty `receive()/payable fallback()` function does not authenticate requests | 3 |
| [L-12](#L-12) | External call recipient may consume all transaction gas | 16 |
| [L-13](#L-13) | Initializers could be front-run | 1 |
| [L-14](#L-14) | Signature use at deadlines should be allowed | 11 |
| [L-15](#L-15) | Prevent accidentally burning tokens | 5 |
| [L-16](#L-16) | NFT ownership doesn't support hard forks | 2 |
| [L-17](#L-17) | Owner can renounce while system is paused | 1 |
| [L-18](#L-18) | Possible rounding issue | 2 |
| [L-19](#L-19) | Loss of precision | 4 |
| [L-20](#L-20) | Solidity version 0.8.20+ may not work on other chains due to `PUSH0` | 18 |
| [L-21](#L-21) | Use `Ownable2Step.transferOwnership` instead of `Ownable.transferOwnership` | 1 |
| [L-22](#L-22) | Consider using OpenZeppelin's SafeCast library to prevent unexpected overflows when downcasting | 10 |
| [L-23](#L-23) | Unsafe ERC20 operation(s) | 28 |
| [L-24](#L-24) | Upgradeable contract not initialized | 1 |
| [L-25](#L-25) | A year is not always 365 days | 2 |

### <a name="L-1"></a>[L-1] `approve()`/`safeApprove()` may revert if the current approval is not zero

- Some tokens (like the *very popular* USDT) do not work when changing the allowance from an existing non-zero allowance value (it will revert if the current approval is not zero to protect against front-running changes of approvals). These tokens must first be approved for zero and then the actual allowance can be approved.
- Furthermore, OZ's implementation of safeApprove would throw an error if an approve is attempted from a non-zero value (`"SafeERC20: approve from non-zero to non-zero allowance"`)

Set the allowance to zero immediately before each of the existing allowance calls

*Instances (9)*:

```solidity
File: src/lib/AuctionLoanLiquidator.sol

287:         asset.approve(address(_liquidationDistributor), proceeds);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

213:             collection.approve(executionInfo.module, _loan.nftCollateralTokenId);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

43:         ERC20(__usdc).approve(__aavePool, type(uint256).max);

44:         ERC20(__aToken).approve(__aavePool, type(uint256).max);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

64:         ERC20(__lido).approve(__curvePool, type(uint256).max);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/Pool.sol

173:         _asset.approve(address(_feeManager), type(uint256).max);

212:             asset.approve(cachedAllocator, 0);

214:         asset.approve(_newBaseInterestAllocator, type(uint256).max);

235:         asset.approve(_caller, type(uint256).max);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

### <a name="L-2"></a>[L-2] Use of `tx.origin` is unsafe in almost every context

According to [Vitalik Buterin](https://ethereum.stackexchange.com/questions/196/how-do-i-make-my-dapp-serenity-proof), contracts should *not* `assume that tx.origin will continue to be usable or meaningful`. An example of this is [EIP-3074](https://eips.ethereum.org/EIPS/eip-3074#allowing-txorigin-as-signer-1) which explicitly mentions the intention to change its semantics when it's used with new op codes. There have also been calls to [remove](https://github.com/ethereum/solidity/issues/683) `tx.origin`, and there are [security issues](solidity.readthedocs.io/en/v0.4.24/security-considerations.html#tx-origin) associated with using it for authorization. For these reasons, it's best to completely avoid the feature.

*Instances (12)*:

```solidity
File: src/lib/AddressManager.sol

31:     constructor(address[] memory _original) Owned(tx.origin) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AddressManager.sol)

```solidity
File: src/lib/AuctionLoanLiquidator.sol

114:         Owned(tx.origin)

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/UserVault.sol

98:         Owned(tx.origin)

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

71:     ) WithProtocolFee(tx.origin, _minWaitTime, __protocolFee) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/LoanManagerRegistry.sol

14:     constructor() Owned(tx.origin) {}

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManagerRegistry.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

110:             tx.origin,

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/loans/WithLoanManagers.sol

12:     constructor() Owned(tx.origin) {}

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/WithLoanManagers.sol)

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

35:     constructor(address _pool, address __aavePool, address __usdc, address __aToken) Owned(tx.origin) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/FeeManager.sol

28:     constructor(Fees memory __fees) TwoStepOwned(tx.origin, WAIT_TIME) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/FeeManager.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

54:     ) Owned(tx.origin) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/Pool.sol

147:     ) ERC4626(_asset, _name, _symbol) LoanManager(tx.origin, _offerHandler, _waitingTimeBetweenUpdates) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/pools/PoolOfferHandler.sol

71:     constructor(uint32 _maxDuration, uint256 _newTermsWaitingTime) Owned(tx.origin) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/PoolOfferHandler.sol)

### <a name="L-3"></a>[L-3] Some tokens may revert when zero value transfers are made

Example: <https://github.com/d-xo/weird-erc20#revert-on-zero-value-transfers>.

In spite of the fact that EIP-20 [states](https://github.com/ethereum/EIPs/blob/46b9b698815abbfa628cd1097311deee77dd45c5/EIPS/eip-20.md?plain=1#L116) that zero-valued transfers must be accepted, some tokens, such as LEND will revert if this is attempted, which may cause transactions that involve other tokens (such as batch operations) to fully revert. Consider skipping the transfer if the amount is zero, which will also save gas.

*Instances (28)*:

```solidity
File: src/lib/AuctionLoanLiquidator.sol

244:             token.safeTransfer(_auction.highestBidder, currentHighestBid);

248:         token.safeTransferFrom(newBidder, address(this), _bid);

285:         asset.safeTransfer(_auction.originator, triggerFee);

286:         asset.safeTransfer(msg.sender, triggerFee);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/AuctionWithBuyoutLoanLiquidator.sol

89:                 asset.safeTransferFrom(msg.sender, thisTranche.lender, owed);

97:         asset.safeTransfer(_auction.originator, totalOwed.mulDivDown(_auction.triggerFee, _BPS));

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionWithBuyoutLoanLiquidator.sol)

```solidity
File: src/lib/LiquidationDistributor.sol

88:         ERC20(_tokenAddress).safeTransferFrom(_liquidator, _tranche.lender, total);

100:             ERC20(_tokenAddress).safeTransferFrom(_liquidator, _tranche.lender, _trancheOwed);

104:             ERC20(_tokenAddress).safeTransferFrom(_liquidator, _tranche.lender, _proceedsLeft);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationDistributor.sol)

```solidity
File: src/lib/UserVault.sol

308:         ERC20(_token).safeTransferFrom(_depositor, address(this), _amount);

352:         ERC20(_token).safeTransfer(msg.sender, amount);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

219:             asset.safeTransfer(_loan.borrower, balance);

307:             ERC20(principalAddress).safeTransferFrom(borrower, tranche.lender, taxCost - feeTax);

313:             ERC20(principalAddress).safeTransferFrom(borrower, protocolFee.recipient, totalFeeTax);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

200:             ERC20(_loan.principalAddress).safeTransferFrom(

204:             ERC20(_loan.principalAddress).safeTransferFrom(

368:         ERC20(_loan.principalAddress).safeTransferFrom(

374:             ERC20(_loan.principalAddress).safeTransferFrom(

636:             ERC20(_principalAddress).safeTransferFrom(

684:             ERC20(_principalAddress).safeTransferFrom(_lender, _feeRecipient, _fee);

724:         ERC20(_loan.principalAddress).safeTransferFrom(_renegotiationOffer.lender, _loan.borrower, delta);

946:             asset.safeTransferFrom(loan.borrower, tranche.lender, repayment);

964:             asset.safeTransferFrom(loan.borrower, _protocolFee.recipient, totalProtocolFee);

1025:             ERC20(offer.principalAddress).safeTransferFrom(lender, _principalReceiver, amount - fee);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

67:             ERC20(_usdc).transferFrom(pool, address(this), delta);

72:             ERC20(_usdc).transfer(pool, delta);

84:         ERC20(_usdc).transfer(pool, total);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/WithdrawalQueue.sol

101:         _asset.safeTransfer(_to, available);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/WithdrawalQueue.sol)

### <a name="L-4"></a>[L-4] Missing checks for `address(0)` when assigning values to address state variables

*Instances (18)*:

```solidity
File: src/lib/LiquidationHandler.sol

48:         _loanLiquidator = __loanLiquidator;

66:         _loanLiquidator = __loanLiquidator;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationHandler.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

232:         _pendingMultiSourceLoanAddress = _newAddress;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/LoanManager.sol

51:         getUnderwriter = __underwriter;

111:         getPendingUnderwriter = __underwriter;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManager.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

118:         getDelegateRegistry = delegateRegistry;

119:         getFlashActionContract = flashActionContract;

495:         getDelegateRegistry = _newDelegateRegistry;

549:         getFlashActionContract = _newFlashActionContract;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

39:         getPool = _pool;

40:         _aavePool = __aavePool;

41:         _usdc = __usdc;

42:         _aToken = __aToken;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

58:         getPool = _pool;

61:         _lido = __lido;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/Pool.sol

148:         getFeeManager = _feeManager;

195:         getPendingBaseInterestAllocator = _newBaseInterestAllocator;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/utils/TwoStepOwned.sol

27:         pendingOwner = _newOwner;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/TwoStepOwned.sol)

### <a name="L-5"></a>[L-5] `abi.encodePacked()` should not be used with dynamic types when passing the result to a hash function such as `keccak256()`

Use `abi.encode()` instead which will pad items to 32 bytes, which will [prevent hash collisions](https://docs.soliditylang.org/en/v0.8.13/abi-spec.html#non-standard-packed-mode) (e.g. `abi.encodePacked(0x123,0x456)` => `0x123456` => `abi.encodePacked(0x1,0x23456)`, but `abi.encode(0x123,0x456)` => `0x0...1230...456`). "Unless there is a compelling reason, `abi.encode` should be preferred". If there is only one argument to `abi.encodePacked()` it can often be cast to `bytes()` or `bytes32()` [instead](https://ethereum.stackexchange.com/questions/30912/how-to-compare-strings-in-solidity#answer-82739).
If all arguments are strings and or bytes, `bytes.concat()` should be used instead

*Instances (4)*:

```solidity
File: src/lib/utils/Hash.sol

42:             encodedValidators = abi.encodePacked(encodedValidators, _hashValidator(_loanOffer.validators[i]));

87:                 abi.encodePacked(encodedOfferExecution, _hashOfferExecution(_executionData.offerExecution[i]));

120:             trancheHashes = abi.encodePacked(trancheHashes, _hashTranche(_loan.tranche[i]));

143:             encodedIndexes = abi.encodePacked(encodedIndexes, _refinanceOffer.trancheIndex[i]);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/Hash.sol)

### <a name="L-6"></a>[L-6] Use of `tx.origin` is unsafe in almost every context

According to [Vitalik Buterin](https://ethereum.stackexchange.com/questions/196/how-do-i-make-my-dapp-serenity-proof), contracts should *not* `assume that tx.origin will continue to be usable or meaningful`. An example of this is [EIP-3074](https://eips.ethereum.org/EIPS/eip-3074#allowing-txorigin-as-signer-1) which explicitly mentions the intention to change its semantics when it's used with new op codes. There have also been calls to [remove](https://github.com/ethereum/solidity/issues/683) `tx.origin`, and there are [security issues](solidity.readthedocs.io/en/v0.4.24/security-considerations.html#tx-origin) associated with using it for authorization. For these reasons, it's best to completely avoid the feature.

*Instances (12)*:

```solidity
File: src/lib/AddressManager.sol

31:     constructor(address[] memory _original) Owned(tx.origin) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AddressManager.sol)

```solidity
File: src/lib/AuctionLoanLiquidator.sol

114:         Owned(tx.origin)

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/UserVault.sol

98:         Owned(tx.origin)

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

71:     ) WithProtocolFee(tx.origin, _minWaitTime, __protocolFee) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/LoanManagerRegistry.sol

14:     constructor() Owned(tx.origin) {}

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManagerRegistry.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

110:             tx.origin,

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/loans/WithLoanManagers.sol

12:     constructor() Owned(tx.origin) {}

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/WithLoanManagers.sol)

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

35:     constructor(address _pool, address __aavePool, address __usdc, address __aToken) Owned(tx.origin) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/FeeManager.sol

28:     constructor(Fees memory __fees) TwoStepOwned(tx.origin, WAIT_TIME) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/FeeManager.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

54:     ) Owned(tx.origin) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/Pool.sol

147:     ) ERC4626(_asset, _name, _symbol) LoanManager(tx.origin, _offerHandler, _waitingTimeBetweenUpdates) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/pools/PoolOfferHandler.sol

71:     constructor(uint32 _maxDuration, uint256 _newTermsWaitingTime) Owned(tx.origin) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/PoolOfferHandler.sol)

### <a name="L-7"></a>[L-7] Deprecated approve() function

Due to the inheritance of ERC20's approve function, there's a vulnerability to the ERC20 approve and double spend front running attack. Briefly, an authorized spender could spend both allowances by front running an allowance-changing transaction. Consider implementing OpenZeppelin's `.safeApprove()` function to help mitigate this.

*Instances (5)*:

```solidity
File: src/lib/AuctionLoanLiquidator.sol

287:         asset.approve(address(_liquidationDistributor), proceeds);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

213:             collection.approve(executionInfo.module, _loan.nftCollateralTokenId);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/pools/Pool.sol

212:             asset.approve(cachedAllocator, 0);

214:         asset.approve(_newBaseInterestAllocator, type(uint256).max);

235:         asset.approve(_caller, type(uint256).max);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

### <a name="L-8"></a>[L-8] Division by zero not prevented

The divisions below take an input parameter which does not have any zero-value checks, which may lead to the functions reverting when zero is passed.

*Instances (9)*:

```solidity
File: src/lib/loans/MultiSourceLoan.sol

187:                 totalAnnualInterest / _loan.principalAmount,

923:         return _loanPrincipal / (_MAX_RATIO_TRANCHE_MIN_PRINCIPAL * getMaxTranches);

1139:             cumAprBps / principalAmount

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

103:         return currentLiquidityRate * _BPS / _RAY;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

81:                 _BPS * _SECONDS_PER_YEAR * (shareRate - lidoData.shareRate) / lidoData.shareRate

141:         return lido.getTotalPooledEther() * 1e27 / lido.getTotalShares();

163:             _BPS * _SECONDS_PER_YEAR * (shareRate - _lidoData.shareRate) / _lidoData.shareRate

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/Pool.sol

724:         return __outstandingValues.sumApr / __outstandingValues.principalAmount;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/pools/WithdrawalQueue.sol

143:         return (_totalWithdrawn + _asset.balanceOf(address(this))) / getTotalShares;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/WithdrawalQueue.sol)

### <a name="L-9"></a>[L-9] `domainSeparator()` isn't protected against replay attacks in case of a future chain split

Severity: Low.
Description: See <https://eips.ethereum.org/EIPS/eip-2612#security-considerations>.
Remediation: Consider using the [implementation](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/cryptography/EIP712.sol#L77-L90) from OpenZeppelin, which recalculates the domain separator if the current `block.chainid` is not the cached chain ID.
Past occurrences of this issue:

- [Reality Cards Contest](https://github.com/code-423n4/2021-06-realitycards-findings/issues/166)
- [Swivel Contest](https://github.com/code-423n4/2021-09-swivel-findings/issues/98)
- [Malt Finance Contest](https://github.com/code-423n4/2021-11-malt-findings/issues/349)

*Instances (7)*:

```solidity
File: src/lib/loans/BaseLoan.sol

30:     bytes32 public immutable INITIAL_DOMAIN_SEPARATOR;

126:         INITIAL_DOMAIN_SEPARATOR = _computeDomainSeparator();

130:     function DOMAIN_SEPARATOR() public view returns (bytes32) {

131:         return block.chainid == INITIAL_CHAIN_ID ? INITIAL_DOMAIN_SEPARATOR : _computeDomainSeparator();

205:     function _computeDomainSeparator() private view returns (bytes32) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoan.sol)

```solidity
File: src/lib/loans/BaseLoanHelpers.sol

8:     function initialize(bytes32 _domainSeparator, bytes4 _magicValue) external virtual onlyOwner {}

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoanHelpers.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

805:         bytes32 typedDataHash = DOMAIN_SEPARATOR().toTypedDataHash(_hash);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

### <a name="L-10"></a>[L-10] Empty Function Body - Consider commenting why

*Instances (1)*:

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

89:     function claimRewards() external {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)

### <a name="L-11"></a>[L-11] Empty `receive()/payable fallback()` function does not authenticate requests

If the intention is for the Ether to be used, the function should call another function, otherwise it should revert (e.g. require(msg.sender == address(weth))). Having no access control on the function means that someone may send Ether to the contract, and have no way to get anything back out, which is a loss of funds. If the concern is having to spend a small amount of gas to check the sender against an immutable address, the code should at least have a function to rescue unused Ether.

*Instances (3)*:

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

317:     fallback() external payable {}

319:     receive() external payable {}

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

172:     receive() external payable {}

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

### <a name="L-12"></a>[L-12] External call recipient may consume all transaction gas

There is no limit specified on the amount of gas used, so the recipient can use up all of the transaction's gas, causing it to revert. Use `addr.call{gas: <amount>}("")` or [this](https://github.com/nomad-xyz/ExcessivelySafeCall) library instead.

*Instances (16)*:

```solidity
File: src/lib/UserVault.sol

369:         (bool sent,) = payable(msg.sender).call{value: amount}("");

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

118:             (bool success,) = payable(msg.sender).call{value: remainingBalance}("");

161:         (bool success,) = executionInfo.module.call{value: executionInfo.value}(executionInfo.data);

201:             (success,) = executionInfo.module.call(executionInfo.data);

209:             (success,) = executionInfo.module.call(executionInfo.data);

214:             (success,) = executionInfo.module.call(executionInfo.data);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/LoanManager.sol

83:             if (pendingCallers[i].caller != caller.caller || pendingCallers[i].isLoanContract != caller.isLoanContract)

87:             _acceptedCallers.add(caller.caller);

88:             _isLoanContract[caller.caller] = caller.isLoanContract;

90:             afterCallerAdded(caller.caller);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManager.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

149:         if (_hasCallback(executionData.callbackData)) {

150:             handleAfterPrincipalTransferCallback(loan, msg.sender, executionData.callbackData, totalFee);

424:         if (_hasCallback(_repaymentData.data.callbackData)) {

425:             handleAfterNFTTransferCallback(loan, msg.sender, _repaymentData.data.callbackData);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/utils/Hash.sol

101:                 keccak256(_executionData.callbackData)

111:                 keccak256(_repaymentData.callbackData),

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/Hash.sol)

### <a name="L-13"></a>[L-13] Initializers could be front-run

Initializers could be front-run, allowing an attacker to either set their own values, take ownership of the contract, and in the best case forcing a re-deployment

*Instances (1)*:

```solidity
File: src/lib/loans/BaseLoanHelpers.sol

8:     function initialize(bytes32 _domainSeparator, bytes4 _magicValue) external virtual onlyOwner {}

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoanHelpers.sol)

### <a name="L-14"></a>[L-14] Signature use at deadlines should be allowed

According to [EIP-2612](https://github.com/ethereum/EIPs/blob/71dc97318013bf2ac572ab63fab530ac9ef419ca/EIPS/eip-2612.md?plain=1#L58), signatures used on exactly the deadline timestamp are supposed to be allowed. While the signature may or may not be used for the exact EIP-2612 use case (transfer approvals), for consistency's sake, all deadlines should follow this semantic. If the timestamp is an expiration rather than a deadline, consider whether it makes more sense to include the expiration timestamp as a valid timestamp, as is done for deadlines.

*Instances (11)*:

```solidity
File: src/lib/AuctionWithBuyoutLoanLiquidator.sol

64:         if (timeLimit < block.timestamp) {

129:         if (timeLimit > block.timestamp) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionWithBuyoutLoanLiquidator.sol)

```solidity
File: src/lib/LiquidationHandler.sol

91:         if (expirationTime > block.timestamp) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationHandler.sol)

```solidity
File: src/lib/loans/LoanManager.sol

77:         if (getPendingAcceptedCallersSetTime + UPDATE_WAITING_TIME > block.timestamp) {

120:         if (getPendingUnderwriterSetTime + UPDATE_WAITING_TIME > block.timestamp) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManager.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

612:         if (unlockedTime > block.timestamp) {

649:         if (_loan.startTime + _loan.duration < block.timestamp) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/pools/FeeManager.sol

49:         if (_pendingFeesSetTime + WAIT_TIME > block.timestamp) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/FeeManager.sol)

```solidity
File: src/lib/pools/Pool.sol

205:             if (getPendingBaseInterestAllocatorSetTime + UPDATE_WAITING_TIME > block.timestamp) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/pools/WithdrawalQueue.sol

86:         if (unlockTime > block.timestamp) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/WithdrawalQueue.sol)

```solidity
File: src/lib/utils/TwoStepOwned.sol

36:         if (pendingOwnerTime + MIN_WAIT_TIME > block.timestamp) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/TwoStepOwned.sol)

### <a name="L-15"></a>[L-15] Prevent accidentally burning tokens

Minting and burning tokens to address(0) prevention

*Instances (5)*:

```solidity
File: src/lib/UserVault.sol

115:         _mint(msg.sender, _vaultId);

358:         _burn(_vaultId);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/pools/Pool.sol

424:         _mint(msg.sender, shares);

760:         _burn(owner, shares);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/pools/WithdrawalQueue.sol

65:         _mint(_to, getNextTokenId);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/WithdrawalQueue.sol)

### <a name="L-16"></a>[L-16] NFT ownership doesn't support hard forks

To ensure clarity regarding the ownership of the NFT on a specific chain, it is recommended to add `require(block.chainid == 1, "Invalid Chain")` or the desired chain ID in the functions below.

Alternatively, consider including the chain ID in the URI itself. By doing so, any confusion regarding the chain responsible for owning the NFT will be eliminated.

*Instances (2)*:

```solidity
File: src/lib/UserVault.sol

105:     function tokenURI(uint256 _vaultId) public pure override returns (string memory) {
             return string.concat(_BASE_URI, Strings.toString(_vaultId));

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/pools/WithdrawalQueue.sol

75:     function tokenURI(uint256 _id) public pure override returns (string memory) {
            return string.concat(_BASE_URI, Strings.toString(_id));

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/WithdrawalQueue.sol)

### <a name="L-17"></a>[L-17] Owner can renounce while system is paused

The contract owner or single user with a role is not prevented from renouncing the role/ownership while the contract is paused, which would cause any user assets stored in the protocol, to be locked indefinitely.

*Instances (1)*:

```solidity
File: src/lib/pools/Pool.sol

177:     function pausePool() external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

### <a name="L-18"></a>[L-18] Possible rounding issue

Division by large numbers may result in the result being zero, due to solidity not supporting fractions. Consider requiring a minimum amount for the numerator to ensure that it is always larger than the denominator. Also, there is indication of multiplication and division without the use of parenthesis which could result in issues.

*Instances (2)*:

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

141:         return lido.getTotalPooledEther() * 1e27 / lido.getTotalShares();

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/WithdrawalQueue.sol

143:         return (_totalWithdrawn + _asset.balanceOf(address(this))) / getTotalShares;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/WithdrawalQueue.sol)

### <a name="L-19"></a>[L-19] Loss of precision

Division by large numbers may result in the result being zero, due to solidity not supporting fractions. Consider requiring a minimum amount for the numerator to ensure that it is always larger than the denominator

*Instances (4)*:

```solidity
File: src/lib/loans/MultiSourceLoan.sol

923:         return _loanPrincipal / (_MAX_RATIO_TRANCHE_MIN_PRINCIPAL * getMaxTranches);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

103:         return currentLiquidityRate * _BPS / _RAY;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

82:                     / (block.timestamp - lidoData.lastTs)

164:                 / (block.timestamp - _lidoData.lastTs)

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

### <a name="L-20"></a>[L-20] Solidity version 0.8.20+ may not work on other chains due to `PUSH0`

The compiler for Solidity 0.8.20 switches the default target EVM version to [Shanghai](https://blog.soliditylang.org/2023/05/10/solidity-0.8.20-release-announcement/#important-note), which includes the new `PUSH0` op code. This op code may not yet be implemented on all L2s, so deployment on these chains will fail. To work around this issue, use an earlier [EVM](https://docs.soliditylang.org/en/v0.8.20/using-the-compiler.html?ref=zaryabs.com#setting-the-evm-version-to-target) [version](https://book.getfoundry.sh/reference/config/solidity-compiler#evm_version). While the project itself may or may not compile with 0.8.20, other projects with which it integrates, or which extend this project may, and those projects will have problems deploying these contracts/libraries.

*Instances (18)*:

```solidity
File: src/lib/AddressManager.sol

2: pragma solidity ^0.8.21;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AddressManager.sol)

```solidity
File: src/lib/AuctionLoanLiquidator.sol

2: pragma solidity ^0.8.21;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/AuctionWithBuyoutLoanLiquidator.sol

2: pragma solidity ^0.8.21;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionWithBuyoutLoanLiquidator.sol)

```solidity
File: src/lib/LiquidationDistributor.sol

2: pragma solidity ^0.8.21;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationDistributor.sol)

```solidity
File: src/lib/UserVault.sol

2: pragma solidity ^0.8.21;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

2: pragma solidity ^0.8.21;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/LoanManagerRegistry.sol

2: pragma solidity ^0.8.21;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManagerRegistry.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

2: pragma solidity ^0.8.21;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

2: pragma solidity ^0.8.21;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/FeeManager.sol

2: pragma solidity ^0.8.21;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/FeeManager.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

2: pragma solidity ^0.8.21;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/Pool.sol

2: pragma solidity ^0.8.21;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/pools/PoolOfferHandler.sol

2: pragma solidity ^0.8.21;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/PoolOfferHandler.sol)

```solidity
File: src/lib/pools/WithdrawalQueue.sol

2: pragma solidity ^0.8.21;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/WithdrawalQueue.sol)

```solidity
File: src/lib/utils/BytesLib.sol

9: pragma solidity ^0.8.21;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/BytesLib.sol)

```solidity
File: src/lib/utils/Hash.sol

2: pragma solidity ^0.8.21;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/Hash.sol)

```solidity
File: src/lib/utils/Interest.sol

2: pragma solidity ^0.8.21;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/Interest.sol)

```solidity
File: src/lib/utils/ValidatorHelpers.sol

2: pragma solidity ^0.8.21;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/ValidatorHelpers.sol)

### <a name="L-21"></a>[L-21] Use `Ownable2Step.transferOwnership` instead of `Ownable.transferOwnership`

Use [Ownable2Step.transferOwnership](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable2Step.sol) which is safer. Use it as it is more secure due to 2-stage ownership transfer.

**Recommended Mitigation Steps**

Use <a href="https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable2Step.sol">Ownable2Step.sol</a>
  
  ```solidity
      function acceptOwnership() external {
          address sender = _msgSender();
          require(pendingOwner() == sender, "Ownable2Step: caller is not the new owner");
          _transferOwnership(sender);
      }
```

*Instances (1)*:

```solidity
File: src/lib/utils/TwoStepOwned.sol

35:     function transferOwnership(address newOwner) public override onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/TwoStepOwned.sol)

### <a name="L-22"></a>[L-22] Consider using OpenZeppelin's SafeCast library to prevent unexpected overflows when downcasting

Downcasting from `uint256`/`int256` in Solidity does not revert on overflow. This can result in undesired exploitation or bugs, since developers usually assume that overflows raise errors. [OpenZeppelin's SafeCast library](https://docs.openzeppelin.com/contracts/3.x/api/utils#SafeCast) restores this intuition by reverting the transaction when such an operation overflows. Using this library eliminates an entire class of bugs, so it's recommended to use it always. Some exceptions are acceptable like with the classic `uint256(uint160(address(variable)))`

*Instances (10)*:

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

62:         getLidoData = LidoData(0, uint144(_currentShareRate()), uint16(_currentBaseAprBps));

166:         _lidoData.shareRate = uint144(shareRate);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/Pool.sol

341:             uint128((totalSupplyCached - sharesPendingWithdrawal).mulDivDown(PRINCIPAL_PRECISION, totalSupplyCached));

343:             uint128(sharesPendingWithdrawal.mulDivDown(PRINCIPAL_PRECISION, totalSupplyCached)), poolFraction

367:                 uint128(thisQueueAccounting.netPoolFraction.mulDivDown(sharesPendingWithdrawal, totalSupplyCached));

509:         outstandingValues.sumApr += uint128(_apr * _principalAmount);

510:         outstandingValues.principalAmount += uint128(_principalAmount);

749:             __outstandingValues.accruedInterest = uint128(total - _interestEarned);

751:         __outstandingValues.sumApr -= uint128(_apr * _principalAmount);

752:         __outstandingValues.principalAmount -= uint128(_principalAmount);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

### <a name="L-23"></a>[L-23] Unsafe ERC20 operation(s)

*Instances (28)*:

```solidity
File: src/lib/AuctionLoanLiquidator.sol

278:         ERC721(collateralAddress).transferFrom(address(this), _auction.highestBidder, tokenId);

287:         asset.approve(address(_liquidationDistributor), proceeds);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/AuctionWithBuyoutLoanLiquidator.sol

99:         ERC721(_loan.nftCollateralAddress).transferFrom(address(this), msg.sender, _tokenId);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionWithBuyoutLoanLiquidator.sol)

```solidity
File: src/lib/LiquidationHandler.sol

95:             ERC721(_loan.nftCollateralAddress).transferFrom(

102:             ERC721(_loan.nftCollateralAddress).transferFrom(address(this), _loanLiquidator, _loan.nftCollateralTokenId);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationHandler.sol)

```solidity
File: src/lib/UserVault.sol

286:         ERC721(_collection).transferFrom(_depositor, address(this), _tokenId);

324:         ERC721(_collection).transferFrom(address(this), msg.sender, _tokenId);

338:         IOldERC721(_collection).transfer(msg.sender, _tokenId);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

170:             _wrappedPunk.transferFrom(address(this), _loan.borrower, _loan.nftCollateralTokenId);

172:             ERC721(_loan.nftCollateralAddress).transferFrom(address(this), _loan.borrower, _loan.nftCollateralTokenId);

197:             _wrappedPunk.transferFrom(_loan.borrower, address(this), _loan.nftCollateralTokenId);

212:             collection.transferFrom(_loan.borrower, address(this), _loan.nftCollateralTokenId);

213:             collection.approve(executionInfo.module, _loan.nftCollateralTokenId);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

153:         ERC721(nftCollateralAddress).transferFrom(borrower, address(this), executionData.tokenId);

422:         ERC721(loan.nftCollateralAddress).transferFrom(address(this), loan.borrower, loan.nftCollateralTokenId);

533:         ERC721(_loan.nftCollateralAddress).transferFrom(

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

43:         ERC20(__usdc).approve(__aavePool, type(uint256).max);

44:         ERC20(__aToken).approve(__aavePool, type(uint256).max);

67:             ERC20(_usdc).transferFrom(pool, address(this), delta);

72:             ERC20(_usdc).transfer(pool, delta);

84:         ERC20(_usdc).transfer(pool, total);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

64:         ERC20(__lido).approve(__curvePool, type(uint256).max);

119:             weth.transferFrom(getPool, address(this), amount);

157:         weth.transfer(_pool, received);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/Pool.sol

173:         _asset.approve(address(_feeManager), type(uint256).max);

212:             asset.approve(cachedAllocator, 0);

214:         asset.approve(_newBaseInterestAllocator, type(uint256).max);

235:         asset.approve(_caller, type(uint256).max);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

### <a name="L-24"></a>[L-24] Upgradeable contract not initialized

Upgradeable contracts are initialized via an initializer function rather than by a constructor. Leaving such a contract uninitialized may lead to it being taken over by a malicious user

*Instances (1)*:

```solidity
File: src/lib/loans/BaseLoanHelpers.sol

8:     function initialize(bytes32 _domainSeparator, bytes4 _magicValue) external virtual onlyOwner {}

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoanHelpers.sol)

### <a name="L-25"></a>[L-25] A year is not always 365 days

On leap years, the number of days is 366, so calculations during those years will return the wrong value

*Instances (2)*:

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

23:     uint256 private constant _SECONDS_PER_YEAR = 365 days;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

28:     uint256 private constant _SECONDS_PER_YEAR = 365 days;

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

## Medium Issues

| |Issue|Instances|
|-|:-|:-:|
| [M-1](#M-1) | Contracts are vulnerable to fee-on-transfer accounting-related issues | 3 |
| [M-2](#M-2) | Centralization Risk for trusted owners | 64 |
| [M-3](#M-3) | `_safeMint()` should be used rather than `_mint()` wherever possible | 2 |
| [M-4](#M-4) | Using `transferFrom` on ERC721 tokens | 11 |
| [M-5](#M-5) | Fees can be set to be greater than 100%. | 2 |
| [M-6](#M-6) |  Solmate's SafeTransferLib does not check for token contract's existence | 26 |
| [M-7](#M-7) | Return values of `transfer()`/`transferFrom()` not checked | 3 |
| [M-8](#M-8) | Unsafe use of `transfer()`/`transferFrom()` with `IERC20` | 3 |

### <a name="M-1"></a>[M-1] Contracts are vulnerable to fee-on-transfer accounting-related issues

Consistently check account balance before and after transfers for Fee-On-Transfer discrepancies. As arbitrary ERC20 tokens can be used, the amount here should be calculated every time to take into consideration a possible fee-on-transfer or deflation.
Also, it's a good practice for the future of the solution.

Use the balance before and after the transfer to calculate the received amount instead of assuming that it would be equal to the amount passed as a parameter. Or explicitly document that such tokens shouldn't be used and won't be supported

*Instances (3)*:

```solidity
File: src/lib/AuctionLoanLiquidator.sol

248:         token.safeTransferFrom(newBidder, address(this), _bid);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/UserVault.sol

308:         ERC20(_token).safeTransferFrom(_depositor, address(this), _amount);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

67:             ERC20(_usdc).transferFrom(pool, address(this), delta);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)

### <a name="M-2"></a>[M-2] Centralization Risk for trusted owners

#### Impact

Contracts have owners with privileged rights to perform admin tasks and need to be trusted to not perform malicious updates or drain funds.

*Instances (64)*:

```solidity
File: src/lib/AddressManager.sol

12: contract AddressManager is InputChecker, Owned, ReentrancyGuard {

31:     constructor(address[] memory _original) Owned(tx.origin) {

43:     function add(address _entry) external onlyOwner returns (uint16) {

48:     function addToWhitelist(address _entry) external onlyOwner {

60:     function removeFromWhitelist(address _entry) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AddressManager.sol)

```solidity
File: src/lib/AuctionLoanLiquidator.sol

29:     Owned,

114:         Owned(tx.origin)

126:     function addLoanContract(address _loanContract) external onlyOwner {

135:     function removeLoanContract(address _loanContract) external onlyOwner {

149:     function updateLiquidationDistributor(address __liquidationDistributor) external onlyOwner {

163:     function updateTriggerFee(uint256 triggerFee) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/AuctionWithBuyoutLoanLiquidator.sol

108:     function setTimeForMainLenderToBuy(uint256 __timeForMainLenderToBuy) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionWithBuyoutLoanLiquidator.sol)

```solidity
File: src/lib/LiquidationHandler.sol

64:     function updateLiquidationContract(address __loanLiquidator) external override onlyOwner {

72:     function updateLiquidationAuctionDuration(uint48 _newDuration) external override onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationHandler.sol)

```solidity
File: src/lib/UserVault.sol

16: contract UserVault is ERC721, ERC721TokenReceiver, IUserVault, Owned {

98:         Owned(tx.origin)

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/callbacks/CallbackHandler.sol

27:     function addWhitelistedCallbackContract(address _contract) external onlyOwner {

36:     function removeWhitelistedCallbackContract(address _contract) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/CallbackHandler.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

229:     function updateMultiSourceLoanAddressFirst(address _newAddress) external onlyOwner {

238:     function finalUpdateMultiSourceLoanAddress(address _newAddress) external onlyOwner {

270:     function updateTaxes(Taxes calldata _newTaxes) external onlyOwner {

282:     function setTaxes() external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/BaseLoan.sol

142:     function updateImprovementMinimum(ImprovementMinimum calldata _newMinimum) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoan.sol)

```solidity
File: src/lib/loans/BaseLoanHelpers.sol

8:     function initialize(bytes32 _domainSeparator, bytes4 _magicValue) external virtual onlyOwner {}

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/BaseLoanHelpers.sol)

```solidity
File: src/lib/loans/LoanManager.sol

11: abstract contract LoanManager is ILoanManager, InputChecker, TwoStepOwned {

47:         TwoStepOwned(_owner, _updateWaitingTime)

66:     function requestAddCallers(PendingCaller[] calldata _callers) external onlyOwner {

76:     function addCallers(PendingCaller[] calldata _callers) external onlyOwner {

108:     function setUnderwriter(address __underwriter) external onlyOwner {

119:     function confirmUnderwriter(address __underwriter) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManager.sol)

```solidity
File: src/lib/loans/LoanManagerRegistry.sol

8: contract LoanManagerRegistry is ILoanManagerRegistry, Owned {

14:     constructor() Owned(tx.origin) {}

16:     function addLoanManager(address _loanManager) external onlyOwner {

22:     function removeLoanManager(address _loanManager) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/LoanManagerRegistry.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

494:     function setDelegateRegistry(address _newDelegateRegistry) external onlyOwner {

506:     function setMinLockPeriod(uint256 __minLockPeriod) external onlyOwner {

548:     function setFlashActionContract(address _newFlashActionContract) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/loans/WithLoanManagers.sol

6: abstract contract WithLoanManagers is Owned {

12:     constructor() Owned(tx.origin) {}

14:     function addLoanManager(address _loanManager) external onlyOwner {

20:     function removeLoanManager(address _loanManager) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/WithLoanManagers.sol)

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

17: contract AaveUsdcBaseInterestAllocator is IBaseInterestAllocator, Owned {

35:     constructor(address _pool, address __aavePool, address __usdc, address __aToken) Owned(tx.origin) {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/FeeManager.sol

12: contract FeeManager is IFeeManager, TwoStepOwned {

28:     constructor(Fees memory __fees) TwoStepOwned(tx.origin, WAIT_TIME) {

40:     function setPendingFees(Fees calldata __fees) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/FeeManager.sol)

```solidity
File: src/lib/pools/LidoEthBaseInterestAllocator.sol

17: contract LidoEthBaseInterestAllocator is IBaseInterestAllocator, Owned {

54:     ) Owned(tx.origin) {

68:     function setMaxSlippage(uint256 _maxSlippage) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/LidoEthBaseInterestAllocator.sol)

```solidity
File: src/lib/pools/Pool.sol

177:     function pausePool() external onlyOwner {

184:     function setOptimalIdleRange(OptimalIdleRange memory _optimalIdleRange) external onlyOwner {

192:     function setBaseInterestAllocator(address _newBaseInterestAllocator) external onlyOwner {

224:     function setReallocationBonus(uint256 _newReallocationBonus) external onlyOwner {

234:     function afterCallerAdded(address _caller) internal override onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/pools/PoolOfferHandler.sol

20: contract PoolOfferHandler is Multicall, Owned, IPoolOfferHandler {

71:     constructor(uint32 _maxDuration, uint256 _newTermsWaitingTime) Owned(tx.origin) {

80:     function setTerms(TermsKey[] calldata _termKeys, Terms[] calldata __terms) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/PoolOfferHandler.sol)

```solidity
File: src/lib/utils/TwoStepOwned.sol

8: abstract contract TwoStepOwned is Owned {

19:     constructor(address _owner, uint256 _minWaitTime) Owned(_owner) {

26:     function requestTransferOwner(address _newOwner) external onlyOwner {

35:     function transferOwnership(address newOwner) public override onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/TwoStepOwned.sol)

```solidity
File: src/lib/utils/WithProtocolFee.sol

9: abstract contract WithProtocolFee is InputChecker, TwoStepOwned {

37:         TwoStepOwned(_owner, _minWaitTime)

60:     function updateProtocolFee(ProtocolFee calldata _newProtocolFee) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/utils/WithProtocolFee.sol)

### <a name="M-3"></a>[M-3] `_safeMint()` should be used rather than `_mint()` wherever possible

`_mint()` is [discouraged](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/d4d8d2ed9798cc3383912a23b5e8d5cb602f7d4b/contracts/token/ERC721/ERC721.sol#L271) in favor of `_safeMint()` which ensures that the recipient is either an EOA or implements `IERC721Receiver`. Both open [OpenZeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/d4d8d2ed9798cc3383912a23b5e8d5cb602f7d4b/contracts/token/ERC721/ERC721.sol#L238-L250) and [solmate](https://github.com/Rari-Capital/solmate/blob/4eaf6b68202e36f67cab379768ac6be304c8ebde/src/tokens/ERC721.sol#L180) have versions of this function so that NFTs aren't lost if they're minted to contracts that cannot transfer them back out.

Be careful however to respect the CEI pattern or add a re-entrancy guard as `_safeMint` adds a callback-check (`_checkOnERC721Received`) and a malicious `onERC721Received` could be exploited if not careful.

Reading material:

- <https://blocksecteam.medium.com/when-safemint-becomes-unsafe-lessons-from-the-hypebears-security-incident-2965209bda2a>
- <https://samczsun.com/the-dangers-of-surprising-code/>
- <https://github.com/KadenZipfel/smart-contract-attack-vectors/blob/master/vulnerabilities/unprotected-callback.md>

*Instances (2)*:

```solidity
File: src/lib/UserVault.sol

115:         _mint(msg.sender, _vaultId);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/pools/WithdrawalQueue.sol

65:         _mint(_to, getNextTokenId);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/WithdrawalQueue.sol)

### <a name="M-4"></a>[M-4] Using `transferFrom` on ERC721 tokens

The `transferFrom` function is used instead of `safeTransferFrom` and [it's discouraged by OpenZeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/109778c17c7020618ea4e035efb9f0f9b82d43ca/contracts/token/ERC721/IERC721.sol#L84). If the arbitrary address is a contract and is not aware of the incoming ERC721 token, the sent token could be locked.

*Instances (11)*:

```solidity
File: src/lib/AuctionLoanLiquidator.sol

278:         ERC721(collateralAddress).transferFrom(address(this), _auction.highestBidder, tokenId);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/AuctionWithBuyoutLoanLiquidator.sol

99:         ERC721(_loan.nftCollateralAddress).transferFrom(address(this), msg.sender, _tokenId);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionWithBuyoutLoanLiquidator.sol)

```solidity
File: src/lib/LiquidationHandler.sol

102:             ERC721(_loan.nftCollateralAddress).transferFrom(address(this), _loanLiquidator, _loan.nftCollateralTokenId);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationHandler.sol)

```solidity
File: src/lib/UserVault.sol

286:         ERC721(_collection).transferFrom(_depositor, address(this), _tokenId);

324:         ERC721(_collection).transferFrom(address(this), msg.sender, _tokenId);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

170:             _wrappedPunk.transferFrom(address(this), _loan.borrower, _loan.nftCollateralTokenId);

172:             ERC721(_loan.nftCollateralAddress).transferFrom(address(this), _loan.borrower, _loan.nftCollateralTokenId);

197:             _wrappedPunk.transferFrom(_loan.borrower, address(this), _loan.nftCollateralTokenId);

212:             collection.transferFrom(_loan.borrower, address(this), _loan.nftCollateralTokenId);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

153:         ERC721(nftCollateralAddress).transferFrom(borrower, address(this), executionData.tokenId);

422:         ERC721(loan.nftCollateralAddress).transferFrom(address(this), loan.borrower, loan.nftCollateralTokenId);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

### <a name="M-5"></a>[M-5] Fees can be set to be greater than 100%

There should be an upper limit to reasonable fees.
A malicious owner can keep the fee rate at zero, but if a large value transfer enters the mempool, the owner can jack the rate up to the maximum and sandwich attack a user.

*Instances (2)*:

```solidity
File: src/lib/AuctionLoanLiquidator.sol

163:     function updateTriggerFee(uint256 triggerFee) external onlyOwner {
             _updateTriggerFee(triggerFee);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/pools/FeeManager.sol

40:     function setPendingFees(Fees calldata __fees) external onlyOwner {
            _pendingFees = __fees;
            _pendingFeesSetTime = block.timestamp;
    
            emit PendingFeesSet(__fees);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/FeeManager.sol)

### <a name="M-6"></a>[M-6]  Solmate's SafeTransferLib does not check for token contract's existence

There is a subtle difference between the implementation of solmate’s SafeTransferLib and OZ’s SafeERC20: OZ’s SafeERC20 checks if the token is a contract or not, solmate’s SafeTransferLib does not.
<https://github.com/transmissions11/solmate/blob/main/src/utils/SafeTransferLib.sol#L9>
`@dev Note that none of the functions in this library check that a token has code at all! That responsibility is delegated to the caller`

*Instances (26)*:

```solidity
File: src/lib/AuctionLoanLiquidator.sol

244:             token.safeTransfer(_auction.highestBidder, currentHighestBid);

248:         token.safeTransferFrom(newBidder, address(this), _bid);

285:         asset.safeTransfer(_auction.originator, triggerFee);

286:         asset.safeTransfer(msg.sender, triggerFee);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/AuctionLoanLiquidator.sol)

```solidity
File: src/lib/LiquidationDistributor.sol

88:         ERC20(_tokenAddress).safeTransferFrom(_liquidator, _tranche.lender, total);

100:             ERC20(_tokenAddress).safeTransferFrom(_liquidator, _tranche.lender, _trancheOwed);

104:             ERC20(_tokenAddress).safeTransferFrom(_liquidator, _tranche.lender, _proceedsLeft);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/LiquidationDistributor.sol)

```solidity
File: src/lib/UserVault.sol

308:         ERC20(_token).safeTransferFrom(_depositor, address(this), _amount);

352:         ERC20(_token).safeTransfer(msg.sender, amount);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/UserVault.sol)

```solidity
File: src/lib/callbacks/PurchaseBundler.sol

207:             _weth.safeTransfer(_loan.borrower, balance);

219:             asset.safeTransfer(_loan.borrower, balance);

307:             ERC20(principalAddress).safeTransferFrom(borrower, tranche.lender, taxCost - feeTax);

313:             ERC20(principalAddress).safeTransferFrom(borrower, protocolFee.recipient, totalFeeTax);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/callbacks/PurchaseBundler.sol)

```solidity
File: src/lib/loans/MultiSourceLoan.sol

200:             ERC20(_loan.principalAddress).safeTransferFrom(

204:             ERC20(_loan.principalAddress).safeTransferFrom(

368:         ERC20(_loan.principalAddress).safeTransferFrom(

374:             ERC20(_loan.principalAddress).safeTransferFrom(

636:             ERC20(_principalAddress).safeTransferFrom(

684:             ERC20(_principalAddress).safeTransferFrom(_lender, _feeRecipient, _fee);

724:         ERC20(_loan.principalAddress).safeTransferFrom(_renegotiationOffer.lender, _loan.borrower, delta);

946:             asset.safeTransferFrom(loan.borrower, tranche.lender, repayment);

964:             asset.safeTransferFrom(loan.borrower, _protocolFee.recipient, totalProtocolFee);

1025:             ERC20(offer.principalAddress).safeTransferFrom(lender, _principalReceiver, amount - fee);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/loans/MultiSourceLoan.sol)

```solidity
File: src/lib/pools/Pool.sol

349:         asset.safeTransfer(queue.contractAddress, proRataLiquid);

711:             asset.safeTransfer(queueAddr, amount);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/Pool.sol)

```solidity
File: src/lib/pools/WithdrawalQueue.sol

101:         _asset.safeTransfer(_to, available);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/WithdrawalQueue.sol)

### <a name="M-7"></a>[M-7] Return values of `transfer()`/`transferFrom()` not checked

Not all `IERC20` implementations `revert()` when there's a failure in `transfer()`/`transferFrom()`. The function signature has a `boolean` return value and they indicate errors that way instead. By not checking the return value, operations that should have marked as failed, may potentially go through without actually making a payment

*Instances (3)*:

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

67:             ERC20(_usdc).transferFrom(pool, address(this), delta);

72:             ERC20(_usdc).transfer(pool, delta);

84:         ERC20(_usdc).transfer(pool, total);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)

### <a name="M-8"></a>[M-8] Unsafe use of `transfer()`/`transferFrom()` with `IERC20`

Some tokens do not implement the ERC20 standard properly but are still accepted by most code that accepts ERC20 tokens.  For example Tether (USDT)'s `transfer()` and `transferFrom()` functions on L1 do not return booleans as the specification requires, and instead have no return value. When these sorts of tokens are cast to `IERC20`, their [function signatures](https://medium.com/coinmonks/missing-return-value-bug-at-least-130-tokens-affected-d67bf08521ca) do not match and therefore the calls made, revert (see [this](https://gist.github.com/IllIllI000/2b00a32e8f0559e8f386ea4f1800abc5) link for a test case). Use OpenZeppelin's `SafeERC20`'s `safeTransfer()`/`safeTransferFrom()` instead

*Instances (3)*:

```solidity
File: src/lib/pools/AaveUsdcBaseInterestAllocator.sol

67:             ERC20(_usdc).transferFrom(pool, address(this), delta);

72:             ERC20(_usdc).transfer(pool, delta);

84:         ERC20(_usdc).transfer(pool, total);

```

[Link to code](https://github.com/code-423n4/2024-04-gondi/blob/main/src/lib/pools/AaveUsdcBaseInterestAllocator.sol)
