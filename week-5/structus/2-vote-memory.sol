// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;
pragma experimental ABIEncoderV2;

contract Contract {
    enum Choices {
        Yes,
        No
    }

    struct Vote {
        Choices choice;
        address voter;
    }

    // Create and return a Vote instance
    function createVote(Choices choice) external view returns (Vote memory) {
        return Vote(choice, msg.sender);
    }
}
