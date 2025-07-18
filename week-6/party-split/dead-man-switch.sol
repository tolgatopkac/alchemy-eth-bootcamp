// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Switch {
    address public owner; // Contract owner
    address public receipient; // Address to receive funds
    uint256 public lastPing; // Last ping timestamp
    uint256 constant INACTIVITY_PERIOD = 52 weeks; // 52 weeks inactivity period

    constructor(address _recipient) payable {
        owner = msg.sender; // Set the deployer as the owner
        receipient = _recipient; // Set the recipient address
        lastPing = block.timestamp; // Initialize last ping to deployment time
    }

    // ping function to update last ping time
    function ping() external {
        require(msg.sender == owner, "Only owner can ping"); // Only owner can ping
        lastPing = block.timestamp; // Update last ping time
    }

    // withdraw function to transfer funds after inactivity period
    function withdraw() external {
        // 52 hafta inaktivite geçmiş olmalı
        require(
            block.timestamp >= lastPing + INACTIVITY_PERIOD,
            "Inactivity period not reached"
        );

        // Tüm fonları recipient'e gönder
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds to withdraw");

        (bool success, ) = receipient.call{value: balance}("");
        require(success, "Transfer failed");
    }
}
