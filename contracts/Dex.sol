// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
// import "./UserCoins.sol";

 contract Dex  {
    constructor() {}

    // function addToken(
    //     bytes32 ticker,
    //     address tickerAddress,
    //     address chainLinkAddress
    // ) external {
    //     AddToken(ticker, tickerAddress, chainLinkAddress);
    // }

    function deposit(
        address ticker,
        address sender,
        address recipient,
        uint256 amount
    ) external payable  {
        // Transfer Token To User
        IERC20(ticker).transferFrom(sender, recipient, amount);

    }

    // function withdraw(
    //     bytes32 ticker,
    //     address sender,
    //     uint256 amount
    // ) external {
    //     Withdraw(ticker, sender, amount);
    // }

    // function userCoinontractAddreess() external view returns (address) {
    //     return ContractAddress();
    // }

    function dexCoinontractAddreess() external view returns (address) {
        return address(this);
    }
}
