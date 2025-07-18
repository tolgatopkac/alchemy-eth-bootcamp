// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Ownable {
    // Owner address'ini sakla
    address public owner;

    // Constructor - deploy eden kişi owner olur
    constructor() {
        owner = msg.sender;
    }

    // onlyOwner modifier - sadece owner'ın çağırabileceği fonksiyonlar için
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _; // Fonksiyon gövdesi burada çalışır
    }
}

contract Transferable is Ownable {
    // Ownership transfer fonksiyonu
    function transfer(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner cannot be zero address");
        owner = newOwner;
    }
}
