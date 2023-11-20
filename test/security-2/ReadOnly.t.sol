// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../../src/security-2/ReadOnly.sol";

contract ReadOnlyTest is Test {
    ReadOnlyPool public pool;
    VulnerableDeFiContract public vulnerableContract;

    Attacker public attacker;
    address public player = makeAddr("player");

    function setUp() public {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */

        // Deploy contracts
        pool = new ReadOnlyPool();
        vulnerableContract = new VulnerableDeFiContract(pool);

        // setup
        pool.addLiquidity{value: 100 ether}();
        pool.earnProfit{value: 1 ether}();
        vulnerableContract.snapshotPrice();

        // player starts with 2 ether
        vm.deal(player, 2 ether);
    }

    function testExploit() public {
        /** CODE YOUR SOLUTION HERE */

        _checkSolved();
    }

    function _checkSolved() internal {
        /** SUCCESS CONDITIONS - NO NEED TO CHANGE ANYTHING HERE */

        console.logUint(vulnerableContract.lpTokenPrice());
        assertEq(vulnerableContract.lpTokenPrice(), 0);
    }
}