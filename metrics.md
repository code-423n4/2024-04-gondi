
NB: This report has been created using [Solidity-Metrics](https://github.com/Consensys/solidity-metrics)
<sup>

# Solidity Metrics for Scoping for pixeldaogg - florida-contracts

## Table of contents

- [Scope](#t-scope)
    - [Source Units in Scope](#t-source-Units-in-Scope)
    - [Out of Scope](#t-out-of-scope)
        - [Excluded Source Units](#t-out-of-scope-excluded-source-units)
        - [Duplicate Source Units](#t-out-of-scope-duplicate-source-units)
        - [Doppelganger Contracts](#t-out-of-scope-doppelganger-contracts)
- [Report Overview](#t-report)
    - [Risk Summary](#t-risk)
    - [Source Lines](#t-source-lines)
    - [Inline Documentation](#t-inline-documentation)
    - [Components](#t-components)
    - [Exposed Functions](#t-exposed-functions)
    - [StateVariables](#t-statevariables)
    - [Capabilities](#t-capabilities)
    - [Dependencies](#t-package-imports)
    - [Totals](#t-totals)

## <span id=t-scope>Scope</span>

This section lists files that are in scope for the metrics report.

- **Project:** `Scoping for pixeldaogg - florida-contracts`
- **Included Files:** 
28
- **Excluded Files:** 
58
- **Project analysed:** `https://github.com/pixeldaogg/florida-contracts` (`@ac51cc6102fcf5ab274f8812eb585539332431f4`)

### <span id=t-source-Units-in-Scope>Source Units in Scope</span>

Source Units Analyzed: **`28`**<br>
Source Units in Scope: **`28`** (**100%**)

| Type | File   | Logic Contracts | Interfaces | Lines | nLines | SLOC | Comment Lines | Complex. Score | Capabilities |
| ---- | ------ | --------------- | ---------- | ----- | ------ | ----- | ------------- | -------------- | ------------ |
| 📝 | /src/lib/AddressManager.sol | 1 | **** | 100 | 100 | 61 | 16 | 42 | **<abbr title='Unchecked Blocks'>Σ</abbr>** |
| 📝 | /src/lib/AuctionLoanLiquidator.sol | 1 | **** | 336 | 321 | 241 | 31 | 144 | **** |
| 📝 | /src/lib/AuctionWithBuyoutLoanLiquidator.sol | 1 | **** | 133 | 124 | 93 | 20 | 48 | **<abbr title='Unchecked Blocks'>Σ</abbr>** |
| 🎨 | /src/lib/InputChecker.sol | 1 | **** | 15 | 15 | 9 | 4 | 4 | **** |
| 📝 | /src/lib/LiquidationDistributor.sol | 1 | **** | 123 | 111 | 106 | 7 | 55 | **<abbr title='Unchecked Blocks'>Σ</abbr>** |
| 🎨 | /src/lib/LiquidationHandler.sol | 1 | **** | 115 | 112 | 77 | 15 | 44 | **** |
| 🎨 | /src/lib/Multicall.sol | 1 | **** | 22 | 22 | 15 | 5 | 28 | **<abbr title='Payable Functions'>💰</abbr><abbr title='DelegateCall'>👥</abbr><abbr title='Unchecked Blocks'>Σ</abbr>** |
| 📝 | /src/lib/UserVault.sol | 1 | **** | 376 | 355 | 271 | 34 | 202 | **<abbr title='Payable Functions'>💰</abbr><abbr title='Initiates ETH Value Transfer'>📤</abbr><abbr title='Unchecked Blocks'>Σ</abbr>** |
| 🎨 | /src/lib/callbacks/CallbackHandler.sol | 1 | **** | 84 | 75 | 53 | 19 | 25 | **** |
| 📝 | /src/lib/callbacks/PurchaseBundler.sol | 1 | **** | 320 | 308 | 247 | 29 | 218 | **<abbr title='Payable Functions'>💰</abbr><abbr title='Unchecked Blocks'>Σ</abbr>** |
| 🎨 | /src/lib/loans/BaseLoan.sol | 1 | **** | 216 | 216 | 117 | 48 | 67 | **<abbr title='Uses Hash-Functions'>🧮</abbr><abbr title='Unchecked Blocks'>Σ</abbr>** |
| 🎨 | /src/lib/loans/BaseLoanHelpers.sol | 1 | **** | 39 | 23 | 25 | 9 | 12 | **** |
| 🎨 | /src/lib/loans/LoanManager.sol | 1 | **** | 161 | 136 | 105 | 29 | 65 | **<abbr title='Unchecked Blocks'>Σ</abbr>** |
| 📝 | /src/lib/loans/LoanManagerRegistry.sol | 1 | **** | 31 | 31 | 20 | 1 | 17 | **** |
| 📝 | /src/lib/loans/MultiSourceLoan.sol | 1 | **** | 1155 | 1058 | 864 | 151 | 438 | **<abbr title='Unchecked Blocks'>Σ</abbr>** |
| 🎨 | /src/lib/loans/WithLoanManagers.sol | 1 | **** | 29 | 29 | 19 | 1 | 15 | **** |
| 📝 | /src/lib/pools/AaveUsdcBaseInterestAllocator.sol | 1 | **** | 105 | 105 | 75 | 10 | 71 | **<abbr title='Initiates ETH Value Transfer'>📤</abbr>** |
| 📝 | /src/lib/pools/FeeManager.sol | 1 | **** | 79 | 79 | 51 | 11 | 34 | **** |
| 📝 | /src/lib/pools/LidoEthBaseInterestAllocator.sol | 1 | **** | 173 | 173 | 134 | 14 | 97 | **<abbr title='Payable Functions'>💰</abbr><abbr title='Initiates ETH Value Transfer'>📤</abbr>** |
| 📝 | /src/lib/pools/Pool.sol | 1 | **** | 766 | 731 | 507 | 164 | 369 | **<abbr title='create/create2'>🌀</abbr><abbr title='Unchecked Blocks'>Σ</abbr>** |
| 📝 | /src/lib/pools/PoolOfferHandler.sol | 1 | **** | 170 | 155 | 114 | 36 | 52 | **** |
| 📝 | /src/lib/pools/WithdrawalQueue.sol | 1 | **** | 145 | 145 | 82 | 35 | 49 | **** |
| 📚 | /src/lib/utils/BytesLib.sol | 1 | **** | 95 | 95 | 50 | 29 | 140 | **<abbr title='Uses Assembly'>🖥</abbr>** |
| 📚 | /src/lib/utils/Hash.sol | 1 | **** | 200 | 196 | 169 | 10 | 64 | **<abbr title='Uses Hash-Functions'>🧮</abbr><abbr title='Unchecked Blocks'>Σ</abbr>** |
| 📚 | /src/lib/utils/Interest.sol | 1 | **** | 39 | 39 | 30 | 1 | 12 | **<abbr title='Unchecked Blocks'>Σ</abbr>** |
| 🎨 | /src/lib/utils/TwoStepOwned.sol | 1 | **** | 48 | 48 | 31 | 7 | 22 | **** |
| 📚 | /src/lib/utils/ValidatorHelpers.sol | 1 | **** | 82 | 79 | 49 | 23 | 108 | **<abbr title='Uses Assembly'>🖥</abbr>** |
| 🎨 | /src/lib/utils/WithProtocolFee.sol | 1 | **** | 86 | 86 | 54 | 15 | 31 | **** |
| 📝📚🎨 | **Totals** | **28** | **** | **5243**  | **4967** | **3669** | **774** | **2473** | **<abbr title='Uses Assembly'>🖥</abbr><abbr title='Payable Functions'>💰</abbr><abbr title='Initiates ETH Value Transfer'>📤</abbr><abbr title='DelegateCall'>👥</abbr><abbr title='Uses Hash-Functions'>🧮</abbr><abbr title='create/create2'>🌀</abbr><abbr title='Unchecked Blocks'>Σ</abbr>** |

##### <span>Legend</span>
<ul>
<li> <b>Lines</b>: total lines of the source unit </li>
<li> <b>nLines</b>: normalized lines of the source unit (e.g. normalizes functions spanning multiple lines) </li>
<li> <b>SLOC</b>: source lines of code</li>
<li> <b>Comment Lines</b>: lines containing single or block comments </li>
<li> <b>Complexity Score</b>: a custom complexity score derived from code statements that are known to introduce code complexity (branches, loops, calls, external interfaces, ...) </li>
</ul>

### <span id=t-out-of-scope>Out of Scope</span>

### <span id=t-out-of-scope-excluded-source-units>Excluded Source Units</span>
Source Units Excluded: **`58`**

| File |
| ---- |
| /test/validators/RangeValidator.t.sol |
| /test/validators/NftPackedListValidator.t.sol |
| /test/validators/NftBitVectorValidator.t.sol |
| /test/utils/USDCSampleToken.sol |
| /test/utils/SampleToken.sol |
| /test/utils/SampleOldCollection.sol |
| /test/utils/SampleMarketplace.sol |
| /test/utils/SampleCollection.sol |
| /test/utils/MockedLido.sol |
| /test/utils/MockedCurve.sol |
| /test/utils/MockedAave.sol |
| /test/pools/WithdrawalQueue.t.sol |
| /test/pools/PoolOfferHandler.t.sol |
| /test/pools/Pool.t.sol |
| /test/pools/LidoEthBaseInterestAllocator.t.sol |
| /test/pools/FeeManager.t.sol |
| /test/pools/AaveUsdcBaseInterestAllocator.t.sol |
| /test/loans/TestLoanSetup.sol |
| /test/loans/MultiSourceLoanTestExtra.t.sol |
| /test/loans/MultiSourceLoan.t.sol |
| /test/loans/MultiSourceCommons.sol |
| /test/callbacks/PurchaseBundler.t.sol |
| /test/UserVault.t.sol |
| /test/TestNFTFlashAction.sol |
| /test/MultiSourceGas.t.sol |
| /test/LiquidationDistributor.t.sol |
| /test/AuctionWithBuyoutLoanLiquidator.t.sol |
| /test/AuctionLoanLiquidator.t.sol |
| /test/AddressManager.t.sol |
| /src/lib/validators/RangeValidator.sol |
| /src/lib/validators/NftPackedListValidator.sol |
| /src/lib/validators/NftBitVectorValidator.sol |
| /src/interfaces/validators/IOfferValidator.sol |
| /src/interfaces/pools/IPoolWithWithdrawalQueues.sol |
| /src/interfaces/pools/IPoolOfferHandler.sol |
| /src/interfaces/pools/IPool.sol |
| /src/interfaces/pools/IFeeManager.sol |
| /src/interfaces/pools/IBaseInterestAllocator.sol |
| /src/interfaces/loans/IMultiSourceLoan.sol |
| /src/interfaces/loans/ILoanManagerRegistry.sol |
| /src/interfaces/loans/ILoanManager.sol |
| /src/interfaces/loans/IBaseLoan.sol |
| /src/interfaces/external/IWrappedPunk.sol |
| /src/interfaces/external/IReservoir.sol |
| /src/interfaces/external/ILido.sol |
| /src/interfaces/external/ICurve.sol |
| /src/interfaces/external/ICryptoPunksMarket.sol |
| /src/interfaces/external/IAaveLendingPool.sol |
| /src/interfaces/callbacks/IPurchaseBundler.sol |
| /src/interfaces/callbacks/ILoanCallback.sol |
| /src/interfaces/IUserVault.sol |
| /src/interfaces/IOldERC721.sol |
| /src/interfaces/INFTFlashAction.sol |
| /src/interfaces/IMulticall.sol |
| /src/interfaces/ILoanLiquidator.sol |
| /src/interfaces/ILiquidationHandler.sol |
| /src/interfaces/ILiquidationDistributor.sol |
| /src/interfaces/IAuctionLoanLiquidator.sol |

## <span id=t-report>Report</span>

## Overview

The analysis finished with **`0`** errors and **`0`** duplicate files.





### <span style="font-weight: bold" id=t-inline-documentation>Inline Documentation</span>

- **Comment-to-Source Ratio:** On average there are`4.74` code lines per comment (lower=better).
- **ToDo's:** `5`

### <span style="font-weight: bold" id=t-components>Components</span>

| 📝Contracts   | 📚Libraries | 🔍Interfaces | 🎨Abstract |
| ------------- | ----------- | ------------ | ---------- |
| 14 | 4  | 0  | 10 |

### <span style="font-weight: bold" id=t-exposed-functions>Exposed Functions</span>

This section lists functions that are explicitly declared public or payable. Please note that getter methods for public stateVars are not included.

| 🌐Public   | 💰Payable |
| ---------- | --------- |
| 166 | 6  |

| External   | Internal | Private | Pure | View |
| ---------- | -------- | ------- | ---- | ---- |
| 157 | 194  | 64 | 29 | 78 |

### <span style="font-weight: bold" id=t-statevariables>StateVariables</span>

| Total      | 🌐Public  |
| ---------- | --------- |
| 158  | 60 |

### <span style="font-weight: bold" id=t-capabilities>Capabilities</span>

| Solidity Versions observed | 🧪 Experimental Features | 💰 Can Receive Funds | 🖥 Uses Assembly | 💣 Has Destroyable Contracts |
| -------------------------- | ------------------------ | -------------------- | ---------------- | ---------------------------- |
| `^0.8.21` |  | `yes` | `yes` <br/>(4 asm blocks) | **** |

| 📤 Transfers ETH | ⚡ Low-Level Calls | 👥 DelegateCall | 🧮 Uses Hash Functions | 🔖 ECRecover | 🌀 New/Create/Create2 |
| ---------------- | ----------------- | --------------- | ---------------------- | ------------ | --------------------- |
| `yes` | **** | `yes` | `yes` | **** | `yes`<br>→ `NewContract:WithdrawalQueue` |

| ♻️ TryCatch | Σ Unchecked |
| ---------- | ----------- |
| **** | `yes` |

### <span style="font-weight: bold" id=t-package-imports>Dependencies / External Imports</span>

| Dependency / Import Path | Count  |
| ------------------------ | ------ |
| @delegate/IDelegateRegistry.sol | 1 |
| @forge-std/console.sol | 1 |
| @openzeppelin/interfaces/IERC1271.sol | 1 |
| @openzeppelin/utils/Strings.sol | 2 |
| @openzeppelin/utils/cryptography/ECDSA.sol | 1 |
| @openzeppelin/utils/cryptography/MessageHashUtils.sol | 1 |
| @openzeppelin/utils/structs/EnumerableSet.sol | 2 |
| @seaport/seaport-types/src/lib/ConsiderationStructs.sol | 1 |
| @solmate/auth/Owned.sol | 12 |
| @solmate/tokens/ERC20.sol | 6 |
| @solmate/tokens/ERC4626.sol | 1 |
| @solmate/tokens/ERC721.sol | 7 |
| @solmate/tokens/WETH.sol | 3 |
| @solmate/utils/FixedPointMathLib.sol | 11 |
| @solmate/utils/ReentrancyGuard.sol | 6 |
| @solmate/utils/SafeTransferLib.sol | 7 |


##### Contract Summary

```
Error: extraneous input 'queueIndex' expecting '=>' (98:20)
```
____

