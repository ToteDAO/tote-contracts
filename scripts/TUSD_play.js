const hre = require("hardhat");
const ContractJson = require("../artifacts/contracts/TUSD.sol/TUSD.json")
const abi = ContractJson.abi;

async function main() {
    const alchemy = new hre.ethers.providers.AlchemyProvider(
        'maticmum',
        process.env.ALCHEMY_API_KEY
    );

    const userWallet = new hre.ethers.Wallet(process.env.PRIVATE_KEY, alchemy);

    const tusd_instance = new hre.ethers.Contract(
        process.env.TUSD_CONTRACT_ADDRESS,
        abi,
        userWallet
    );


    console.log("Initial supply: " + await tusd_instance.totalSupply());

    const Txn1 = await tusd_instance.mintMinerReward(10, { gasLimit: 3000000 });
    await Txn1.wait();

    console.log("New supply: " + await tusd_instance.totalSupply());
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
