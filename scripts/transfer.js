const hre = require("hardhat");

async function main() {
    const Transfer = await hre.ethers.getContractFactory("transfer");
    const transfer = await Transfer.deploy();
  
    await transfer.deployed();
  
    console.log(
      `Contract deployed to ${transfer.address}`
    );
  }
  
  main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });