// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Collectible {
    address public owner;
    uint public price;

    event Deployed(address indexed owner);
    event Transfer(address indexed from, address indexed to);
    event ForSale(uint price, uint timestamp);
    event Purchase(uint amount, address indexed buyer);

    constructor() {
        owner = msg.sender;
        emit Deployed(msg.sender);
    }

    function transfer(address recipient) external {
        require(msg.sender == owner, "Only the owner can transfer!");

        address previousOwner = owner;
        owner = recipient;

        emit Transfer(previousOwner, recipient);
    }

    function markPrice(uint _price) external {
        require(msg.sender == owner, "Only the owner can mark price!");

        price = _price;
        emit ForSale(_price, block.timestamp);
    }

    function purchase() external payable {
        require(price > 0, "Not for sale!");
        require(msg.value == price, "Incorrect payment amount!");

        address seller = owner;

        (bool success, ) = seller.call{value: msg.value}("");
        require(success, "Payment failed!");

        owner = msg.sender;
        price = 0;

        emit Purchase(msg.value, msg.sender);
    }
}
