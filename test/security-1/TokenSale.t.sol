// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../../src/security-1/TokenSale.sol";

contract TokenSaleTest is Test {
    TokenSale public tokenSale;
    Attacker public attackerContract;

    address player = makeAddr("player");

    function setUp() public {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */

        // Deploy contracts
        tokenSale = (new TokenSale){value: 1 ether}();
        vm.deal(player, 4 ether);
    }

    // Use the instance of tokenSale and attackerContract
    function testExploit() public {
        /** CODE YOUR SOLUTION HERE */

        _checkSolved();
    }

    function _checkSolved() internal {
        /** SUCCESS CONDITIONS - NO NEED TO CHANGE ANYTHING HERE */

        assertTrue(tokenSale.isComplete(), "Challenge Incomplete");
    }

    receive() external payable {}
}