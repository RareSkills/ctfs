// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import { DamnValuableToken } from "../../src/utilities/DamnValuableToken.sol";
import { UnstoppableVault, ReceiverUnstoppable } from "../../src/security-1/Unstoppable.sol";

contract UnstoppableTest is Test {
    DamnValuableToken public token;
    UnstoppableVault public vault;
    ReceiverUnstoppable public receiverContract;

    uint256 public constant TOKENS_IN_VAULT = 1_000_000e18;
    uint256 public constant INITIAL_PLAYER_TOKEN_BALANCE = 10e18;

    // do not prank deployer except in setUp
    address deployer = makeAddr("deployer");
    address someUser = makeAddr("someUser");

    function setUp() public {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */

        vm.startPrank(deployer);

        // Deploy contracts
        token = new DamnValuableToken();
        vault = new UnstoppableVault(token, deployer, deployer);

        assertEq(address(vault.asset()), address(token));

        token.approve(address(vault), TOKENS_IN_VAULT);
        vault.deposit(TOKENS_IN_VAULT, deployer);

        assertEq(token.balanceOf(address(vault)), TOKENS_IN_VAULT);
        assertEq(vault.totalAssets(), TOKENS_IN_VAULT);
        assertEq(vault.totalSupply(), TOKENS_IN_VAULT);
        assertEq(vault.maxFlashLoan(address(token)), TOKENS_IN_VAULT);
        assertEq(vault.flashFee(address(token), TOKENS_IN_VAULT - 1), 0);
        assertEq(vault.flashFee(address(token), TOKENS_IN_VAULT), 50_000e18);

        token.transfer(address(this), INITIAL_PLAYER_TOKEN_BALANCE);
        assertEq(token.balanceOf(address(this)), INITIAL_PLAYER_TOKEN_BALANCE);

        vm.stopPrank();

        // Show it's possible for someUser to take out a flash loan
        vm.startPrank(someUser);

        receiverContract = new ReceiverUnstoppable(address(vault));
        receiverContract.executeFlashLoan(100e18);

        vm.stopPrank();
    }

    function testExploit() public {
        /** CODE YOUR SOLUTION HERE */

        _checkSolved();
    }

    function _checkSolved() internal {
        /** SUCCESS CONDITIONS - NO NEED TO CHANGE ANYTHING HERE */

        vm.prank(someUser);
        vm.expectRevert();
        receiverContract.executeFlashLoan(100e18);
    }

    receive() external payable {}
}