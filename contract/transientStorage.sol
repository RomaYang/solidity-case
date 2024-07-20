// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "hardhat/console.sol";

interface ITest {
    function val() external view returns (uint256);

    function test() external;
}

contract Callback {
    uint256 public val;

    fallback() external {
        val = ITest(msg.sender).val();
    }

    function test(address target) external {
        ITest(target).test();
    }
}

contract TestStorage {
    uint256 public val;

    function test() public {
        val = 123;
        bytes memory b = "";
        msg.sender.call(b);
    }
}

contract TestTransientStorage {
    bytes32 constant SLOT = 0;

    function test() public {
        assembly {
            tstore(SLOT, 321)
        }
        bytes memory b = "";
        msg.sender.call(b);
    }

    function val() public view returns (uint256 v) {
        assembly {
            v := tload(SLOT)
        }
    }
}

contract ReentrancyGuard {
    bool private locked;

    modifier lock() {
        require(!locked);
        locked = true;
        _;
        locked = false;
    }

    // 35313 gas
    function test() public lock {
        // Ignore call error
        bytes memory b = "";
        msg.sender.call(b);
    }
}

contract ReentrancyGuardTransient {
    bytes32 constant SLOT = 0;

    modifier lock() {
        assembly {
            if tload(SLOT) {
                revert(0, 0)
            }
            tstore(SLOT, 1)
        }
        _;
        assembly {
            tstore(SLOT, 0)
        }
    }

    // 21887 gas
    function test() external lock {
        // Ignore call error
        bytes memory b = "";
        msg.sender.call(b);
    }
}

// //建一個contract，需先佈署到區塊鏈上面，後面interface才能調用
// contract Counter {
//     uint public count;
//     function increment() external {
//     count ++;//每次調用就+1
// }
// }
// //實現function接口
// interface ICounter {
//     function increment() external;
// }

// contract MyContract {
//     //從接口去調用另外一個smart contract
//     function incrementCounter(address _counter) external {
//         ICounter(_counter).increment();
//     }
// }
