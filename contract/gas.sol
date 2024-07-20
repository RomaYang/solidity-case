// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "hardhat/console.sol";

contract Gas {
    uint256 public i = 0;

    function forever() public {
        while (true) {
            // if (i > 1000) {
            //     break;
            // }
            i += 1;
        }
    }
}
