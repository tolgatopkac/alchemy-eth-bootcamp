// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.28;

import "./ierc20.sol";

contract Chest {
    function plunder(address[] calldata tokens) external {
        for (uint256 i = 0; i < tokens.length; i++) {
            IERC20 token = IERC20(tokens[i]);

            uint256 balance = token.balanceOf(address(this));

            if (balance > 0) {
                token.transfer(msg.sender, balance);
            }
        }
    }
}
