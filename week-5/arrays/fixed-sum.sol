// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Contract {
    function sum(uint[5] memory numbers) external pure returns (uint) {
        uint total = 0;

        for (uint i = 0; i < 5; i++) {
            total += numbers[i];
        }

        return total;
    }
}
