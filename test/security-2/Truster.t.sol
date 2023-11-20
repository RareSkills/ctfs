// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../../src/security-2/Truster.sol";
import "../../src/utilities/DamnValuableToken.sol";

contract TrusterTest is Test {
    TrusterLenderPool public pool;
    DamnValuableToken public token;
    Attacker public attackerContract;

    uint256 public constant TOKENS_IN_POOL = 1_000_000e18;

    address player = makeAddr("player");

    function setUp() public {
        /** SETUP SCENARIO - NO NEED TO CHANGE ANYTHING HERE */

        // Deploy contracts
        token = new DamnValuableToken();
        pool = new TrusterLenderPool(token);

        token.transfer(address(pool), TOKENS_IN_POOL);
    }

    function testExploit() public {
        /** CODE YOUR SOLUTION HERE */

        _checkSolved();
    }

    function _checkSolved() internal {
        /** SUCCESS CONDITIONS - NO NEED TO CHANGE ANYTHING HERE */

        assertEq(token.balanceOf(player), TOKENS_IN_POOL);
        assertEq(token.balanceOf(address(pool)), 0);
    }
}