// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.4;

contract Party {
    uint256 public deposit; // Required deposit amount for RSVP
    address[] public rsvps; // List of addresses that have RSVP'd

    mapping(address => bool) public hasRSVPed; // Mapping to track if an address has already RSVP'd

    constructor(uint256 _deposit) {
        deposit = _deposit; // Set the deposit amount in the constructor
    }

    function rsvp() external payable {
        // Check if the sent value matches the required deposit
        require(msg.value == deposit, "Must send exactly the required deposit");

        // Check if the sender has already RSVP'd
        require(!hasRSVPed[msg.sender], "You have already RSVP'd");

        rsvps.push(msg.sender); // Add the sender's address to the RSVP list
        hasRSVPed[msg.sender] = true; // Mark the sender as having RSVP'd
    }

    function payBill(address venue, uint256 amount) external {
        // Ensure the contract has enough balance to pay the venue
        (bool success, ) = venue.call{value: amount}("");
        require(success, "Payment to venue failed");

        // After paying the venue, refund the deposit to all RSVPs
        uint256 remainingBalance = address(this).balance;

        // Calculate the refund amount per person
        uint256 refundPerPerson = remainingBalance / rsvps.length;

        // Refund each RSVP'd address
        for (uint256 i = 0; i < rsvps.length; i++) {
            (bool refundSuccess, ) = rsvps[i].call{value: refundPerPerson}("");
            require(refundSuccess, "Refund failed");
        }
    }
}
