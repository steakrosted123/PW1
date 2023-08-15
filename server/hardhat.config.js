require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity: "0.8.18",
  networks: {
    ganache: {
      url: "HTTP://127.0.0.1:7545",
      chainId: 5777,
      gas: "auto",
      gasPrice: "auto",
      
    }
  }
};
