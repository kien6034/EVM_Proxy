// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// Open Zeppelin libraries for controlling upgradability and access.
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract UupsCounter is Initializable, UUPSUpgradeable, OwnableUpgradeable {
   uint256 public counter;
  
      ///@dev no constructor in upgradable contracts. Instead we have initializers
   function initialize(uint256 slice_) public initializer {
      counter = slice_;

      ///@dev as there is no constructor, we need to initialise the OwnableUpgradeable explicitly
       __Ownable_init();
   }

   ///@dev required by the OZ UUPS module
   function _authorizeUpgrade(address) internal override onlyOwner {}

   function increment() external {
       counter += 1;
   }
}