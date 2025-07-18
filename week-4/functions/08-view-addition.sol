// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Contract {
    uint public x;

    constructor(uint _x) {
        x = _x;
    }

    function increment() external {
        x = x + 1;
    }

    function add(uint _x) external view returns (uint) {
        return x + _x;
    }
}
