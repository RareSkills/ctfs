// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../../src/security-1/SideEntranceLenderPool.sol";

contract SideEntranceLenderPoolTest is Test {
    SideEntranceLenderPool public pool;
    Attacker public attackerContract;

    uint256 constant public ETHER_IN_POOL = 1000 ether;
    // do not prank owner
    address owner = makeAddr("owner");

    function setUp() public {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */

        // Deploy contracts
        pool = new SideEntranceLenderPool();

        vm.deal(owner, ETHER_IN_POOL);
        vm.prank(owner);
        pool.deposit{value: ETHER_IN_POOL}();

        vm.deal(address(this), 1 ether);
    }

    function testExploit() public {
        /** CODE YOUR SOLUTION HERE */

        _checkSolved();
    }

    function _checkSolved() internal {
        /** SUCCESS CONDITIONS - NO NEED TO CHANGE ANYTHING HERE */

        assertEq(address(pool).balance, 0);
        assertGt(address(this).balance, ETHER_IN_POOL);
    }

    receive() external payable {}
}