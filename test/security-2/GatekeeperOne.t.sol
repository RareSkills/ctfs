// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../../src/security-2/GatekeeperOne.sol";

contract GatekeeperOneTest is Test {
    GatekeeperOne public gatekeeper;

    Attacker public attackerContract;

    address public player = makeAddr("player");

    function setUp() public {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */

        // Deploy contracts
        gatekeeper = new GatekeeperOne();
    }

    function testExploit() public {
        /** CODE YOUR SOLUTION HERE */

    }
}