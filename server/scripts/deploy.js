const { ethers } = require("hardhat");

async function main() {
  const Transactions = await ethers.getContractFactory("Transactions");

  console.log("Deploying Transactions contract...");
  const transactions = await Transactions.deploy();
  await transactions.deployed();

  console.log("Transactions contract deployed to:", transactions.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
});
