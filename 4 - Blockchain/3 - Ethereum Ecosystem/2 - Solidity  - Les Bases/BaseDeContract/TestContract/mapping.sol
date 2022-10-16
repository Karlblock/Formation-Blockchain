//SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract SimpleMappingExample {

    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping;
    mapping(uint => mapping(uint => bool)) uintUintBoolMapping;

   
    function setUintUintBoolMapping(uint _index1, uint _index2, bool _value) public {
        uintUintBoolMapping[_index1][_index2] = _value;
    }

    function getUintUintBoolMapping(uint _index1, uint _index2) public view returns (bool) {
        return uintUintBoolMapping[_index1][_index2];
    }

    function setValue(uint _index) public {
        myMapping[_index] = true;
    }

    function setMyAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }
}


// Mapping are an interesting datatype in Solidity. They are accessed like arrays, but they have one major advantage: All key/value pairs are initialized with their default value.

// If you have a look at the example Smart Contract, you'll see that we have two mappings.

// One, that maps uint256 to booleans, that's called myMapping. Another one that maps addresses to booleans, that we called myAddressMapping.

// We can access a mapping with the brackets []. If we want to access the key "123" in our myMapping, then we'd simply write myMapping[123].

// Our mappings here are public, so Solidity will automatically generate a getter-function for us. That means, if we deploy the Smart Contract, we will automatically have a function that looks technically like this:


// function myMapping(uint index) returns (bool) {
//     return myMapping[index];
// }
// We don't need to explicitly write the function. Also not for myAddressMapping. Since both are public variables, Solditiy will add these auto_magic_ally.