// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract rawProxy {
    bytes32 private constant implementationPosition =
        keccak256("implementation.contract.torekko:2022");
    bytes32 private constant proxyOwnerPosition =
        keccak256("owner.contract.torekko:2022");

    event Upgraded(address indexed implementation);
    event ProxyOwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    constructor(address _impl) {
        _setUpgradeabilityOwner(msg.sender);
        _setImplementation(_impl);
    }

    modifier onlyProxyOwner() {
        require(msg.sender == proxyOwner(),"Torekko: Not the proxy owner");
        _;
    }

    function proxyOwner() public view returns (address owner) {
        bytes32 position = proxyOwnerPosition;
        assembly {
            owner := sload(position)
        }
    }

    function implementation() public view returns (address impl) {
        bytes32 position = implementationPosition;
        assembly {
            impl := sload(position)
        }
    }
    
    function transferProxyOwnership(address _newOwner) public onlyProxyOwner {
        require(_newOwner != address(0), "Torekko: Invalid new owner address");
        emit ProxyOwnershipTransferred(proxyOwner(), _newOwner);
        _setUpgradeabilityOwner(_newOwner);
    }

    function upgradeTo(address _newImplementation) public onlyProxyOwner {
        address currentImplementation = implementation();
        require(currentImplementation != _newImplementation, "Torekko: Invalid current implementation");
        _setImplementation(_newImplementation);
        emit Upgraded(_newImplementation);
    }

    function _setImplementation(address _newImplementation) internal {
        bytes32 position = implementationPosition;
        assembly {
            sstore(position, _newImplementation)
        }
    }

    function _setUpgradeabilityOwner(address _newProxyOwner) internal {
        bytes32 position = proxyOwnerPosition;
        assembly {
            sstore(position, _newProxyOwner)
        }
    }
    
    function _delegatecall() internal {
        address _impl = implementation();
        require(_impl != address(0), "Impl address is 0");

        assembly {
            calldatacopy(0, 0, calldatasize())
            let result := delegatecall(
                gas(),
                _impl,
                0,
                calldatasize(),
                0,
                0
            )
            let size := returndatasize()
            returndatacopy(0, 0, size)

            switch result
            case 0 {
                revert(0, size)
            }
            default {
                return(0, size)
            }
        }
    }

    fallback() external payable {
        _delegatecall();
    }

    receive() external payable {}
}
