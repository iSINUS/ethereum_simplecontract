pragma solidity ^0.4.18;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/MyContract.sol";

contract TestMyContract {
  function testInitialBalanceUsingDeployedContract() {
    MyContract meta = MyContract(DeployedAddresses.MyContract());

    uint expected = 100 ether;

    Assert.equal(meta.balanceOf(tx.origin), expected, "Owner should have 100 ether initially");
  }

  function testInitialBalance() public {
    uint expected = 100 ether;

    address transfer_from = address(0xC5fdf4076b8F3A5357c5E395ab970B5B54098Fef);
    MyContract meta = new MyContract(transfer_from, expected);

    Assert.equal(meta.balanceOf(transfer_from), expected, "Owner should have 10 ether initially");

  }

   function testTransfer() {
    uint expected = 100 ether;

    address transfer_from = address(0xC5fdf4076b8F3A5357c5E395ab970B5B54098Fef);
    MyContract meta = new MyContract(transfer_from, expected);

    uint transferValue = 1 ether;
    address transfer_to = address(0xf17f52151EbEF6C7334FAD080c5704D77216b732);
  
    Assert.equal(meta.transferFrom(transfer_from, transfer_to, transferValue), true, "Tranfer should be success");
    Assert.equal(meta.balanceOf(transfer_to), transferValue, "Account from should have 1 ether");
    Assert.equal(meta.balanceOf(transfer_from), expected-transferValue, "Account to should have 99 ether");

    Assert.equal(meta.transferFrom(transfer_to, transfer_from, transferValue), true, "Tranfer should be success");
    Assert.equal(meta.balanceOf(transfer_to), 0, "Account to should have 0 ether");
    Assert.equal(meta.balanceOf(transfer_from), expected, "Account from should have 100 ether initially");
  } 

}