const hre = require("hardhat");
const fs = require("fs");

async function main() {
  const rPizza = await hre.ethers.getContractFactory("rPizza");
  const pizza = await rPizza.deploy();
  await pizza.deployed();

  const rawProxy = await hre.ethers.getContractFactory("rawProxy");
  const raw = await rawProxy.deploy(pizza.address);
  await raw.deployed();

  console.log("rPizza deployed at:", pizza.address, " ");
  console.log("proxy deplyed at:", raw.address, " ");

 
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
