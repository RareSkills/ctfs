// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../../src/security-1/GuessNewNumber.sol";

contract GuessNewNumberTest is Test {
    GuessNewNumber public guessNewNumber;
    Attacker public attackerContract;

    function setUp() public {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */

        // Deploy contracts
        guessNewNumber = (new GuessNewNumber){value: 1 ether}();
    }

    function testExploit() public {
        /** CODE YOUR SOLUTION HERE */

        _checkSolved(attackerContract.answer());
    }

    function _checkSolved(uint8 _newNumber) internal {
        /** SUCCESS CONDITIONS - NO NEED TO CHANGE ANYTHING HERE */

        assertTrue(guessNewNumber.guess{value: 1 ether}(_newNumber), "Wrong Number");
        assertTrue(guessNewNumber.isComplete(), "Balance is supposed to be zero");
    }

    receive() external payable {}
}