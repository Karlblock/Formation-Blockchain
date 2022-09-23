// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

contract ValueTypes {
    // Write your code here
     bool public b = true;
     
     int public i = -1;
     
     uint public u = 123;
     
     address public addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
     
     bytes32 public b32 = 0x89c58ced8a9078bdef2bb60f22e58eeff7dbfed6c2dff3e7c508b629295926fa;


  
    function add(uint x, uint y) external pure returns (uint) {
        return x + y;
    }
    
    function sub(uint x, uint y) external pure returns (uint) {
        return x - y;
    }



}
