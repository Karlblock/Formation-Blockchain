// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;

import './contractB.sol';

contract A {

    address addressB;

    function setAdressB(address _addressB) external {
        addressB = _addressB;
    }

    function appelGetnombre() external view returns(uint){
        interfaceB b = interfaceB(addressB);
        return b.getNombre();
    }
    function appelSetNombre(uint _nombre) external{
        interfaceB b = interfaceB(addressB);
        b.setNombre(_nombre);
    }
}