// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import {Script, console2} from "forge-std/Script.sol";
import {CrowdFund} from "../src/CrowdFund.sol";

contract DeployCrowdFund is Script {
    constructor() {}

    function run() external returns (CrowdFund) {
        vm.startBroadcast();
        CrowdFund fundMe = new CrowdFund();
        vm.stopBroadcast();
        return fundMe;
    }
}
