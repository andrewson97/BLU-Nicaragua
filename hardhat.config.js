require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();
require("@nomicfoundation/hardhat-verify");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  networks: {
    // etherlinkTest: {
    //   url: "https://node.ghostnet.etherlink.com",
    //   accounts: [process.env.NMY_PRIVATE_KEY],
    // },
    sepolia:{
      url: process.env.INFURA_SEPOLIA_URL,
      accounts: [process.env.MY_PRIVATE_KEY],
    }
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY
  }
};