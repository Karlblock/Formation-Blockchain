// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract MyFirstContract {
    string private name;
    uint private age;


   // on confirgure un setter string qui aura une entrée en mémoire temporaire le temps de l'excution 
   function setName(string memory _newName) public {
        name = _newName;
    }
    // ici on n'a trois parametre  public (la function est public), view, returns
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