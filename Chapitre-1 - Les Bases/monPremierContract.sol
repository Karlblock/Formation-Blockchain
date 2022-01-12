// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract MyFirstContract {
    string private name;
    uint private age;


   function setName(string memory _newName) public {
        name = _newName;
    }
    
    function getName() public view returns (string memory) {
        return name;
    }
    
    function setAge(uint _newAge) public {
        age = _newAge;
    }
    
    function getAge() public view returns (uint) {
        return age;
    }
}