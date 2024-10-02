// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Script} from "forge-std/Script.sol";
import {DynamicClockNFT} from "../src/DynamicClockNFT.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {console} from "forge-std/console.sol";

contract DeployDynamicClockNFT is Script {
    function run() external returns (DynamicClockNFT) {
        vm.startBroadcast();
        DynamicClockNFT moodNft = new DynamicClockNFT();
        vm.stopBroadcast();
        return moodNft;
    }
}
