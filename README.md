# EVM Proxy 

This contract contains the script and source code demo for a better understanding of Proxy in EVM, as well as providing scripts to use Openzeppelin Upgradable Proxy using Hardhat 

Three criterias: 
- Transparent Proxy 
- UUPS Pattern

### Abstract 
What is contract upgradable? How can we upgrade the contract? 

- Migrate contract V1 -> V2 
- ... 
- Proxy Upgrade using delegate call

![BeforeUpgrade](data/image/abstract/proxy1.png)

![UpgradeToNewImpl](data/image/abstract/proxy2.png)

### Transparent Proxy 
Transparent proxy implements a proxy contract that is upgradable via an admin contract
The upgrability function is implemented in the proxy contract.

  - If any account other than the admin calls the proxy, the call will be forwarded to the implementation 
![userCall](data/image/transparent/adminCall.png)

  - If the admin call the proxy, it can access the admin function, but it calls will never go to the implemenetation
![userCall](data/image/transparent/userCall.png)

- Openzeppelin using an Admin contract to manage contract upgrade
![proxyAdmin](data/image/transparent/proxyAdmin.png)

### UUPS Proxy 
Transparent proxy implements a proxy contract that is upgradable via a custom proxy admin
The upgrability function is implemented in the implementation contract.

![uupsProxy](data/image/uups/uups.png)


### Comparision 
- Gas cos 
![gasCost](data/image/comparision/gas.png)

- General
| Security                                            | Transparent Proxy                                              | UUPS Proxy                                                                                                                        |
| --------------------------------------------------- | ------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------- |
| Deployment Fee |  ~ 1200k gas limit |  390k gas limit |
| Implementation Deployment | + 0 | + 320 k gas limit |
| Runtime overhead | 7.3k | 4.9k |



### Appendixes
 - https://docs.openzeppelin.com/contracts/3.x/api/proxy
 - https://github.com/OpenZeppelin/openzeppelin-contracts/tree/master/contracts/proxy

