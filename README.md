# Hardhat Project - MultiSwap

This project was designed using hardhat to execute a Multiswap trade accross Bancor, Sushi & UniSwap. This contract demonstrates a use case for arbitrage accross DEX's.
Logic for platform specific access points are stored in their respective contracts (BancorSwap.sol).
MultSwap.sol contains the main logic for the single transaction call, inheriting from the contracts created above. 

**This is a work in progress**

Try running some of the following tasks:

```shell
npx hardhat accounts
npx hardhat compile
npx hardhat clean
npx hardhat test
npx hardhat node
node scripts/sample-script.js
npx hardhat help
```
