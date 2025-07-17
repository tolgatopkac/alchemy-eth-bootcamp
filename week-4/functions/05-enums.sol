// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Contract {
    enum Foods {
        Apple,
        Pizza,
        Bagel,
        Banana,
        Burger,
        Sushi,
        Tacos,
        IceCream
    }

    Foods public food1 = Foods.Pizza;
    Foods public food2 = Foods.Sushi;
    Foods public food3 = Foods.Burger;
    Foods public food4 = Foods.IceCream;
    Foods public food5 = Foods.Apple;
    Foods public food6 = Foods.Tacos;
}
