// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Coins.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract UserCoin is Coins {
    mapping(address => mapping(bytes32 => uint256)) public userBalances;

    function Deposit(
        address ticker,
        address sender,
        address recipient,
        uint256 amount
    ) public payable {
        // Find Token Address
        // address tokenAddress = super.GetTokenAddress(ticker);
        // Check User Amount
        IERC20(ticker).approve(sender, amount);
        // Transfer Token To User
        IERC20(ticker).transferFrom(sender, recipient, amount);
        // Add Amout To User Balances
        // userBalances[recipient][ticker] += amount;
    }

    function Withdraw(
        bytes32 ticker,
        address sender,
        uint256 amount
    ) public {
        // Check User Balance
        require(userBalances[sender][ticker] >= amount, "balance too low");
        // Find Token Address
        address tokenAddress = super.GetTokenAddress(ticker);
        // Check User Amount
        IERC20(tokenAddress).approve(sender, amount);
        // Transfer Token To User
        IERC20(tokenAddress).transfer(sender, amount);
        // Add Amout To User Balances
        userBalances[sender][ticker] -= amount;
    }

    function ContractAddress() public view returns (address) {
        return address(this);
    }
}
