// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.7;

import './owner.sol';

contract testContract is Owner { 

    uint nombre;
    
    function setNombre(uint _nombre) public isOwner {
        nombre = _nombre;
    }

    function getNomber() public view isOwner returns(uint){
        return nombre;
    }


}