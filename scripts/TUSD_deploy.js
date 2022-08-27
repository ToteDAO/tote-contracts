const hre = require("hardhat");

async function main() {
    const TUSD = await hre.ethers.getContractFactory("TUSD");
    const tusd_instance = await TUSD.deploy(500000);

    await tusd_instance.deployed();

    console.log("TUSD deployed to: ", tusd_instance.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
