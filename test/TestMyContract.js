var MyContract = artifacts.require("./MyContract.sol");

contract('MyContract', function(accounts) {  
  it("should check events", function() {
    var meta;

    return MyContract.deployed().then(function(instance) {
      meta = instance;    
    
      return meta.transferFrom(accounts[0],accounts[1],1);      
     }).then(function(result){
      for (var i = 0; i < result.logs.length; i++) {
        if (result.logs[i].event == "Transfered") {
          return result.logs[i];
        }
      } 
    }).then(function(event){

      assert.equal(event.args.from, accounts[0], event.event +": from");
      assert.equal(event.args.to, accounts[1], event.event +": to");
      assert.equal(event.args.value.toNumber(), 1, event.event +": value");
    });
    
  });
});
