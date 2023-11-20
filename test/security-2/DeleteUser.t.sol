// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../../src/security-2/DeleteUser.sol";

contract DeleteUserTest is Test {
    DeleteUser public deleteUser;

    Attacker public attackerContract;
    address public player = makeAddr("player");

    function setUp() public {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */

        // Deploy contracts
        deleteUser = new DeleteUser();
        deleteUser.deposit{value:  1 ether}();

        vm.deal(player, 1 ether);
    }

    function testExploit() public {
        /** CODE YOUR SOLUTION HERE */

        _checkSolved();
    }

    function _checkSolved() internal {
        /** SUCCESS CONDITIONS - NO NEED TO CHANGE ANYTHING HERE */

        assertEq(address(deleteUser).balance, 0);
    }
}