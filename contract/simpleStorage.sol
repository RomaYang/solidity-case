// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "hardhat/console.sol";

contract SimpleStorage {
    uint256 public counter;

    function get() public view returns (uint256) {
        return counter;
    }

    function set(uint256 num) public {
        counter = num;
    }
}
