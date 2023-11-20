// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../../src/security-2/Democracy.sol";

contract DemocracyTest is Test {
    Democracy public democracy;

    address private incumbent = makeAddr("incumbent");
    address private attacker = makeAddr("attacker");
    address private attackerSecondAddress = makeAddr("attackerSecondAddress");

    function setUp() public {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */

        vm.deal(incumbent, 1 ether);
        // Deploy contracts
        vm.prank(incumbent);
        democracy = new Democracy{value: 1 ether}();
    }

    function testExploit() public {
        /** CODE YOUR SOLUTION HERE */

        _checkSolved();
    }

    function _checkSolved() internal {
        /** SUCCESS CONDITIONS - NO NEED TO CHANGE ANYTHING HERE */

        assertEq(address(democracy).balance, 0);
    }
}