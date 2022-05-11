require("@nomiclabs/hardhat-ethers");
require("@openzeppelin/hardhat-upgrades");
require("@nomiclabs/hardhat-etherscan");

require("dotenv").config();

module.exports = {
 solidity: "0.8.10",
 networks: {
  bscTestnet: {
    url: "https://data-seed-prebsc-1-s1.binance.org:8545/",
    accounts: ["b55bf1231df2547eadeef874047d45e6e4c2cec4d3060b9873a22f046753c95a"],
    // gas: 2100000,
    // gasPrice: 8000000000
  },
 },
 etherscan: {
   apiKey: "WHI1P19FSH31QTTFZFQRBA2J49UDQ9RDKE"
 },
};