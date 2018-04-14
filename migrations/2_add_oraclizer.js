var Oraclizer = artifacts.require("./Oraclizer.sol");

module.exports = function(deployer) {
    deployer.deploy(Oraclizer);
};
