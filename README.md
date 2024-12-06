# DynamicClockNFT

DynamicClockNFT is an ERC-721 non-fungible token (NFT) that displays a dynamic clock. The clock animation is rendered using SVG and continuously updates. The NFT contract has been deployed to the Sepolia test network.

The Basic NFT was deployed at 0x6997EA113CC4E9D80DFE24aFe5B284aCa097cdf5 on Sepolia testnet and can be checked on etherscan. (Attention: Basic NFT, not the dynamic clock. )

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

## Contract Overview

The smart contract is written in Solidity and uses the OpenZeppelin ERC-721 standard for NFTs. It includes the following key functions:

- `mintClock()`: Mints a new Dynamic Clock NFT and assigns it to the caller.
- `tokenURI()`: Returns the metadata, including the dynamically generated SVG of the clock.
- `generateClockSVGContent()`: Constructs the SVG for the clock, including animated hour, minute, and second hands.
