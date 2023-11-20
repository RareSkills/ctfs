// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../../src/security-1/GuessSecretNumber.sol";

contract GuessSecretNumberTest is Test {
    Attacker attackerContract;
    GuessTheSecretNumber guessTheSecretNumber;

    function setUp() public {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */

        // Deploy "GuessTheSecretNumber" contract and deposit one ether into it
        guessTheSecretNumber = (new GuessTheSecretNumber){value: 1 ether}();
    }

    function testExploit() public {
        /** CODE YOUR SOLUTION HERE */

        _checkSolved(attackerContract.secretNumber());
    }

    function _checkSolved(uint8 _secretNumber) internal {
        /** SUCCESS CONDITIONS - NO NEED TO CHANGE ANYTHING HERE */

        assertTrue(
            guessTheSecretNumber.guess{value: 1 ether}(_secretNumber),
            "Wrong Number"
        );
        assertTrue(guessTheSecretNumber.isComplete(), "Challenge Incomplete");
    }

    receive() external payable {}
}