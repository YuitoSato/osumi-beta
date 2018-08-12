var Osumi = artifacts.require("./Osumi.sol");

module.exports = function(deployer) {
  var initialSupply = 1000e18;
  deployer.deploy(Osumi, initialSupply, {
    gas: 2000000
  });
};
