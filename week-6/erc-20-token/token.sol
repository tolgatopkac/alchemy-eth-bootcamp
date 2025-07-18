// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Token {
    uint public totalSupply;

    // Token configuration
    string public name = "AlcToken";
    string public symbol = "ALT";
    uint8 public decimals = 18;

    // Mapping to store balances
    mapping(address => uint256) public balances;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() {
        totalSupply = 1000 * 10 ** decimals;
        balances[msg.sender] = totalSupply;

        emit Transfer(address(0), msg.sender, totalSupply);
    }

    // balanceof function
    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }

    // Transfer function - ERC-20 standard requirement
    function transfer(address to, uint256 amount) external returns (bool) {
        // 🔒 GÜVENLİK KONTROLÜ: Gönderen yeterli balance'a sahip mi?
        require(balances[msg.sender] >= amount, "Insufficient balance");

        // 🔒 GÜVENLİK KONTROLÜ: Geçerli alıcı address'i mi?
        require(to != address(0), "Cannot transfer to zero address");

        // Transfer işlemi
        balances[msg.sender] -= amount; // Gönderen'den düş
        balances[to] += amount; // Alıcı'ya ekle

        emit Transfer(msg.sender, to, amount);

        return true; // ERC-20 standard'ı true döndürmek gerektirir
    }
}
