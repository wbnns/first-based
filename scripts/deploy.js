const hre = require("hardhat");

async function main() {
/*    const MetadataRenderer = await hre.ethers.getContractFactory("MetadataRenderer");
    console.log("Deploying MetadataRenderer...");

    try {
        const metadataRenderer = await MetadataRenderer.deploy();

        // Wait for the deployment transaction to be mined
        await metadataRenderer.waitForDeployment();

        console.log("MetadataRenderer deployed to:", metadataRenderer.target);
    } catch (error) {
        console.error("Error deploying MetadataRenderer:", error);
        return;
    }
*/
    // Deploying FirstBased
    console.log("Deploying FirstBased...");
    const FirstBased = await hre.ethers.getContractFactory("FirstBased");
    const firstBased = await FirstBased.deploy("First & Based", "1ST", "0xa92EFe63a8Fd97B08001f6574728E376168Cb176");

    if (!firstBased.target) {
        console.error("Failed to deploy FirstBased");
        return;
    }
    console.log("FirstBased deployed to:", firstBased.target);
}

main().then(() => process.exit(0)).catch(error => {
    console.error(error);
    process.exit(1);
});

