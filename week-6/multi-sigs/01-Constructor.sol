// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MultiSig {
    address[] public owners; // owners of the wallet
    uint256 public required; // number of confirmations required for a transaction

    constructor(address[] memory _owners, uint256 _required) {
        owners = _owners; // set the owners
        required = _required; // set the required confirmations
    }
}
