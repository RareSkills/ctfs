// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../../src/security-2/Viceroy.sol";

contract ViceroyTest is Test {
    OligarchyNFT public oligarch;
    Governance public governance;
    CommunityWallet public communityWallet;

    Attacker public attackerContract;
    address public player = makeAddr("player");

    function setUp() public {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */

        vm.deal(address(this), 1 ether);

        // Deploy contracts
        attackerContract = new Attacker();

        oligarch = new OligarchyNFT(address(attackerContract));
        governance = new Governance{value: 1 ether}(oligarch);
        communityWallet = governance.communityWallet();

        assertEq(address(communityWallet).balance, 1 ether);
    }

    function testExploit() public {
        /** CODE YOUR SOLUTION HERE */

        _checkSolved();
    }

    function _checkSolved() internal {
        /** SUCCESS CONDITIONS - NO NEED TO CHANGE ANYTHING HERE */

        assertEq(address(communityWallet).balance, 0);
        assertGe(address(attackerContract).balance, 1 ether);
    }
}