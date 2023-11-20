require("@nomicfoundation/hardhat-chai-matchers");
require("@nomiclabs/hardhat-ethers");
require('@openzeppelin/hardhat-upgrades');
require('hardhat-dependency-compiler');

module.exports = {
    networks: {
      hardhat: {
        allowUnlimitedContractSize: true
      }
    },
    solidity: {
      compilers: [
        { version: "0.8.16" },
        { version: "0.7.6" },
        { version: "0.6.6" }
      ]
    },
    dependencyCompiler: {
      paths: [
        'solmate/src/tokens/WETH.sol',
      ],
    }
}