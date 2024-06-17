# Decentralized Exchange (DEX)

This project implements a decentralized exchange (DEX) inspired by Uniswap V1. The DEX allows for on-chain trading of an ERC-20 token and ETH, enables liquidity provision, LP token management, and fee-charged swaps.

## Features

1. **Liquidity Provision**:
   - Users can add liquidity by depositing ETH and ERC-20 tokens into the exchange.
   - LP (Liquidity Provider) tokens are minted to represent the user's share of the pool.

2. **Swapping Mechanism**:
   - The DEX charges a 1% fee on swaps.
   - Supports swapping ETH to TOKEN and TOKEN to ETH.

3. **Constant Product Formula**:
   - Exchange rate determination and liquidity provision utilize the constant product formula: x * y = k, where x and y are the amounts of token X and token Y in the pool.

## Functions Implemented

- **constructor(address token)**: Initializes the DEX with the address of a pre-deployed ERC-20 token.
  
- **addLiquidity(uint256 amountOfToken)**: Allows users to add liquidity (ETH and ERC-20 tokens) to the pool and mints LP tokens for the liquidity provider.

- **removeLiquidity(uint256 amountOfLPTokens)**: Enables users to remove liquidity from the exchange based on the amount of LP tokens they hold.

- **ethToTokenSwap()**: Swaps ETH for TOKEN for any user, charging a 1% fee.

- **tokenToEthSwap(uint256 tokensToSwap)**: Swaps TOKEN for ETH for any user, charging a 1% fee.

- **getLPTokensToMint()**: Returns the amount of LP tokens to be minted to the liquidity provider after `addLiquidity` has been called.

- **getEthAndTokenToReturn()**: Returns the amount of ETH and TOKEN to be returned to the user after `removeLiquidity` has been called.

- **getReserve()**: Returns the total reserve of TOKEN in the pool.

- **getBalance(address user)**: Returns the amount of LP tokens a specific user has.

## How to Use

1. **Deploy the Smart Contract**:
   - Deploy the DEX smart contract providing the address of the pre-deployed ERC-20 token.

2. **Interact with the Contract**:
   - Use any Ethereum wallet or contract interaction tool (like Remix, Truffle, etc.) to interact with the deployed contract.
   - Call functions like `addLiquidity`, `removeLiquidity`, `ethToTokenSwap`, `tokenToEthSwap` to trade or provide liquidity.

3. **Fees**:
   - Note that swaps (both `ethToTokenSwap` and `tokenToEthSwap`) incur a 1% fee, which is implemented within the contract logic.

## Implementation Notes

- Ensure the ERC-20 token provided during contract deployment is compatible and has necessary functions for transfer and approval.
- The contract follows the constant product formula for determining exchange rates and maintaining liquidity ratios.
- LP tokens represent the user's share of the liquidity pool and can be used to withdraw proportional amounts of ETH and TOKEN.

## Disclaimer

- This project is educational and may require adjustments for production use.
- Ensure thorough testing and security audits before deploying in a live environment.

