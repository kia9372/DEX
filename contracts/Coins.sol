// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Coins {
    struct Token {
        bytes32 ticker;
        address tickerAddress;
        address chainLinkAddress;
    }

    mapping(bytes32 => Token) public toknes;
    bytes32[] public tokenList;

    function AddToken(
        bytes32 ticker,
        address tickerAddress,
        address chainLinkAddress
    ) public {
        toknes[ticker] = Token(ticker, tickerAddress, chainLinkAddress);
        tokenList.push(ticker);
    }

    function GetTokenAddress(bytes32 ticker) public view returns (address) {
        return toknes[ticker].tickerAddress;
    }
}
