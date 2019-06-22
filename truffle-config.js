const HDWalletProvider = require('truffle-hdwallet-provider');
require('dotenv').config();

module.exports = {
  networks: {
    development: {
      host: process.env.GANACHE_HOST,
      port: process.env.GANACHE_PORT,
      network_id: "*"
    },
    rinkeby: {
      provider: () => new HDWalletProvider(process.env.MNEMONIC,process.env.REMOTE_NODE),
      network_id: 4
    }
  }
};
