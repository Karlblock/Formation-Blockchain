```
library SafeMath {

  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}
```

Tout d'abord, nous avons le mot-clé library (bibliothèque) - les bibliothèques sont similaires aux contrats avec quelques différences. Dans ce cas là, les bibliothèques nous permettent d'utiliser le mot-clé using (utiliser), qui va automatiquement rajouter toutes les méthodes de cette bibliothèque à un autre type de donnée :
```
using SafeMath for uint;

// Nous pouvons maintenant utiliser ces méthodes pour n'importe quel uint
uint test = 2;
test = test.mul(3); // test est maintenant égal à 6
test = test.add(5); // test est maintenant égal à 11
````
Vous remarquerez que mul et add ont chacune besoin de 2 arguments, mais quand on déclare using SafeMath for uint, le uint qui appelle la fonction (test) est automatiquement passé comme premier argument.

Regardons le code de add pour voir ce que fait SafeMath :

```function add(uint256 a, uint256 b) internal pure returns (uint256) {
  uint256 c = a + b;
  assert(c >= a);
  return c;
}```

add ajoute simplement 2 uint comme +, mais elle contient aussi une déclaration assert (affirme) pour vérifier que la somme est plus grande que a. Cela nous protège d'un débordement.

assert est la même chose que require, et va renvoyer une erreur si ce n'est pas vérifié. La différence entre assert et require c'est que require va rembourser l'utilisateur du gas restant quand la fonction échoue, alors que assert non. La plupart du temps vous allez vouloir utiliser require dans votre code, assert est plutôt utilisé quand quelque chose a vraiment mal tourné avec le code (comme un débordement d'uint).

Pour résumer, add, sub, mul, et div de SafeMath sont des fonctions qui font les 4 opérations mathématiques basiques, et qui renvoient une erreur en cas de débordement

Utiliser SafeMath dans notre code
Pour prévenir les débordements, nous pouvons voir les endroits dans notre code où nous utilisons +, -, *, ou /, et les remplacer par add, sub, mul, div.

Ex. A lieu d'écrire :

 ```myUint++;```
On va écrire :

```myUint = myUint.add(1);```