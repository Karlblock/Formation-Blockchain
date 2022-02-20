pragma solidity 0.8.7;

contract A {

    address addressB;

    function setAdressB(address _addressB) external {
        addressB = _addressB;
    }

    function appelGetnombre() external view returns(uint){
        B b = B(addressB);
        return b.getNombre();
    }
    function appelSetNombre(uint _nombre) external{
        B b = B(addressB);
        b.setnombre(_nombre);
    }
}


contract B {

    uint nombre;

    function setnombre(uint _nombre) external view {
     nombre = _nombre;

    }
    function getNombre() external view returns(uint) {
     return nombre;
    }
}