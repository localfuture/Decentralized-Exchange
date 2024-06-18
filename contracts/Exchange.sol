// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Exchange is ERC20 {
    IERC20 public token;

    constructor(address token) ERC("PoolToken","PL") {
        token = IERC20(token);
    }

    /*
     * @dev addLiquidity allows users to add liquidity to the exchange
     * @return Returns the amount of LP tokens to mint
     */
    function addLiquidity(uint amountOfToken) public payable {#
        if (msg.value == 0 && amountOfToken > 0) {
            token.transferFrom(msg.sender, address(this), amountOfToken);
            _mint(msg.sender, amountOfToken);
        } else {
            _mint(msg.sender, msg.value);
        }
    }

    /*
     * @dev removeLiquidity allows users to remove liquidity from the exchange
     * @param amountOfLPTokens - amount of LP tokens user wants to burn to get back ETH and TOKEN
     * @return Returns the amount to ETH and tokens to be returned to the user
     */
    function removeLiquidity(uint256 amountOfLPTokens) public {
        _update(msg.sender, address(0), amountOfLPTokens);
    }

    /**
     * @dev ethToTokenSwap allows users to swap ETH for TOKEN
     */
    function ethToTokenSwap() external payable {
        token.transfer(msg.sender, msg.value);
    }

    /**
     * @dev tokenToEthSwap allows users to swap TOKEN for ETH
     */
    function tokenToEthSwap(uint256 tokensToSwap) public {
        token.transferFrom(msg.sender, address(this), tokensToSwap);

        payable(msg.sender).send(tokensToSwap);
    }

    /**
     * @dev getLPTokensToMint returns the amount of LP Tokens to be minted after addLiquidity has been called.
     * @notice Only called just after addLiquidity, if it is successful.
     * @return returns the LP Tokens to be minted to the liquidity provider
     */
    function getLPTokensToMint() public view returns (uint256) {
        // calculation required
    }

    /**
     * @dev getEthAndTokenToReturn returns the amount of ETH and Token that needs to be returned to the user when removeLiquidity is called.
     * @return returns the amount of ETH and Token to be returned to the user when removeLiquidity is called.
     * @notice only called just after removeLiquidity, if it is successful.
     */
    function getEthAndTokenToReturn() public view returns (uint256, uint256) {}

    /**
     * @dev getReserve returns the balanace of 'token' held by this contract
     */
    function getReserve() public view returns (uint256) {}
}
