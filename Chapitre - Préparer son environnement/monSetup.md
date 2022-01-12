
Les prérequis :
    nodejs
    npm
    vscode => En anglais avant que je m'occupe de ma vidéo [configurer son vsCode pour solidity (en)](https://www.youtube.com/watch?v=4bzPE9ydGlo)

Crée ton repertoire  et initié ton environement  : 

    mkdir tonDossier 
    cd tonDossier :
    npm init -y
    npm install --save-dev hardhat
    npx hardhat
    npm install --save-dev @nomiclabs/hardhat-waffle ethereum-waffle chai @nomiclabs/hardhat-ethers ethers

Faire son premier test : 

    npx hardhat accounts
    npx hardhat compile  
    npx hardhat test
