pragma solidity ^0.4.18;

import 'zeppelin-solidity/contracts/lifecycle/Destructible.sol';
import 'zeppelin-solidity/contracts/token/BasicToken.sol';

contract MyContract is Destructible, BasicToken {
  function MyContract(address initialAccount, uint256 initialBalance) public {
    balances[initialAccount] = initialBalance;
    totalSupply = initialBalance;
  }
}