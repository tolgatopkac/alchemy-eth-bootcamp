// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Contract {
    bytes32 public msg1 = "HELLO WORLD Welcome!";
    string public msg2 =
        "Hello World! This message is intentionally made very long so that it exceeds the 32 byte limit of bytes32 data type.";
}
