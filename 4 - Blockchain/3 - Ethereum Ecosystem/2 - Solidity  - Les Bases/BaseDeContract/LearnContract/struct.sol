// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.11;

contract testMapping {

    struct balance{
        uint money;
        uint numPayments;
    }

    mapping(address => balance) Balances; //correler les adresses avec le nombre d'argent dans le contract
     
     
    function getBalance() public view returns(uint) {
        return Balances[msg.sender].money; // key > valeur
    }

    function getnumPayments() public view returns(uint){
         return Balances[msg.sender].numPayments; // key > valeur // retourne le nombre de payment que l'address à appelé la function 
    }

      receive() external payable {
          //msg.value contient la valeur des eth transmis
          //msg.sender contient l'adresse de la personne appelant la function ou la transaction
        Balances[msg.sender].money += msg.value;
        Balances[msg.sender].numPayments += 1;
        }
}