const hre = require("hardhat");
const fs = require("fs");

async function main() {
  const ImplFactory = await hre.ethers.getContractFactory("RawCounter");
  const counter = await ImplFactory.deploy();
  await counter.deployed();

  const rawProxy = await hre.ethers.getContractFactory("rawProxy");
  const proxy = await rawProxy.deploy(pizza.address);
  await proxy.deployed();

  console.log("Proxy Contract is deployed at:", raw.address, " ");
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
