// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Contract {
    enum Choices {
        Yes,
        No
    }

    // Vote struct definition
    struct Vote {
        Choices choice;
        address voter;
    }

    // Public state variable of Vote type
    Vote public vote;

    function createVote(Choices choice) external {
        // Create a new Vote instance and store it
        vote = Vote(choice, msg.sender);
    }
}
