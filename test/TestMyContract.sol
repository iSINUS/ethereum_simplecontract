pragma solidity ^0.4.18;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/MyContract.sol";

contract TestMyContract {
  function testInitialBalanceUsingDeployedContract() {
    MyContract meta = MyContract(DeployedAddresses.MyContract());

    uint expected = 1 ether;

    Assert.equal(meta.balanceOf(tx.origin), expected, "Owner should have 1 ether initially");
  }
}