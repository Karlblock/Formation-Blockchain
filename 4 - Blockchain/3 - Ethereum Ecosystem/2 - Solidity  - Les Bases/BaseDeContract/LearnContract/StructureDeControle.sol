// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract controleAge {

        uint age;

        function setAge(uint _age) public {
            require(_age >= 18, "Too young  "); //rend le gas si cela est pas conforme au prérequis
       
        age = _age;
        }           

        function getAge() public view returns(uint) {  
            return age;
        }
 }
