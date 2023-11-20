# Solidity CTFs by [RareSkills](https://www.rareskills.io)

A set of CTFs in a foundry environment setup, except [puppet-v2](puppet-v2-hardhat), to practice the problems on [Ethernaut](https://ethernaut.openzeppelin.com/), [Damn Vulnerable DeFi](https://damnvulnerabledefi.xyz/) and [Capture the Ether](https://capturetheether.com/). Some of them are directly ported, some of them are modified to have compatibility with Foundry and some of them are new. Most challenges require solving in one transaction, pay close attention to the restrictions in the tests.

## How to play
Make sure foundry is installed. [instructions](https://book.getfoundry.sh/getting-started/installation)

`cd` to the directory, then add your solution where the comment says `/** CODE YOUR SOLUTION HERE */` inside the `.sol` file. We've also set up an `Attacker` contract for you. You need to write code inside `Attacker` contract in the source files and then write tests under function `testExploit()` in the corresponding test files. If the tests pass, you won. 

There is a `player` address that you can prank and call transaction from.

To run the tests:
```shell
forge test --match-contract <TEST_NAME>
```