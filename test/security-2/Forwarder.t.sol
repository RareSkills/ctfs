// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../../src/security-2/Forwarder.sol";

contract ForwarderTest is Test {
    Forwarder public forwarder;
    Wallet public wallet;
    Attacker public attackerContract;

    function setUp() public {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */

        // Deploy contracts
        forwarder = new Forwarder();
        wallet = new Wallet{value: 1 ether}(address(forwarder));

    }

    function testExploit() public {
        /** CODE YOUR SOLUTION HERE */

        _checkSolved();
    }

    function _checkSolved() internal {
        /** SUCCESS CONDITIONS - NO NEED TO CHANGE ANYTHING HERE */
        
        uint256 attackerWalletBalance = address(attackerContract).balance;
        assertTrue(attackerWalletBalance >= 1 ether - 1e15 && attackerWalletBalance <= 1 ether + 1e15);
        assertEq(address(wallet).balance, 0);
    }
}