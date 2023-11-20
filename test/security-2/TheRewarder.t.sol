// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "../../src/security-2/the-rewarder/FlashLoanerPool.sol";
import "../../src/security-2/the-rewarder/TheRewarderPool.sol";
import "../../src/security-2/the-rewarder/Attacker.sol";

contract TheRewarderTest is Test {
    DamnValuableToken public liquidityToken;
    RewardToken public rewardToken;
    AccountingToken public accountingToken;
    FlashLoanerPool public flashLoanPool;
    TheRewarderPool public rewarderPool;

    uint private constant TOKENS_IN_LENDER_POOL = 1_000_000e18;

    address[4] users = [makeAddr("alice"), makeAddr("bob"), makeAddr("charlie"), makeAddr("david")];

    Attacker public attacker;
    address public player = makeAddr("player");

    function setUp() public {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */

        // Deploy contracts
        liquidityToken = new DamnValuableToken();
        flashLoanPool = new FlashLoanerPool(address(liquidityToken));
        rewarderPool = new TheRewarderPool(address(liquidityToken));

        // Set initial token balance of the pool offering flash loans
        liquidityToken.transfer(address(flashLoanPool), TOKENS_IN_LENDER_POOL);

        // Set rewardToken and accountingToken
        rewardToken = rewarderPool.rewardToken();
        accountingToken = rewarderPool.accountingToken();

        // Check roles in accounting token
        assertEq(accountingToken.owner(), address(rewarderPool));
        assertTrue(
            accountingToken.hasAllRoles(
                address(rewarderPool),
                accountingToken.MINTER_ROLE() | accountingToken.SNAPSHOT_ROLE() | accountingToken.BURNER_ROLE()
            )
        );

        // Alice, Bob, Charlie and David deposit tokens
        uint depositAmount = 100e18;
        for (uint i; i < users.length; ++i) {
            liquidityToken.transfer(users[i], depositAmount);
            vm.startPrank(users[i]);
            liquidityToken.approve(address(rewarderPool), depositAmount);
            rewarderPool.deposit(depositAmount);
            vm.stopPrank();

            assertEq(accountingToken.balanceOf(users[i]), depositAmount);
        }

        assertEq(accountingToken.totalSupply(), depositAmount * users.length);
        assertEq(rewardToken.totalSupply(), 0);

        // Advance time by 5 days so that depositors can get rewards
        skip(5 days);

        // Each depositor gets reward tokens
        uint rewardsInRound = rewarderPool.REWARDS();
        for (uint i; i < users.length; ++i) {
            vm.prank(users[i]);
            rewarderPool.distributeRewards();

            assertEq(rewardToken.balanceOf(users[i]), rewardsInRound / users.length);
        }

        assertEq(rewardToken.totalSupply(), rewardsInRound);
        // Two rounds must have occurred so far
        assertEq(rewarderPool.roundNumber(), 2);

        // Player starts with zero DVT tokens in balance
        assertEq(liquidityToken.balanceOf(player), 0);
    }

    function testExploit() public {
        /** CODE YOUR SOLUTION HERE */

        _checkSolved();
    }

    function _checkSolved() internal {
        /** SUCCESS CONDITIONS - NO NEED TO CHANGE ANYTHING HERE */

        // Only one round must have taken place
        assertEq(rewarderPool.roundNumber(), 3);

        // Users should get neglegible rewards this round
        uint256 delta;
        for (uint i; i < users.length; ++i) {
            uint beforeBalance = rewardToken.balanceOf(users[i]);
            vm.prank(users[i]);
            rewarderPool.distributeRewards();

            delta = rewardToken.balanceOf(users[i]) - beforeBalance;
            assertLt(delta, 1e16);
        }


        assertGt(rewardToken.totalSupply(), rewarderPool.REWARDS());

        // Rewards must have been issued to the player account
        uint playerRewards = rewardToken.balanceOf(player);
        assertGt(playerRewards, 0);

        // The amount of rewards earned should be close to total available amount
        delta = rewarderPool.REWARDS() - playerRewards;
        assertLt(delta, 1e17);

        // Balance of DVT tokens in player and lending pool hasn't changed
        assertEq(liquidityToken.balanceOf(player), 0);
        assertEq(liquidityToken.balanceOf(address(flashLoanPool)), TOKENS_IN_LENDER_POOL);
    }
}