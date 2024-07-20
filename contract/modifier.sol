// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "hardhat/console.sol";

contract Modifier {
    address public owner;
    uint256 public num = 10;
    bool public locked;

    constructor() {
        // Set the transaction sender as the owner of the contract.
        owner = msg.sender;
    }

    modifier isOwner() {
        require(msg.sender == owner, 'not a owner');
        _;
    }

    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    function changeOwner(address _newOwner)
        public
        isOwner
        validAddress(_newOwner)
    {
        owner = _newOwner;
    }

    modifier noReentrancy() {
        require(!locked, "No reentrancy");
        locked = true;
        _;
        locked = false;
    }

    function decrement(uint256 i) public noReentrancy {
        if (i > 1) {
            decrement(i - 1);
        }
    }
}
