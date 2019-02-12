// handles deploying smart contracts
var Adoption = artifacts.require("Adoption");

module.exports = function(deployer) {
	deployer.deploy(Adoption);
}