// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.11;

contract test {

    uint nombre; // = private
    uint private nombre1;
    uint internal nombre2; //ok pour heritage
    uint public nombre3; // peut être lu de partout 


    function _setNombre(uint _nombre) internal {
        nombre = _nombre;
    }

    function getNomber() public view returns(uint) {
        return nombre;
    }


}
