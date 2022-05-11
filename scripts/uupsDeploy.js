const { ethers, upgrades } = require("hardhat");

const SLICES = 8;
async function main() {
 const Pizza = await ethers.getContractFactory("uPizza");

 console.log("Deploying Pizza...");

 const pizza = await upgrades.deployProxy(Pizza, [], {
   initializer: "initialize",
 }, {kind: 'uups'});
 await pizza.deployed();

 console.log("Pizza deployed to:", pizza.address);
}

main();