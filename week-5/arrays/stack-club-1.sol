// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract StackClub {
    // Dynamic array to store member addresses
    address[] members;

    // Add a new member to the club
    function addMember(address newMember) external {
        members.push(newMember);
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
