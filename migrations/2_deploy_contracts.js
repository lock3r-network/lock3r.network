var Lock3r = artifacts.require("./contracts/Lock3r.sol");

module.exports = function(deployer) {
  deployer.deploy(Election);
};