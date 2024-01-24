# First & Based

    _______           __                     __   ____                      __
   / ____(_)_________/ /_   ____ _____  ____/ /  / __ )____ _________  ____/ /
  / /_  / / ___/ ___/ __/  / __ `/ __ \/ __  /  / __  / __ `/ ___/ _ \/ __  / 
 / __/ / / /  (__  ) /_   / /_/ / / / / /_/ /  / /_/ / /_/ (__  )  __/ /_/ /  
/_/   /_/_/  /____/\__/   \__,_/_/ /_/\__,_/  /_____/\__,_/____/\___/\__,_/   
                                                                              

Be the first person to mint a unique NFT in each new block on Base

## Overview

First & Based is an generative NFT collection experiment, where each NFT represents a unique Base block. The uniqueness is enforced by tying the NFT's identifier (token ID) directly to the Base block number at the time of minting. This creates an exclusive opportunity for users to claim a specific block's NFT.

## Contracts

### `FirstBased.sol`

- An ERC-721 NFT contract where each token represents a unique Base block.
- The contract allows for the minting of NFTs, where each token is associated with the block number as its unique identifier.
- Inherits from OpenZeppelin's `ERC721` and `Ownable`.

### `MetadataRenderer.sol`

- A contract that implements the `IMetadataRenderer` interface.
- Responsible for generating on-chain SVG images and metadata for each `FirstBased` NFT.
- SVG images include the phrase "1ST ONCHAIN" followed by the Ethereum block number at which the NFT is minted.

### `IMetadataRenderer.sol`

- An interface outlining the functions for a metadata renderer, used by `FirstBased`.

### `Base64.sol`

- A utility library for Base64 encoding, used in `MetadataRenderer` for encoding SVG images and metadata.

## Installation

To get started with this project, clone the repository and install the dependencies:

\```bash
git clone https://github.com/wbnns/first-based.git
cd first-based
npm install
\```

## Deployment

The contracts are deployed using Hardhat. To deploy the contracts:

1. Set up your `hardhat.config.js` with the desired network configurations.
2. Compile the contracts using `npx hardhat compile`.
3. Run the deployment script:

\```bash
npx hardhat run scripts/deploy.js --network <network-name>
\```

## Verification

After deployment, verify the `FirstBased` contract on Basescan by providing the constructor arguments used during the deployment process.

## Contributing

Contributions to the `FirstBased` NFT project are welcome! To contribute:

1. Fork the repository.
2. Create a new branch for your feature (`git checkout -b feature/BasedFeature`).
3. Commit your changes (`git commit -m 'Add some BasedFeature'`).
4. Push to the branch (`git push origin feature/BasedFeature`).
5. Open a pull request.

## Repository Structure

- `contracts/`: Contains the Solidity contracts.
- `scripts/`: Contains the deployment script.
- `test/`: Contains the tests for the contracts (if applicable).
- `hardhat.config.js`: Hardhat configuration file.

## License

This project is licensed under the [MIT License](LICENSE).

