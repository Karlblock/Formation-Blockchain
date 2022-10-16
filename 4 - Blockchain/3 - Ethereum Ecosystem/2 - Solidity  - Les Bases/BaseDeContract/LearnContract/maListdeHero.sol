// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.7;

contract Owner { 

    address owner;

      constructor() {
        owner = msg.sender;   
    }

    modifier isOwner() {
        require(owner == msg.sender, 'You are not the Owner');
        _;
    }

}

contract heroSquad is Owner { 

    uint balanceOfAddresofHeros;

    enum classe {sorcier, warrior, gladiator, necromanceur}

    struct wallet {
        uint balance;
        uint numCombat;
    }

    struct hero {
        uint life;
        uint level;
        string nameofHero;
        classe _classe;
        mapping(uint => inventaire ) Inventaire;
    }

    struct inventaire {
        uint soin;
        uint mana;
 
    }
    mapping (address => uint) public balances;
    mapping(address => wallet) Wallets;
    mapping(address => hero) Heros;

    function addHero(address _addresshero, string  memory _nameOfHero, uint _level, classe _classe) public isOwner {
        bytes memory nameofHeroOfAddress = bytes(Heros[_addresshero].nameofHero);
        require(nameofHeroOfAddress.length == 0, "Name of hero is occuped ! ");
        require(uint(_classe) >= 0, 'La classe doit etre choisie');
        require(uint(_classe) >= 2, 'La classe doit etre choisie');
        Heros[_addresshero].nameofHero = _nameOfHero;
        Heros[_addresshero].level = 1;
     }

     function getHero( address _addresshero) public view returns(string memory) {
          string memory nameOfTheCurrentHeros = Heros[_addresshero].nameofHero;
          return nameOfTheCurrentHeros ; 
     }

     function setAttack(address _Fromaddresshero, address _toAddressHero, uint _valueAttack) public {

         // require _Fromaddresshero have 0.01 bnb in balance 
         require(_valueAttack <= balances[msg.sender], "Insufficient balance.");

         // _Fromaddresshero has hero
        require Heros[msg.sender];


         // require _toAddressHero has hero

         // requie _Fromaddresshero and _toAddressHero hero's has full life

         // _Fromaddresshero attack _toAddressHero

         // return resultat

         // envoi balance in winner wallet

         //reset life of all heros 

     }

     function getBalanceOfAddressHeros() public view returns(uint) {
         return Wallets[msg.sender].balance;
     }

      receive() external payable{
        Wallets[msg.sender].balance += msg.value;
        Wallets[msg.sender].numCombat += 1;
    }

}