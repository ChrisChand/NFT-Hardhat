const hre = require("hardhat");
const { BLOCKCHAIN } = require('../config')

async function main() {

const BoreToken = await hre.ethers.getContractFactory("BoreToken");
const baseTokenURI = "https://gateway.pinata.cloud/ipfs/"
const DeployBoreToken = await BoreToken.deploy(BLOCKCHAIN.ADMIN_ADDRESS, baseTokenURI)
await DeployBoreToken.waitForDeployment()
console.log("Deployed Bored NFT Token Address:--", await DeployBoreToken.getAddress())

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
