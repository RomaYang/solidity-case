// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "hardhat/console.sol";

contract X {
    string public name;
    constructor(string memory _name) {
        name = _name;
    }
}

contract Y {
    string public text;
    constructor(string memory _text) {
        text = _text;
    }
}

contract A is X('X'), Y('Y') {}

contract B is X, Y {
    constructor(string memory _name, string memory _text) X(_name) Y(_text) {}
}

// Order of constructors called:
// 1. X
// 2. Y
// 3. D
contract D is X, Y {
    constructor() X("X was called") Y("Y was called") {}
}

// Order of constructors called:
// 1. X
// 2. Y
// 3. E
contract E is X, Y {
    constructor() Y("Y was called") X("X was called") {}
}






contract Animal {
    function run() public {}
}

// Man 继承 Animal 合约
contract Man is Animal {
    // Man 新增 think 函数
    function think() public {}
}

contract Test {
    function test() public {
        // Animal 可调用 run
        Animal a = new Animal();
        a.run();
        // Man 可调用继承自 Animal 的 run 函数
        Man man = new Man();
        man.run();
        // 以及自己新增的 think 函数
        man.think();
    }
}

