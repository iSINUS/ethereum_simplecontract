var MyContract = artifacts.require("./MyContract.sol");

module.exports = function(deployer) {
  deployer.deploy(MyContract,"0x627306090abaB3A6e1400e9345bC60c78a8BEf57",web3.toWei("100","ether"));
};
