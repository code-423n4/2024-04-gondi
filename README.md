# Gondi Invitational audit details

- Total Prize Pool: $74,600 in USDC
  - HM awards: $45,400 in USDC
  - Analysis awards: $2,500 USDC
  - QA awards: $1,300 in USDC
  - Gas awards: $1,300 in USDC
  - Judge awards: $10,460 in USDC
  - Scout awards: $500 in USDC
  - Mitigation Review: $13,140 in USDC (*Opportunity goes to top 3 certified wardens based on placement in this audit.*)
- Join [C4 Discord](https://discord.gg/code4rena) to register
- Submit findings [using the C4 form](https://code4rena.com/contests/2024-04-gondi/submit)
- [Read our guidelines for more details](https://docs.code4rena.com/roles/wardens)
- Starts April 8, 2024 20:00 UTC
- Ends April 16, 2024 20:00 UTC

## This is a Private audit

This audit repo and its Discord channel are accessible to **certified wardens only.** Participation in private audits is bound by:

1. Code4rena's [Certified Contributor Terms and Conditions](https://github.com/code-423n4/code423n4.com/blob/main/_data/pages/certified-contributor-terms-and-conditions.md)
2. C4's [Certified Contributor Code of Professional Conduct](https://code4rena.notion.site/Code-of-Professional-Conduct-657c7d80d34045f19eee510ae06fef55)

*All discussions regarding private audits should be considered private and confidential, unless otherwise indicated.*

## Automated Findings / Publicly Known Issues

The 4naly3er report can be found [here](https://github.com/code-423n4/2024-04-gondi/blob/main/4naly3er-report.md).

*Note for C4 wardens: Anything included in this `Automated Findings / Publicly Known Issues` section is considered a publicly known issue and is ineligible for awards.*

If the owner of the pool or PoolUnderwriter are compromised, then pools could be drained by setting underwriting terms against worthless NFTs.
The security of those wallets is in a separate layer (multi-sig / governor contract) and should not be considered.

# Overview

Gondi is a decentralized non-custodial NFT lending protocol that offers the most flexible and capital efficient primitive.  
Gondi loans allows borrowers to access liquidity and obtain the best marginal rate when available as well as allow lenders to earn yield on their capital with the flexibility of entering and exiting their position any moment without affecting borrowers' loans.
Gondi V3 loan offers are submitted from both protocol pools as well as peers market participants creating deep liquidity as well as precise risk pricing..

## Links

- **Documentation:** <https://app.gitbook.com/invite/4HJV0LcOOnJ7AVJ77p8e/KW6r5CM24fuLQn0gSSXQ>
- **Previous audits:** <https://app.gitbook.com/o/4HJV0LcOOnJ7AVJ77p8e/s/W2WSJrV6PSLWo4p8vIGq/security-and-audits>
- **Website:** <https://www.gondi.xyz/>
- **X/Twitter:** <https://twitter.com/gondixyz>
- **Discord:** <https://discord.gg/HJc7zpTT>

# Scope

*See [scope.txt](https://github.com/code-423n4/2024-04-gondi/blob/main/scope.txt)*

### Files in scope

File                                             | Logic Contracts |  Lines    | nLines   | SLOC     |
------------------------------------------------ | --------------- |  -------- | -------- | -------- |
/src/lib/AddressManager.sol                      | 1               |  100      | 100      | 61       |
/src/lib/AuctionLoanLiquidator.sol               | 1               |  336      | 321      | 241      |
/src/lib/AuctionWithBuyoutLoanLiquidator.sol     | 1               |  133      | 124      | 93       |
/src/lib/InputChecker.sol                        | 1               |  15       | 15       | 9        |
/src/lib/LiquidationDistributor.sol              | 1               |  123      | 111      | 106      |
/src/lib/LiquidationHandler.sol                  | 1               |  115      | 112      | 77       |
/src/lib/Multicall.sol                           | 1               |  22       | 22       | 15       |
/src/lib/UserVault.sol                           | 1               |  376      | 355      | 271      |
/src/lib/callbacks/CallbackHandler.sol           | 1               |  84       | 75       | 53       |
/src/lib/callbacks/PurchaseBundler.sol           | 1               |  320      | 308      | 247      |
/src/lib/loans/BaseLoan.sol                      | 1               |  216      | 216      | 117      |
/src/lib/loans/BaseLoanHelpers.sol               | 1               |  39       | 23       | 25       |
/src/lib/loans/LoanManager.sol                   | 1               |  161      | 136      | 105      |
/src/lib/loans/LoanManagerRegistry.sol           | 1               |  31       | 31       | 20       |
/src/lib/loans/MultiSourceLoan.sol               | 1               |  1155     | 1058     | 864      |
/src/lib/loans/WithLoanManagers.sol              | 1               |  29       | 29       | 19       |
/src/lib/pools/AaveUsdcBaseInterestAllocator.sol | 1               |  105      | 105      | 75       |
/src/lib/pools/FeeManager.sol                    | 1               |  79       | 79       | 51       |
/src/lib/pools/LidoEthBaseInterestAllocator.sol  | 1               |  173      | 173      | 134      |
/src/lib/pools/Pool.sol                          | 1               |  766      | 731      | 507      |
/src/lib/pools/PoolOfferHandler.sol              | 1               |  170      | 155      | 114      |
/src/lib/pools/WithdrawalQueue.sol               | 1               |  145      | 145      | 82       |
/src/lib/utils/BytesLib.sol                      | 1               |  95       | 95       | 50       |
/src/lib/utils/Hash.sol                          | 1               |  200      | 196      | 169      |
/src/lib/utils/Interest.sol                      | 1               |  39       | 39       | 30       |
/src/lib/utils/TwoStepOwned.sol                  | 1               |  48       | 48       | 31       |
/src/lib/utils/ValidatorHelpers.sol              | 1               |  82       | 79       | 49       |
/src/lib/utils/WithProtocolFee.sol               | 1               |  86       | 86       | 54       |
**Totals**                                       | **28**          |  **5243** | **4967** | **3669** |

### Files out of scope

*See [out_of_scope.txt](https://github.com/code-423n4/2024-04-gondi/blob/main/out_of_scope.txt)*

## Scoping Q &amp; A

### General questions

| Question                                | Answer                       |
| --------------------------------------- | ---------------------------- |
| ERC20 used by the protocol              |       USDC / WETH             |
| Test coverage                           | 77.11%                         |
| ERC721 used  by the protocol            |            🖊️              |
| Chains the protocol will be deployed on | Ethereum |

### ERC20 token behaviors in scope

| Question                                                                                                                                                   | Answer |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------- | ------ |
| [Missing return values](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#missing-return-values)                                                      |   No  |
| [Fee on transfer](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#fee-on-transfer)                                                                  |  No  |
| [Balance changes outside of transfers](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#balance-modifications-outside-of-transfers-rebasingairdrops) | No    |
| [Upgradeability](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#upgradable-tokens)                                                                 |   No  |
| [Flash minting](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#flash-mintable-tokens)                                                              | No    |
| [Pausability](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#pausable-tokens)                                                                      | No    |
| [Approval race protections](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#approval-race-protections)                                              | No    |
| [Revert on approval to zero address](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#revert-on-approval-to-zero-address)                            | No    |
| [Revert on zero value approvals](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#revert-on-zero-value-approvals)                                    | No    |
| [Revert on zero value transfers](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#revert-on-zero-value-transfers)                                    | No    |
| [Revert on transfer to the zero address](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#revert-on-transfer-to-the-zero-address)                    | No    |
| [Revert on large approvals and/or transfers](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#revert-on-large-approvals--transfers)                  | No    |
| [Doesn't revert on failure](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#no-revert-on-failure)                                                   |  Yes   |
| [Multiple token addresses](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#revert-on-zero-value-transfers)                                          | Yes    |
| [Low decimals ( < 6)](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#low-decimals)                                                                 |   No  |
| [High decimals ( > 18)](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#high-decimals)                                                              | No    |
| [Blocklists](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#tokens-with-blocklists)                                                                | No    |

### External integrations (e.g., Uniswap) behavior in scope

| Question                                                  | Answer |
| --------------------------------------------------------- | ------ |
| Enabling/disabling fees (e.g. Blur disables/enables fees) | No   |
| Pausability (e.g. Uniswap pool gets paused)               |  No   |
| Upgradeability (e.g. Uniswap gets upgraded)               |   No  |

# Additional context

## Main invariants

- While a loan is outstanding, MultiSourceLoan must own the collateral.

## Attack ideas (where to focus for bugs)

Security of collateral in MultiSourceLoan.
Pool accounting and potential exploits.

## All trusted roles in the protocol

Owner of Pool (this will be a Governor contract) will update the PoolUnderwriter/base rate strategy.

| Role                                | Description                       |
| --------------------------------------- | ---------------------------- |
| Owner of Pool                          | This will be a Governor contract that will update the PoolUnderwriter/base rate strategy.               |

## Running tests

```bash
git clone --recurse https://github.com/code-423n4/2024-04-gondi
git submodule update --init --recursive
```

To run code coverage

```bash
forge coverage --ir-minimum
```

To run gas benchmarks

```bash
forge test --gas-report
```

To run Slither (*See [slither.txt](https://github.com/code-423n4/2024-04-gondi/blob/main/slither.txt)*)

```bash
slither .
```

✅ SCOUTS: Add a screenshot of your terminal showing the gas report
✅ SCOUTS: Add a screenshot of your terminal showing the test coverage

## Miscellaneous

Employees for this sponsor and employees' family members are ineligible to participate in this audit.
