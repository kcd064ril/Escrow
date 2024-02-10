
# Escrow Smart Contract

## Overview

The Escrow contract is a Solidity smart contract that implements an escrow service for handling payments between a payer, payee, and an arbiter. It utilizes `require`, `assert`, and `revert` statements for ensuring correct contract behavior and handling errors.

## License

This smart contract is released under the MIT License.

## Usage

### Contract Details

- **Name**: Escrow
- **Solidity Version**: ^0.8.9
- **Dependencies**: None

### Functions

- **constructor**: Initializes the escrow contract with payer, payee, arbiter, and amount details.
- **deposit**: Allows the payer to deposit funds into the escrow. It verifies that the sender is the payer, funds haven't been released yet, and the correct amount is sent.
- **release**: Allows the arbiter to release the funds to the payee once conditions are met. It verifies that the sender is the arbiter and funds haven't been released yet.
- **refund**: Allows the arbiter to refund the funds to the payer if conditions aren't met. It verifies that the sender is the arbiter and funds haven't been released yet.
- **fallback**: Disallows fallback calls to the contract.

## Installation

1. Copy the contract code into a Solidity file (e.g., `Escrow.sol`).
2. Compile the contract using a Solidity compiler (e.g., solc).
3. Deploy the compiled contract to a supported blockchain network (e.g., Ethereum).

## Testing

Unit tests for the Escrow contract can be written using Solidity testing frameworks like Truffle or Hardhat. Test cases should cover various scenarios for depositing, releasing, and refunding funds, as well as error cases.

## Support

If you have any questions, issues, or feature requests, please open an issue on the GitHub repository.

