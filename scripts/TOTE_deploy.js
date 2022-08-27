const hre = require("hardhat");

async function main() {
    const TOTE = await hre.ethers.getContractFactory("TOTE");
    const tote_instance = await TOTE.deploy(1000000000);

    await tote_instance.deployed();

    console.log("TOTE deployed to: ", tote_instance.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
