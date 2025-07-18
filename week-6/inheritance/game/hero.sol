// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.4;

interface Enemy {
    function takeAttack(Hero.AttackTypes attackType) external;
}

abstract contract Hero {
    uint public health = 100;
    uint public energy = 10;

    constructor(uint _health) {
        health = _health; // Constructor ile health değeri ayarlanır
    }

    function takeDamage(uint damage) public {
        health -= damage;
    }

    enum AttackTypes {
        Brawl,
        Spell
    }

    function attack(address) public virtual {
        energy--;
    }
}
