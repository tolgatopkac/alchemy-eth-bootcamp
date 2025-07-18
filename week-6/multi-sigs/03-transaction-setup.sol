// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MultiSig {
    address[] public owners; // owners of the wallet
    uint256 public required; // number of confirmations required for a transaction

    constructor(address[] memory _owners, uint256 _required) {
        // Error Handling 1: Hiç owner yoksa hata ver
        require(_owners.length > 0, "No owner addresses provided");

        // Error Handling 2: Required confirmations sıfır olamaz
        require(
            _required > 0,
            "Required confirmations must be greater than zero"
        );

        // Error Handling 3: Required confirmations owner sayısından fazla olamaz
        require(
            _required <= _owners.length,
            "Required confirmations cannot exceed number of owners"
        );

        owners = _owners; // set the owners
        required = _required; // set the required confirmations
    }
}
