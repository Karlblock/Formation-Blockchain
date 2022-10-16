// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract conditionnelle {

    uint nombre;

    function setNombre(uint _nombre) public {
    if(_nombre == 5 ){
        revert(' not possible');
        }
        else {
        nombre = _nombre;
        }
    }

    bool isPaused;
    function paused() pulbic {
        if(isPaused) {
            isPaused = false;
        }
        else{
            isPaused =true;
        }
    }

    uint nombre = 10;

    function compter() public {
        for(uint i = 0; i < nombre ; i++) { // (initialisation ; condition ; action )
            //9
        } 
    }

      uint nombre = 10;

    function compter() public {
        for(uint i = 0; i < nombre ; i++) { // (initialisation ; condition ; action )
            if(i == 5) {
            break;
            }
        } 
    }



    bool isPaused;
    function paused() pulbic {
        while(!isPaused) {
            if (...) {
                isPaused = true;
            }
        } // tant que ispaused est = false alors {
    }




}
