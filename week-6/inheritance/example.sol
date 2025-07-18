// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Base {
    uint256 public value = 10;

    function changeValue(uint256 _value) external {
        value = _value; // Değeri güncelle
    }
}

contract Derived is Base {
    constructor() {}
}
