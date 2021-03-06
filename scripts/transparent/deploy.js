const hardhat = require('hardhat');
const { ethers, upgrades } = hardhat;

const COUNTER = 1;
async function main() {
  
  const ProxyFactory = await ethers.getContractFactory(
    'TransparentCounter',
  );

  // Deploy contract proxy
  const proxy = await upgrades.deployProxy(ProxyFactory,
    [
      COUNTER
    ],
    {
      initializer: '__Counter_init'
    });
  const counter = await proxy.deployed();

  console.log("counter contract address at: ", counter.address);

}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });