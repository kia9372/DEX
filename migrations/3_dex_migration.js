
const dex = artifacts.require("Dex");

module.exports = async function (deployer) {

  await  deployer.deploy(dex);

}