// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// import "./UserCoins.sol";

contract Dex {
    event Approval(
        address indexed tokenOwner,
        address indexed spender,
        uint256 tokens
    );
    event Transfer(address indexed from, address indexed to, uint256 tokens);

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
    ) external payable {
        IERC20 token = IERC20(ticker);
        IERC20(ticker).approve(sender, amount);
        // Transfer Token To User
        token.transferFrom(sender, recipient, amount);
        emit Transfer(sender, recipient, amount);
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
