// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// Open Zeppelin libraries for controlling upgradability and access.
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";


contract TransparentCounter is Initializable {
    uint256 public counter;
   
    function __Counter_init(uint256 counter_) public initializer {
        ///@dev as there is no constructor, we need to initialise the OwnableUpgradeable explicitly
        counter = counter_;
    }

    function increment() external {
        counter += 1;
    }
}