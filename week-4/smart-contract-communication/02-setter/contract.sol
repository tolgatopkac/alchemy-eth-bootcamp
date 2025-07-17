// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Contract {
    uint public value;

    function modifyValue(uint _value) external {
        value = _value;
    }
}
