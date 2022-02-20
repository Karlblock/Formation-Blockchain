// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract FactoryNumber {

    Number[] numberContracts;
   

    function createNumberContract() external returns(address) {
        Number n = new Number(100);
        numberContracts.push(n);
        return address(n);

    }

   

    function getNumberByContract(Number _Contract) external view returns(uint) {
        return _Contract.getNumber();
    }
    function setNumberByContract(Number _Contract, uint _number) external {
        _Contract.setNumber(_number);
    } 

}

contract Number {
    uint number;

    constructor(uint _number) {
        number = _number;
    }

    function getNumber() external view returns(uint) {
        return number;
    }

    function setNumber(uint _number) external {
        number = _number;
    }

}