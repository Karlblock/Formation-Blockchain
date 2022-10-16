// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.11;

contract Exercice {

    enum etape { commander, expedier,livre} //renvoi un entier et nom une chaine de caractere ! 

    struct produit {
        uint _SKU;
        Exercice.etape _etape;
    }

    mapping( address => produit) CommendeClient;


//commander le produit :
     function commander(address _client, uint _SKU) public {
         produit memory p = produit(_SKU, etape.commander);
         CommendeClient[_client] = p;
     }
// expedier le produit : 
     function expedier(address _client) public {
         CommendeClient[_client]._etape = etape.expedier;
     }
// recuperer le SKU du client :
     function getSKU(address _client) public view returns(uint) {
         return CommendeClient[_client]._SKU;
     }

// recupere l'étape d'envoi du client : 
     function getEtape(address _client) public view returns(etape) {
         return CommendeClient[_client]._etape;
}
}