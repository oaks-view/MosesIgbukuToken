const MosesIgbukuToken = artifacts.require("MosesIgbukuToken");
const dotenv = require('dotenv');
dotenv.config();

const intialSupply = +process.env.INITIAL_SUPPLY || 2000000;

module.exports = function(deployer) {
  deployer.deploy(MosesIgbukuToken, intialSupply);
};
