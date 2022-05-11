// SPDX-License-Identifier: MIT 

pragma solidity 0.8.10;

contract RawCounter {
    uint256 public counter;
    
    constructor() {
    } 

    function increment() external {
        counter ++;
    }
}