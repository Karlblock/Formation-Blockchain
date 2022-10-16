// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.7;

contract GestionnairedeEleve { 

    address owner;
    
    struct Grade {
        string subject;
        uint grade;
    }

    // un eleve à la structure Student un nom un prenom et un mapping pour relier un eleve à ses notes
    struct Student {
        string fisrtName;
        string lastName;
        uint nombreOfGrades;
        mapping(uint => Grade) grades; // on map son adresse à la struture de ses notes 
    }

    //chaque eleve est representé par une adresse
    mapping(address => Student) students; 

    constructor() {
        owner = msg.sender;
    }


    function addStudent(address _studentAddress, string memory _firstName, string memory _lastName) public {
        require(msg.sender == owner, "You are not the owner ! ");
        // recuperer l'address de l'eleve et voir si il y a déja un prénom assigner
        bytes memory fisrtNameOfAddress = bytes(students[_studentAddress].fisrtName); 
        require(fisrtNameOfAddress.length == 0, "Existe Deja");
        students[_studentAddress].fisrtName = _firstName;
        students[_studentAddress].lastName = _lastName;
    }

    function addGrade(address _studentAddress, uint _grade, string memory _subject) public {
        require(msg.sender == owner, "You are not the owner ! ");
        bytes memory fisrtNameOfAddress = bytes(students[_studentAddress].fisrtName);
        require(fisrtNameOfAddress.length > 0, " il faut creer un eleve ");
        students[_studentAddress].grades[students[_studentAddress].nombreOfGrades].grade = _grade;
        students[_studentAddress].grades[students[_studentAddress].nombreOfGrades].subject = _subject;
        students[_studentAddress].nombreOfGrades++;
    }  

    function getGrades(address _studentAddress) public view returns(uint[] memory) {
        require(msg.sender == owner, "You are not the owner ! ");
        uint numberGradesThisStudents = students[_studentAddress].nombreOfGrades; // récupere le nombre de note d'un eleve
        uint[] memory grades = new uint[](numberGradesThisStudents);
        for(uint i = 0 ; i < numberGradesThisStudents ; i++) {
            grades[i] = students[_studentAddress].grades[i].grade;
        }
        return grades;

    }
}
