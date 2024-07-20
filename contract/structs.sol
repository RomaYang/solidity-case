// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "hardhat/console.sol";
import "./struct.sol";

contract Structs {
    // struct Todo {
    //     string text;
    //     bool completed;
    // }

    Todo[] public todos;

    function create(string calldata _text, bool _completed) public {
        todos.push(Todo(_text, _completed));

        // todos.push(Todo({text: _text, completed: _completed}));

        // Todo memory todo;
        // todo.text = _text;
        // todo.completed = _completed;
        // todos.push(todo);
    }

    function updateText(uint256 _index, string calldata _text) public{
        // Todo memory todo = todos[_index];
        // todo.text = _text;
        todos[_index].text = _text;
    }

    function toggleCompleted(uint256 _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }

    function get() public view returns(Todo[] memory){
        return todos;
    }
}
