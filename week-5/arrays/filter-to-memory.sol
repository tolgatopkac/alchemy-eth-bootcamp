// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    function filterEven(
        uint[] memory numbers
    ) external pure returns (uint[] memory) {
        // Count even numbers first to determine array size
        uint evenCount = 0;
        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                evenCount++;
            }
        }

        // Create new array with exact size needed
        uint[] memory evenNumbers = new uint[](evenCount);

        // Fill the new array with even numbers
        uint currentIndex = 0;
        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                evenNumbers[currentIndex] = numbers[i];
                currentIndex++;
            }
        }

        return evenNumbers;
    }
}
