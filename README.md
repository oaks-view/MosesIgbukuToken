# MosesIgbukuToken

This project contains a smart contract with unit tests and migration configuration for an ERC20 compliant token.
The ERC20 Token contract is named MosesIgbukuToken.

### Prerequisites
To setup and run the project, an individual machine requires a working version of node and npm.
This project was bootstraped using node --version v8.9.4 and npm 5.6.0. It is recommended to use at least this version of the node and npm dependencies. Here is a good tutorial on how to install nodejs
using [nvm](https://nodesource.com/blog/installing-node-js-tutorial-using-nvm-on-mac-os-x-and-ubuntu/).

## Install
To clone project execute the following command from terminal
`git clone https://github.com/oaks-view/MosesIgbukuToken.git`
Assuming that the project is already cloned. Open a new terminal window and navigate into the project directory and into the root folder. Then
* Run the following command `npm install`
* Next theres need to setup some environmental variables which are all listed in a `.env` file found
in the projects root directory. These variables used as config values for the files `truffle-config.js` and `2_deploy_contracts.js`. See [truffle documentation](https://www.trufflesuite.com/docs/truffle/getting-started/running-migrations) for details.

## Migrate Contract
To migrate the token contract, in a terminal window navigate into the root directory of the project(if not there already) and execute the command `npm run migrate`. 
This will compile and migrate the token contract to the configured ethereum node.

## Running unit tests
To run unit tests simply navigate to the root directory of the project and execute the following command `npm test`.

## linting
In the root directory of the project execute the following command to run linting analysis on smart contract.
`npm run lint`

## Author

[Moses Igbuku](https://www.linkedin.com/in/moses-igbuku-23099010b/)

## License

 - **ISC** : http://opensource.org/licenses/ISC
