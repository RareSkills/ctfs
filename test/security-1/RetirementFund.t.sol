// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../../src/security-1/RetirementFund.sol";

contract RetirementFundTest is Test {
    RetirementFund public retirementFund;
    Attacker public attackerContract;

    // do not prank this address
    address owner = makeAddr("owner");

    // player
    address player = makeAddr("player");

    function setUp() public {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */

        // Deploy contracts
        vm.deal(owner, 1 ether);

        vm.prank(owner);
        retirementFund = (new RetirementFund){value: 1 ether}(address(this));

        vm.deal(player, 1 ether);
    }

    function testExploit() public {
        /** CODE YOUR SOLUTION HERE */

        _checkSolved();
    }

    function _checkSolved() internal {
        /** SUCCESS CONDITIONS - NO NEED TO CHANGE ANYTHING HERE */

        assertTrue(retirementFund.isComplete(), "Challenge Incomplete");
    }

    receive() external payable {}
}