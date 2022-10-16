// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.7;

contract testContract { 

    uint nombre;
    address owner;

   constructor() {
       owner = msg.sender;
   }

   modifier isOwner(){
       require(msg.sender == owner , 'Your not owner !');
       _;
   }

    function setNombre(uint _nombre) public isOwner {
        nombre = _nombre;
    }

    function getNomber() public view isOwner returns(uint){
        return nombre;
    }


}