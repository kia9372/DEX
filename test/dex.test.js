const assert = require("assert");

const Dex = artifacts.require("Dex");

contract("Dex", (accounts) => {

    let dex;
    let contractOwner = null;
    let buyer = null;

    beforeEach(async () => {
        contractOwner = accounts[0];
        buyer = accounts[1];

        dex = await Dex.new();
        contractOwner = accounts[0];
        // sometimes you need to test a user except contract owner
        buyer = accounts[1];
    });

    // it("Add tokens and contract address Success", async () => {

    //     const tokenInfo = await dex.getTokenContractAddress("USDT");

    //     assert(tokenInfo == "0xdac17f958d2ee523a2206206994597c13d831ec7");
    // })

    // it("Add Token", async () => {

    //     await dex.addToken(web3.utils.fromAscii("LINK"), "0xa36085f69e2889c224210f603d836748e7dc0088", "0xa36085f69e2889c224210f603d836748e7dc0088")


    // })
    it("Deposit", async () => {

        await dex.deposit("0xa36085f69e2889c224210f603d836748e7dc0088", "0x5226a51522C23CcBEFd04a2d4C6c8e281eD1d680", "0xB643992c9fBcb1Cb06b6C9eb278b2ac35e6a2711", 1,
            // you were missing this
            { from: accounts[0] });

    })



})