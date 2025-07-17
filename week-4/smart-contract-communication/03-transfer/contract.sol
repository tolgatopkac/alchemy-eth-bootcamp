// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Contract {
    mapping(address => uint) public balances;

    constructor() {
        // Initialize the contract with some balances
        balances[msg.sender] = 1000; // Owner starts with 1000 units
    }

    function transfer(address beneficiary, uint amount) external {
        require(balances[msg.sender] >= amount, "Balance too low!");
        balances[beneficiary] += amount;
        balances[msg.sender] -= amount;
    }
}
