// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "hardhat/console.sol";

contract Enum {
    enum States {
        top,
        bottom,
        left,
        right
    }

    States public states;

    function get() public view returns(States) {
        return states;
    }

    function set(States _states) public {
        states = _states;
    }

    function right() public {
        states = States.right;
    }

    function reset() public {
        delete states;
    }
}
