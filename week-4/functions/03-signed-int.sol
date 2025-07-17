// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.28;

contract Contract {
    int8 public a = 50;
    int8 public b = -30;
    int16 public difference = int16(a > b ? a - b : b - a);
}
