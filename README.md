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

Transparent proxy implements a proxy contract that is upgradable via proxy an admin
  - If any account other than the admin calls the proxy, the call will be forwarded to the implementation 
![userCall](data/image/transparent/adminCall.png)

  - If the admin call the proxy, it can access the admin function, but it calls will never go to the implemenetation
![userCall](data/image/transparent/userCall.png)

Openzeppelin using an Admin contract to manage contract upgrade
![proxyAdmin](data/image/transparent/proxyAdmin.png)

### UUPS Proxy 


![TransparentProxy](data/image/transparent/transparentProxy.png)



### Appendixes
 - https://docs.openzeppelin.com/contracts/3.x/api/proxy
 - https://github.com/OpenZeppelin/openzeppelin-contracts/tree/master/contracts/proxy

