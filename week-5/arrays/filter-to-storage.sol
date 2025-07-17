// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    // Public dynamic array to store even numbers
    uint[] public evenNumbers;

    function filterEven(uint[] memory numbers) external {
        // Loop through the input array
        for (uint i = 0; i < numbers.length; i++) {
            // Check if the number is even
            if (numbers[i] % 2 == 0) {
                // Push even numbers to storage array
                evenNumbers.push(numbers[i]);
            }
        }
    }
}
