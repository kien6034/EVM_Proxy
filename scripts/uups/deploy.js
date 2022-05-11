const hardhat = require('hardhat');
const { ethers, upgrades } = hardhat;

const COUNTER = 1;
async function main() {
  const ProxyFactory = await ethers.getContractFactory(
    'UupsCounter',
  );

  // Deploy contract proxy
  const proxy = await upgrades.deployProxy(ProxyFactory,
    [
      COUNTER
    ],
    {
      initializer: 'initialize'
    },
    {
        kind: "uups"
    });
  const counter = await proxy.deployed();

  console.log("uups counter proxy deloyed at: ", counter.address);

}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });