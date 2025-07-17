// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Contract {
    address owner;
    string public message;

    constructor() {
        owner = msg.sender; // Set the contract creator as the owner
    }

    function modify(string calldata _message) external {
        require(msg.sender == owner, "Only the owner can modify the message");
        message = _message;
    }
}
