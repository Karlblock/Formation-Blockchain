// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.11;

contract dataStore { 
    uint nombre; // virable de type storage
    uint[] public monArray;

    function fairequelquechose() external {
        monArray.push(2);
        monArray.push(3);

        uint[] storage newArray = monArray;

        newArray[0] = 0;
    }
}