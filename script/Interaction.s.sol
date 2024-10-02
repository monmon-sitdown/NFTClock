// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "../lib/foundry-devops/src/DevOpsTools.sol";
import {DynamicClockNFT} from "../src/DynamicClockNFT.sol";

contract MintDynamicClockNft is Script {
    function run() external {
        console.log("Running mint script...");

        address mostRecentlyDeployedDynamicClockNFT = DevOpsTools
            .get_most_recent_deployment("DynamicClockNFT", block.chainid);
        console.log(
            "Most recently deployed DynamicClockNFT address: ",
            mostRecentlyDeployedDynamicClockNFT
        );
        mintNftOnContract(mostRecentlyDeployedDynamicClockNFT);
    }

    function mintNftOnContract(address basicNftAddress) public {
        vm.startBroadcast();
        DynamicClockNFT(basicNftAddress).mintClock();
        vm.stopBroadcast();
    }
}
