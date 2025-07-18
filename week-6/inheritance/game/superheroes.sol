// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.4;

import "./hero.sol";

contract Mage is Hero(50) {
    function attack(address enemyAddress) public override {
        // 🦸‍♂️ Parent contract'ın attack fonksiyonunu çağır (energy azaltır)
        super.attack(enemyAddress);

        // Mage'in özel attack logic'i
        Enemy enemy = Enemy(enemyAddress);
        enemy.takeAttack(AttackTypes.Spell);
    }
}

contract Warrior is Hero(200) {
    function attack(address enemyAddress) public override {
        // 🦸‍♂️ Parent contract'ın attack fonksiyonunu çağır (energy azaltır)
        super.attack(enemyAddress);

        // Warrior'ın özel attack logic'i
        Enemy enemy = Enemy(enemyAddress);
        enemy.takeAttack(AttackTypes.Brawl);
    }
}
