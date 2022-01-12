
Les prérequis :

vérifier les versions de votre env :

    PS D:\DEV\FORMATION\Openkarl> node -v
    v16.13.1
    PS D:\DEV\FORMATION\Openkarl> npm -v
    7.8.0

    npm install nodejs
    

vscode => En anglais avant que je m'occupe de ma vidéo 
[configurer son vsCode pour solidity(en)](https://www.youtube.com/watch?v=4bzPE9ydGlo)

Créer ton repertoire et initier ton environement local : 

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


