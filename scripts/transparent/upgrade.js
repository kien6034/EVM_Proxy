const hardhat = require('hardhat');
const { ethers, upgrades } = hardhat;
const fs = require("fs");


async function main() {
    const file = fs.readFileSync('./.openzeppelin/unknown-97.json');
    const data = JSON.parse(file); 

    if (!data || !data.admin || !data.proxies){
        console.log("INVALID DATA: please check the corresponding config file");
        process.exit(1);
    }
    
    const CounterV2 = await ethers.getContractFactory("TransparentCounter");
    await upgrades.upgradeProxy(data.proxies.at(-1)["address"], CounterV2);
    console.log("Proxy upgraded");
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });