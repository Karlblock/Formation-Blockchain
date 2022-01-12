// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.11;

contract testMapping {

    mapping(address => uint) Balances; //correler les adresses avec le nombre d'argent dans le contract
     
     
    function getBalance(address _monAddress) public view returns(uint) {
        return Balances[_monAddeess]; // key > valeur
    }

      receive() external payable {
          //msg.value

        Balances[msg.sender] = msg.value;
}