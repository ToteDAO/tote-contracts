const hre = require("hardhat");
const ContractJson = require("../artifacts/contracts/TOTE.sol/TOTE.json")
const abi = ContractJson.abi;

async function main() {
    const alchemy = new hre.ethers.providers.AlchemyProvider(
        'maticmum',
        process.env.ALCHEMY_API_KEY
    );

    const userWallet = new hre.ethers.Wallet(process.env.PRIVATE_KEY, alchemy);

    const tote_instance = new hre.ethers.Contract(
        process.env.TOTE_CONTRACT_ADDRESS,
        abi,
        userWallet
    );


    console.log("Initial supply: " + await tote_instance.totalSupply());

    const Txn1 = await tote_instance.mintMinerReward(10, { gasLimit: 3000000 });
    await Txn1.wait();

    console.log("New supply: " + await tote_instance.totalSupply());
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
