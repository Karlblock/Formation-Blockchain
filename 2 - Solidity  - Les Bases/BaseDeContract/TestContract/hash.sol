// SPDX-License-Identifier: UNLICENSED";
pragma solidity ^0.8.4; 
  
// On crée notre contract
contract exhask {
    // on déclare une variable uint 
    uint hashDigits = 8;
      
    // Equivalent to 10^8 = 8
    uint hashModulus = 10 ** hashDigits;

    uint[] hashOfGameur; 

    struct Player {
        string name;
        uint level;
        string legion;
    }

    mapping(address => uint) Players;
  

    function _generateRandom(string memory _str, string memory _strke, uint _hashOfGamer) public view returns (uint) {

        uint random =  uint(sha256(abi.encodePacked(_str)));

        uint randomke = uint(keccak256(abi.encodePacked(_strke)));

        uint randomTotal = random && randomke ;

        delete random;
        delete randomke;
       
        return  randomTotal % hashModulus;
        
    }

    
  
}