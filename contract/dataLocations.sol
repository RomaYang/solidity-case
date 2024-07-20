// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "hardhat/console.sol";

contract DataLocations {
    uint256[] public arr;
    mapping(uint256 => address) map;
    struct MyStruct {
        uint256 foo;
    }

    mapping(uint256 => MyStruct) myStructs;

    function f() public {
        _f(arr, map, myStructs[1]);

        myStructs[1] = MyStruct(888);

        // get a struct from a mapping
        MyStruct storage myStruct = myStructs[1];
        // create a struct in memory
        MyStruct memory myMemStruct = MyStruct(0);
    }

    function get() public view returns(MyStruct memory){
        return myStructs[1];
    }

    function _f(
        uint256[] storage _arr,
        mapping(uint256 => address) storage _map,
        MyStruct storage _myStruct
    ) internal {}

    function g(uint256[] memory _arr) public returns (uint256[] memory) {}

    function h(uint256[] calldata _arr) external {}
}
