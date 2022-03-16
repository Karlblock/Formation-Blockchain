pragma solidity ^0.8.11;

contract test {
   
    uint nombre;

    function getNombre() public view returns(uint) {
        return nombre;
    }
    function setNombre(uint _nombre) public {
        nombre = _nombre;
        
    }
}