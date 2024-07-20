// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "hardhat/console.sol";

contract Mapping {
    mapping(address => uint256) public map;

    function get(address addr) public view returns(uint256) {
        return map[addr];
    }

    function set(address addr, uint256 val) public {
        map[addr] = val;
    }

    function remove(address addr) public {
        delete map[addr];
    }
}

contract NestedContract {
    mapping(address => mapping(uint256 => bool)) public nested;

    function get(address addr, uint256 _i) public view returns(bool) {
        return nested[addr][_i];
    }

    function set(address _addr1, uint256 _i, bool _boo) public {
        nested[_addr1][_i] = _boo;
    }

    function remove(address _addr1, uint256 _i) public {
        delete nested[_addr1][_i];
    }
}
