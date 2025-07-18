// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Hackathon {
    struct Project {
        string title;
        uint[] ratings;
    }

    Project[] projects;

    function findWinner() external view returns (Project memory) {
        require(projects.length > 0, "No projects available");

        uint winnerIndex = 0;
        uint highestAverage = 0;

        // Check each project for its average rating
        for (uint i = 0; i < projects.length; i++) {
            uint[] memory ratings = projects[i].ratings;

            // If there are no ratings, skip this project
            if (ratings.length == 0) {
                continue;
            }

            // Calculate the average rating for this project
            uint sum = 0;
            for (uint j = 0; j < ratings.length; j++) {
                sum += ratings[j];
            }
            uint average = sum / ratings.length;

            // Eğer bu ortalama en yüksekse, güncelle
            if (average > highestAverage) {
                highestAverage = average;
                winnerIndex = i;
            }
        }

        return projects[winnerIndex];
    }

    function newProject(string calldata _title) external {
        // creates a new project with a title and an empty ratings array
        projects.push(Project(_title, new uint[](0)));
    }

    function rate(uint _idx, uint _rating) external {
        // rates a project by its index
        projects[_idx].ratings.push(_rating);
    }
}
