

# DAPP for Uploading File to IPFS and Ethereum

Upload files to IPFS and save hash on ethereum block chain. 
## Prerequisites (Environment Setup)
We need  to setup our environment for this to run. Please install these Tools/Packages before moving forward. 
 - Solidity
 - Truffle
 - Ganach
 - MetaMask
 - IPFS


## Step 1- Setting up IPFS
IPFS is built upon peer to peer hyper media protocol. It help in saving files on peer to peer network without a centralized authority. You can check it out here [IPFS](https://ipfs.io/)

 1.  [Install](https://ipfs.io/docs/install/) IPFS
 2. Open cmd in the root location of IPFS Installation directory and run command **ipfs init**
 3. run a daemon by command **ipfs daemon**

## Step 2- Install Solidity
Ethereum contracts are written in solidity. Solidity is closely related to javascript in its basic structure. We need to install solidity for writing our contracts.
>rum command **npm install -g solc** from your console

## Step 3- Install Truffle
Install truffle by running **npm install -g truffle** 
> you have to install Node before this if you don't already have

## Step 4- Install Ganache
for the simplicity sake i am using Ganache for Ethereum block chain. You can use geth too. Ganache gives you 10 accounts on the go to test with.
> [Install](https://truffleframework.com/ganache) Ganache for your OS. (I'm using windows).

## Step 5- Install Metamask

MetaMask is a browser extension which helps in interacting with DAPP from browser without setting entire Ethereum node.
> [Install](https://metamask.io/) Metamask for your browser(I am using Google Chrome)

## Step 6- Connect Metamask to Ganache

For our DAPP to connect with Ethereum account we need to connect our Metamask extension to Ganache(Ganache provides with 10 default accounts). 

 1. **Run RPC Server:** Run Ganache and check the rpc running server(mine is http://127.0.0.1:7545)
 2. **Connect Metamask to Ganache:** Run Metamask from chrome and give a pass phrase of your choice. By default metamask is connected to Main Network of Ethereum but we need to connect to our private network where we will deploying our DAPP. Click on Main Network on top left corner of Metamask. It will show a list of networks. click on custom rpc and provide your rpc server url from step 1 (http://127.0.0.1:7545 in my case)
 3. **Import Accounts in Metamask:** Open Ganache , you will see a list of accounts. We will be using first account as our default account and will give metamask to access this account for transactions. In Ganache on the right side of first account click on Key icon. It will give you a private key of that account. Now open your metamask and click on users on top right corner. You will see an option of import account. Provide your private key there. and proceed. In the main screen of Metamask you will see initial Ether of that account.

> Clone [Dapp](https://github.com/theanis046/FileUploadTruffle) and [Front End](https://github.com/theanis046/EthereumBlockChainAndIPFS) repositories if you have not already done that.

## Step 7- Deploy the contracts
Now it is the time to deploy to our contracts to our Block Chain. Move to Dapp Repository and compile the Dapp by running command **truffle compile**
it will generate the json files containing ABI for the contract. Now run command truffle **migrate --reset** to deploy the contract to the block chain.
> Verify the truffle.js for the development environment and rpc port with ganache. both should be same.

## Step 8- Run React Application(Final Step)
Move to cloned [Front End](https://github.com/theanis046/EthereumBlockChainAndIPFS) directory and run commands **npm install** and then **npm start** it will run application on **http://localhost:3000**.

#### CHEEEEEERS
Upload files and verify that hashes are being written on blockchain. 
