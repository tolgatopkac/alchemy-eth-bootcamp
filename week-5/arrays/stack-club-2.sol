// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract StackClub {
    // Dynamic array to store member addresses
    address[] members;

    // Constructor - deployer becomes first member
    constructor() {
        members.push(msg.sender);
    }

    // Add a new member to the club (only existing members can call)
    function addMember(address newMember) external {
        require(isMember(msg.sender), "Only members can add new members!");
        members.push(newMember);
    }

    // Remove the last member from the club (only existing members can call)
    function removeLastMember() external {
        require(isMember(msg.sender), "Only members can remove members!");
        require(members.length > 0, "No members to remove!");
        members.pop();
    }

    // Check if an address is a member
    function isMember(address addr) public view returns (bool) {
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == addr) {
                return true;
            }
        }
        return false;
    }
}
