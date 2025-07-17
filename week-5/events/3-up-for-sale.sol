// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Collectible {
    address public owner;

    // Event tanımları
    event Deployed(address owner);
    event Transfer(address, address);
    event ForSale(uint price, uint timestamp);

    // Public constructor
    constructor() {
        owner = msg.sender;
        emit Deployed(msg.sender);
    }

    // Transfer fonksiyonu
    function transfer(address recipient) external {
        require(msg.sender == owner, "Only the owner can transfer!");

        address previousOwner = owner;
        owner = recipient;

        emit Transfer(previousOwner, recipient);
    }

    // Mark price fonksiyonu
    function markPrice(uint price) external {
        require(msg.sender == owner, "Only the owner can mark price!");

        emit ForSale(price, block.timestamp);
    }
}
