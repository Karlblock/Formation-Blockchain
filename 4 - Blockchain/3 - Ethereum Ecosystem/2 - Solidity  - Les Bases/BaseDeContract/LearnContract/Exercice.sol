// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.11;

contract Exercice {
// chaque eleve sera raccord un tableau de note
        struct eleve {
            string nom;
            string prenom;
            uint[] notes; 
        }
 //correspondre une adresse avec un eleves:
        mapping(address => eleve ) Eleves;  
 //ajouter une note à un eleve dans le tableau .push dans le tableaui de l'éléve grace au mapping 
        function addNotes( address _eleve, uint _notes) public {
            Eleves[_eleve].notes.push(_notes);

        }
//recuperer la ou les  note de l'éléve :
        function getNotes(address _eleve) public view returns(uint[] memory){ 
            return Eleves[_eleve].notes;

        }
//changer le nom de l'éléve :  
        function setNom(address _eleve, string memory _nom) public {
            Eleves[_eleve].nom = _nom;

        }
// get nom de l'éléve :
        function getNom(address _eleve) public view returns(string memory) {
            return Eleves[_eleve].nom;
        }
 }