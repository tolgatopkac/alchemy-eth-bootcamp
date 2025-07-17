// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Escrow {
    address public depositor; // The person who deposits the money
    address public beneficiary; // The person who will receive the money
    address public arbiter; // The neutral party who resolves disputes
    bool public isApproved = false; // Approval status

    // Event definition
    event Approved(uint balance);

    constructor(address _arbiter, address _beneficiary) payable {
        arbiter = _arbiter;
        beneficiary = _beneficiary;
        depositor = msg.sender; // Contract deployer becomes the depositor
    }

    function approve() external {
        // Only the arbiter can call this function
        require(msg.sender == arbiter, "Only arbiter can approve!");

        // Store the contract balance before transfer
        uint contractBalance = address(this).balance;

        // Send all contract funds to the beneficiary
        (bool sent, ) = beneficiary.call{value: contractBalance}("");
        require(sent, "Failed to send ether");

        // Mark the contract as approved
        isApproved = true;

        // Emit the approval event with the transferred amount
        emit Approved(contractBalance);
    }
}
