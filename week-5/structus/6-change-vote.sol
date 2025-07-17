// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Contract {
    enum Choices {
        Yes,
        No
    }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;

    function createVote(Choices choice) external {
        // Check if the voter has already voted
        require(!hasVoted(msg.sender), "Address has already voted!");

        votes.push(Vote(choice, msg.sender));
    }

    // Change existing vote
    function changeVote(Choices choice) external {
        (bool found, uint index) = findVoteIndex(msg.sender);
        require(found, "No existing vote found!");

        votes[index].choice = choice;
    }

    // Internal helper function to find vote index
    function findVoteIndex(
        address voter
    ) internal view returns (bool found, uint index) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == voter) {
                return (true, i);
            }
        }
        return (false, 0);
    }

    // Check if an address has voted (changed to public for internal use)
    function hasVoted(address voter) public view returns (bool) {
        (bool found, ) = findVoteIndex(voter);
        return found;
    }

    // Find the choice of a specific voter
    function findChoice(address voter) external view returns (Choices) {
        (bool found, uint index) = findVoteIndex(voter);
        require(found, "Voter has not voted yet");
        return votes[index].choice;
    }
}
