// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import { Overmint1_ERC1155, Attacker } from "../../src/security-1/Overmint1-ERC1155.sol";

contract Overmint1_ERC1155Test is Test {
    Attacker attackerContract;
    Overmint1_ERC1155 overmint;

    function setUp() public {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */
        overmint = new Overmint1_ERC1155();

        // Deploy "attackerContract"
        attackerContract = new Attacker();
    }

    function testOverMint() public {
        /** CODE YOUR SOLUTION HERE */

        _checkSolved();
    }

    function _checkSolved() internal {
        /** SUCCESS CONDITIONS - NO NEED TO CHANGE ANYTHING HERE */

        assertTrue(overmint.success(address(attackerContract), 0));
    }
}