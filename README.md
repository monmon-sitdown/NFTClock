# DynamicClockNFT

DynamicClockNFT is an ERC-721 non-fungible token (NFT) that displays a dynamic clock. The clock animation is rendered using SVG and continuously updates. The NFT contract has been deployed to the Sepolia test network.

## Contract Information

- **Contract Name**: DynamicClockNFT
- **Symbol**: DCLOCK
- **Network**: Sepolia Testnet
- **Contract Address**: 0x91303331dfeb93571f390901B63cbbD272B4529b

## Features

- **Mint Clock NFTs**: Users can mint their own Dynamic Clock NFTs by interacting with the smart contract.
- **Dynamic Clock Display**: Each minted NFT includes an SVG-based clock animation, showing the current hours, minutes, and seconds.

## Prerequisites

- A Web3 wallet (e.g., MetaMask) connected to the Sepolia Testnet.
- Some test ETH on the Sepolia network to cover gas fees (can be obtained from a Sepolia faucet).

## Steps to Mint a Clock NFT

1. **Connect to MetaMask**:

- Ensure your MetaMask is connected to the Sepolia test network.

2. **Mint the NFT**:

- Interact with the contract on Sepolia using tools like Etherscan or through your own DApp to call the `mintClock` function.

3. **View Your NFT in MetaMask**:

- To view your DynamicClockNFT, you need to import the token into MetaMask as an NFT.
- Follow the steps below to add it:

### Importing DynamicClockNFT into MetaMask

1. **Open MetaMask**: Ensure your wallet is connected to the Sepolia test network.
2. **Go to the NFTs Section**:

- In MetaMask, navigate to the "NFTs" tab.
- Click on "Import NFTs" at the bottom of the screen.

3. **Add the Token**:

- Enter the **Contract Address**: 0x91303331dfeb93571f390901B63cbbD272B4529b.
- **Token ID**: Enter the token ID of the NFT you minted.

4. **Confirm**: After entering the details, click "Add" to import the NFT. You should now be able to view the Dynamic Clock NFT in your wallet.

## Contract Overview

The smart contract is written in Solidity and uses the OpenZeppelin ERC-721 standard for NFTs. It includes the following key functions:

- `mintClock()`: Mints a new Dynamic Clock NFT and assigns it to the caller.
- `tokenURI()`: Returns the metadata, including the dynamically generated SVG of the clock.
- `generateClockSVGContent()`: Constructs the SVG for the clock, including animated hour, minute, and second hands.
