

//  SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

function getEvens() pure external returns(uint[] memory ) {
  uint[] memory evens = new uint[](5);
  // On suit l'index du nouveau tableau
  uint counter = 0;
  // On itère de 1 à 19 avec une boucle `for` :
  for (uint i = 1; i <= 10; i++) {
    // Si `i` est pair...
    if (i % 2 == 0) {
      // On l'ajoute au tableau
      evens[counter] = i;
      // On incrémente le `counter` de 1 :
      counter++;
    }
  }
  return evens;
}