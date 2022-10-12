# Lecture 4  - Memory 

- [Semaine 2 en anglais ](https://cs50.harvard.edu/x/2022/notes/2/)
- [Les notes 2022 en anglais ](https://cs50.harvard.edu/extension/2022/fall/notes/2/#welcome)
- [Vidéo Semaine 2](https://www.youtube.com/watch?v=ywg7cW0Txs4)

## Table des matières 

* [Bienvenue](#Bienvenue)
* [Compiler](#Compiler)
* [Deboger](#deboger)
* [Tableaux](#Tableaux)
* [String](#String)
* [Arguments de la ligne de commande](#Arguments-de-la-ligne-de-commande)
* [Statt de sortie](#Statut-de-sortie)
* [Mario](#Mario)
* [Cryptographie](#Cryptographie)
* [Résumé](#Résumé)

---

## Bienvenue

__Lien vers la vidéo  de l'[introduction](https://www.youtube.com/watch?v=AcWIE9qazLI&t)__

Au cours des semaines précédentes, nous avons parlé d'images constituées de blocs de construction plus petits appelés pixels.
Aujourd'hui, nous allons entrer plus en détail sur les zéros et les uns qui composent ces images.
De plus, nous verrons comment accéder aux données sous-jacentes stockées dans la mémoire de l'ordinateur.

## Memoire


*   Vous pouvez imaginer un drame policier où une image est améliorée, améliorée et améliorée, n'est pas tout à fait exacte dans la vie réelle. En effet, si vous continuez à zoomer sur une image, vous verrez des pixels.

![alt-test](https://cs50.harvard.edu/extension/2022/fall/notes/4/cs50Week4Slide012.png)

*   Vous pouvez imaginer une image comme une carte de bits, où les zéros représentent le noir et les uns représentent le blanc.

![alt-test](https://cs50.harvard.edu/extension/2022/fall/notes/4/cs50Week4Slide015.png)


*   RVB , ou rouge, vert, bleu , sont des nombres qui représentent la quantité de chacune de ces couleurs. Dans Adobe Photoshop, vous pouvez voir ces paramètres comme suit :

![alt-test](https://cs50.harvard.edu/extension/2022/fall/notes/4/cs50Week4Slide016.png)

Remarquez comment la quantité de rouge, de bleu et de vert modifie la couleur sélectionnée.

Vous pouvez voir par l'image ci-dessus que la couleur n'est pas simplement représentée en trois valeurs. Au bas de la fenêtre, il y a une valeur spéciale composée de chiffres et de caractères. 255est représenté par FF. Pourquoi cela pourrait-il être?


## Hexadecimal
## Addresses




![alt-test](https://cs50.harvard.edu/x/2022/notes/4/addresses.png)


``` c
#include <stdio.h>


int main(void)
{
    int i = 50;
    printf("%i\n", i);


    // address

    int t = 50;
    printf("%p\n", &t);

    //pointer
    
    int n = 50;
    int *p = &n;
    printf("%p\n", p);
}
```

```c

$ make address 
$ ./address 
50
0x7ffccad4d988
0x7ffccad4d984
$ 

```

## Les pointers
## les Strings
## Pointer Arithmetic
## Comparing Strings
## Copying
## Valgrind
## Garbage Values
## Pointer Fun with Binky
## Swap
## Overflow
## scanf
## Files
## Summing Up





