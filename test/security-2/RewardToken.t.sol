// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../../src/security-2/RewardToken.sol";

contract RewardTokenTest is Test {
    Depositoor public depositor;
    NftToStake public nft;
    RewardToken public token;

    Attacker public attacker;
    address public player = makeAddr("player");

    function setUp() public {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */

        // Deploy contracts
        attacker = new Attacker();
        nft = new NftToStake(address(attacker));
        depositor = new Depositoor(nft);
        token = new RewardToken(address(depositor));

        // setup
        depositor.setRewardToken(token);
    }

    function testExploit() public {
        /** CODE YOUR SOLUTION HERE */

        _checkSolved();
    }

    function _checkSolved() internal {
        /** SUCCESS CONDITIONS - NO NEED TO CHANGE ANYTHING HERE */

        assertEq(token.balanceOf(address(attacker)), 100 ether);
        assertEq(token.balanceOf(address(depositor)), 0);
    }
}