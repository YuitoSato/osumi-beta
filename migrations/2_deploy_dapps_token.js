var Osumi = artifacts.require("./Osumi.sol");
var OsumiQAService = artifacts.require("./OsumiQAService.sol");

module.exports = function(deployer) {
  var initialSupply = 1000e18;
  deployer.deploy(Osumi, initialSupply, {
    gas: 2000000
  });
  deployer.deploy(OsumiQAService, {
    gas: 2000000
  });
};
