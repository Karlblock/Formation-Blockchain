# Lecture 4  - Memory

- [Semaine 4 en anglais ](https://cs50.harvard.edu/x/2022/notes/4/)
- [Les notes 2022 en anglais ](https://cs50.harvard.edu/extension/2022/fall/notes/4/#welcome)
- [Vidéo Semaine 4](https://www.youtube.com/watch?v=ywg7cW0Txs4)

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

*   Au cours des semaines précédentes, nous avons parlé d'images constituées de blocs de construction plus petits appelés pixels.
Aujourd'hui, nous allons entrer plus en détail sur les zéros et les uns qui composent ces images.

*   De plus, nous verrons comment accéder aux données sous-jacentes stockées dans la mémoire de l'ordinateur.

## Memoire


*   Vous pouvez imaginer un drame policier où une image est améliorée, améliorée et améliorée, n'est pas tout à fait exacte dans la vie réelle. En effet, si vous continuez à zoomer sur une image, vous verrez des pixels.

![alt-test](https://cs50.harvard.edu/extension/2022/fall/notes/4/cs50Week4Slide012.png)

*   Vous pouvez imaginer une image comme une carte de bits, où les zéros représentent le noir et les uns représentent le blanc.

![alt-test](https://cs50.harvard.edu/extension/2022/fall/notes/4/cs50Week4Slide015.png)


*   RVB , ou rouge, vert, bleu , sont des nombres qui représentent la quantité de chacune de ces couleurs. Dans Adobe Photoshop, vous pouvez voir ces paramètres comme suit :

![alt-test](https://cs50.harvard.edu/extension/2022/fall/notes/4/cs50Week4Slide016.png)

*   Remarquez comment la quantité de rouge, de bleu et de vert modifie la couleur sélectionnée.

*   Vous pouvez voir par l'image ci-dessus que la couleur n'est pas simplement représentée en trois valeurs. Au bas de la fenêtre, il y a une valeur spéciale composée de chiffres et de caractères. 255est représenté par FF. Pourquoi cela pourrait-il être?

## Hexadecimal

*   L'hexadécimal est un système de comptage qui a 16 valeurs de comptage. Ils sont les suivants :

 ```c
 0 1 2 3 4 5 6 7 8 9 a b c d e f
```
*   Remarquez que cela **F** représente 15.

*   L'hexadécimal est également connu sous le nom de base-16 .

*   En comptant en hexadécimal, chaque colonne est une puissance de 16.

    *   Le nombre 0 est représenté par 00.
    *   Le nombre 1 est représenté par 01.
    *   Le nombre 9 est représenté par 09.
    *   Le nombre 10 est représenté par 0A.
    *   Le nombre 15 est représenté par 0F.
    *   Le nombre 16 est représenté par 10.


*   Le nombre 255 est représenté par FF, car 16 x 15 (ou F) est égal à 240. Ajoutez 15 de plus pour obtenir 255. C'est le nombre le plus élevé que vous puissiez compter en utilisant un système hexadécimal à deux chiffres.

*   L'hexadécimal est utile car il peut être représenté en utilisant moins de chiffres. L'hexadécimal nous permet de représenter les informations plus succinctement.

## Addresses


*   Au cours des dernières semaines, vous vous souviendrez peut-être de notre rendu artistique de blocs de mémoire simultanés. En appliquant une numérotation hexadécimale à chacun de ces blocs de mémoire, vous pouvez les visualiser comme suit :

![alt-test](https://cs50.harvard.edu/extension/2022/fall/notes/4/cs50Week4Slide065.png)

*   Vous pouvez imaginer à quel point il peut y avoir confusion quant à savoir si le 10 bloc ci-dessus peut représenter un emplacement en mémoire ou la valeur 10. En conséquence, par convention, tous les nombres hexadécimaux sont souvent représentés avec le **0x** préfixe suivant :


![alt-test](https://cs50.harvard.edu/extension/2022/fall/notes/4/cs50Week4Slide066.png)

*   Dans la fenêtre de votre terminal, tapez code **addresses.c** et écrivez votre code comme suit :

```c
  #include <stdio.h>

  int main(void)
  {
      int n = 50;
      printf("%i\n", n);
  }
```

*   Remarquez comment **n** est stocké en mémoire avec la valeur 50.

*   Vous pouvez visualiser comment ce programme stocke cette valeur comme suit :

![alt-test](https://cs50.harvard.edu/extension/2022/fall/notes/4/cs50Week4Slide070.png)


*   Le langage C a deux opérateurs puissants qui se rapportent à la mémoire :
```

  & Fournit l'adresse d'un élément stocké en mémoire.
  * Ordonne au compilateur d'aller à un emplacement en mémoire.

```
*   Nous pouvons tirer parti de ces connaissances en modifiant notre code comme suit :

```c
  #include <stdio.h>

  int main(void)
  {
      int n = 50;
      printf("%p\n", &n);
  }
```

*   Remarquez le **%p**, qui nous permet de visualiser l'adresse d'un emplacement en mémoire. &n peut être littéralement traduit par "l'adresse de n". L'exécution de ce code renverra une adresse de mémoire commençant par 0x.

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

*   Un pointeur est une variable qui contient l'adresse d'une valeur. Plus succinctement, un pointeur est une adresse dans la mémoire de votre ordinateur.
Considérez le code suivant :

```c
  int n = 50;

  int *p = &n;
```

*   Notez que **p** c'est un pointeur qui contient un nombre qui est l'adresse d'un entier n.

Modifiez votre code comme suit :

```c
  #include <stdio.h>

  int main(void)
  {
      int n = 50;
      int *p = &n;
      printf("%p\n", p);
  }
```
*   Notez que ce code a le même effet que notre code précédent. Nous avons simplement mis à profit nos nouvelles connaissances des opérateurs &et .*

*   Vous pouvez visualiser notre code comme suit :

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/4/cs50Week4Slide085.png)

*   Même valeur de 50 dans un emplacement de mémoire avec une valeur de pointeur stockée ailleurs

*   Remarquez que le pointeur semble plutôt gros. En effet, un pointeur est généralement stocké sous la forme d'une valeur de 8 octets.

*   Vous pouvez visualiser plus précisément un pointeur comme une adresse pointant vers une autre :

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/4/cs50Week4Slide079.png)

*   Un pointeur sous forme de flèche, pointant d'un emplacement de mémoire à un autre

*   Pour illustrer l'utilisation de l' *opérateur, considérez ce qui suit :
```c
  #include <stdio.h>

  int main(void)
  {
      int n = 50;
      int *p = &n;
      printf("%i\n", *p);
  }
```

Notez que la ligne printf imprime l'entier à l'emplacement de p.

## les Strings

*   Maintenant que nous avons un modèle mental pour les pointeurs, nous pouvons revenir sur un niveau de simplification qui a été proposé plus tôt dans ce cours.
Rappelez-vous qu'une chaîne est simplement un tableau de caractères. Par exemple, string s = "HI!"peut être représenté comme suit :


![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/4/cs50Week4Slide085.png)

*   Cependant, qu'est-ce que c'est svraiment ? Où est stocké **s** en mémoire ? Comme vous pouvez l'imaginer, **s** doit être stocké quelque part. Vous pouvez visualiser la relation de **s** à la chaîne comme suit :

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/4/cs50Week4Slide086.png)

*   Remarquez comment un pointeur appelé **s** indique au compilateur où se trouve le premier octet de la chaîne en mémoire.

*   Modifiez votre code comme suit :

```c
  #include <cs50.h>
  #include <stdio.h>

  int main(void)
  {
      string s = "HI!";
      printf("%p\n", s);
      printf("%p\n", &s[0]);
      printf("%p\n", &s[1]);
      printf("%p\n", &s[2]);
      printf("%p\n", &s[3]);
  }
 ```
Notez que ce qui précède imprime les emplacements mémoire de chaque caractère dans la chaîne ```s```

*   De même, vous pouvez modifier votre code comme suit :

```c
  #include <stdio.h>

  int main(void)
  {
      char *s = "HI!";
      printf("%s\n", s);
  }
```

Notez que ce code présentera la chaîne qui commence à l'emplacement de s.


## Pointer Arithmetic

*   Vous pouvez modifier votre code pour accomplir la même chose sous une forme plus longue comme suit :

```c
  #include <stdio.h>

  int main(void)
  {
      char *s = "HI!";
      printf("%c\n", s[0]);
      printf("%c\n", s[1]);
      printf("%c\n", s[2]);
  }
```

*   Notez que nous imprimons chaque caractère à l'emplacement de s.

*   De plus, vous pouvez modifier votre code comme suit :

```c
  #include <stdio.h>

  int main(void)
  {
      char *s = "HI!";
      printf("%c\n", *s);
      printf("%c\n", *(s + 1));
      printf("%c\n", *(s + 2));
  }
```

*   Notez que le premier caractère à l'emplacement de ```s``` est imprimé. Ensuite, le caractère à l'emplacement ```s + 1``` est imprimé, et ainsi de suite.

*   Pouvez-vous imaginer ce qui se passerait si vous tentiez d'accéder à quelque chose sur place ```s + 50``` ? Les pirates tentent parfois d'accéder à des éléments en mémoire auxquels ils ne devraient pas avoir accès. Si vous essayez cela, le programme se fermera probablement par mesure de sécurité.

## Comparing Strings

*   Une chaîne de caractères est simplement un tableau de caractères identifié par son premier octet.

*   Rappelez-vous que la semaine dernière, nous avons dit que nous ne pouvions pas comparer deux chaînes à l'aide de  ```==```  l'opérateur.

*   L'utilisation de l'opérateur ```==``` dans une tentative de comparaison de chaînes tentera de comparer les emplacements de mémoire des chaînes au lieu des caractères qu'elles contiennent. En conséquence, nous avons recommandé l'utilisation de ```strcmp```.

*   Pour illustrer cela, tapez ```code compare.c``` et écrivez le code comme suit :

```c
  #include <cs50.h>
  #include <stdio.h>

  int main(void)
  {
      // Get two strings
      char *s = get_string("s: ");
      char *t = get_string("t: ");

      // Compare strings' addresses
      if (s == t)
      {
          printf("Same\n");
      }
      else
      {
          printf("Different\n");
      }
  }
```

*   Remarquer que la saisie ```HI!``` des deux chaînes entraîne toujours la sortie de ```Different```.

*   Pourquoi ces chaînes semblent-elles différentes ? Vous pouvez utiliser ce qui suit pour visualiser pourquoi :

 ![rr](https://cs50.harvard.edu/extension/2022/fall/notes/4/cs50Week4Slide115.png)

*   Pour plus de clarté, vous pouvez voir comment l'image suivante illustre des pointeurs pointant vers deux emplacements distincts en mémoire :

![deu](https://cs50.harvard.edu/extension/2022/fall/notes/4/cs50Week4Slide116.png)

*   Modifiez votre code comme suit :

```c
  #include <cs50.h>
  #include <stdio.h>

  int main(void)
  {
      // Get two strings
      char *s = get_string("s: ");
      char *t = get_string("t: ");

      // Print strings
      printf("%s\n", s);
      printf("%s\n", t);
  }
```
Remarquez comment nous avons maintenant deux chaînes distinctes stockées probablement à deux emplacements distincts.

*   Vous pouvez voir les emplacements de ces deux chaînes stockées avec une petite modification :

```c
  #include <cs50.h>
  #include <stdio.h>

  int main(void)
  {
      // Get two strings
      char *s = get_string("s: ");
      char *t = get_string("t: ");

      // Print strings' addresses
      printf("%p\n", s);
      printf("%p\n", t);
  }

```

Notez que le ```%s``` a été remplacé par ```%p``` dans l'instruction d'impression.

## Copying

*   Un besoin courant en programmation est de copier une chaîne dans une autre.

* Dans la fenêtre de votre terminal, saisissez code ```copy.c``` et écrivez le code comme suit :

```c

  #include <cs50.h>
  #include <ctype.h>
  #include <stdio.h>
  #include <string.h>

  int main(void)
  {
      // Get a string
      string s = get_string("s: ");

      // Copy string's address
      string t = s;

      // Capitalize first letter in string
      t[0] = toupper(t[0]);

      // Print string twice
      printf("s: %s\n", s);
      printf("t: %s\n", t);
  }
```

*   Notez que string ```t = s``` copie l'adresse de ```s``` à ```t```. Cela n'accomplit pas ce que nous désirons. La chaîne n'est pas copiée - seule l'adresse l'est.

*   Avant de relever ce défi, il est important de s'assurer que nous ne rencontrons pas de défaut de segmentation dans notre code, où nous tentons de copier ```string s``` vers ```string t```, où ```string t```n'existe pas. Nous pouvons utiliser la ```strlen``` fonction comme suit pour vous aider :

```c

  #include <cs50.h>
  #include <ctype.h>
  #include <stdio.h>
  #include <string.h>

  int main(void)
  {
      // Get a string
      string s = get_string("s: ");

      // Copy string's address
      string t = s;

      // Capitalize first letter in string
      if (strlen(t) > 0)
      {
          t[0] = toupper(t[0]);
      }

      // Print string twice
      printf("s: %s\n", s);
      printf("t: %s\n", t);
  }
```

*   Avis qui ```strlen``` est utilisé pour s'assurer qu'il ```string t``` existe. Si ce n'est pas le cas, rien ne sera copié.

*   Vous pouvez visualiser le code ci-dessus comme suit :

*   ![chaîne](https://cs50.harvard.edu/extension/2022/fall/notes/4/cs50Week4Slide124.png)

*   Notez que ```s``` et ```t``` pointent toujours vers les mêmes blocs de mémoire. Ce n'est pas une copie authentique d'une chaîne. Au lieu de cela, ce sont deux pointeurs pointant sur la même chaîne.

*   Pour pouvoir faire une copie authentique de la chaîne, nous devrons introduire deux nouveaux blocs de construction. Tout d'abord, ```malloc``` vous permet, le programmeur, d'allouer un bloc d'une taille de mémoire spécifique. Deuxièmement, ```free``` vous permet de dire au compilateur de libérer ce bloc de mémoire que vous avez précédemment alloué.

*   Vous pouvons modifier notre code pour créer une copie authentique de notre chaîne comme suit :

```c

  #include <cs50.h>
  #include <ctype.h>
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>

  int main(void)
  {
      // Get a string
      char *s = get_string("s: ");

      // Allocate memory for another string
      char *t = malloc(strlen(s) + 1);

      // Copy string into memory, including '\0'
      for (int i = 0; i <= strlen(s); i++)
      {
          t[i] = s[i];
      }

      // Capitalize copy
      t[0] = toupper(t[0]);

      // Print strings
      printf("s: %s\n", s);
      printf("t: %s\n", t);
  }

```
*   Notez que ```malloc(strlen(s) + 1)``` crée un bloc de mémoire qui est la longueur de la chaîne ```s``` plus un. Cela permet l'inclusion du caractère nul ```\0``` dans notre chaîne finale copiée. Ensuite, la boucle for parcourt la chaîne set attribue chaque valeur au même emplacement sur la chaîne ```t```.

*   Il s'avère qu'il y a une inefficacité dans notre code. Modifiez votre code comme suit :

```c

  #include <cs50.h>
  #include <ctype.h>
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>

  int main(void)
  {
      // Get a string
      char *s = get_string("s: ");

      // Allocate memory for another string
      char *t = malloc(strlen(s) + 1);

      // Copy string into memory, including '\0'
      for (int i = 0, n = strlen(s); i <= n; i++)
      {
          t[i] = s[i];
      }

      // Capitalize copy
      t[0] = toupper(t[0]);

      // Print strings
      printf("s: %s\n", s);
      printf("t: %s\n", t);
  }
```

*   Notez que ```n = strlen(s)``` c'est maintenant défini dans la partie gauche du fichier ```for loop```. Il est préférable de ne pas appeler de fonctions inutiles dans la condition médiane de la  boucle for, car elle s'exécutera encore et encore. Lors du déplacement n = strlen(s)vers la gauche, la fonction ```strlen``` ne s'exécute qu'une seule fois.

*   Le langage ```C```  a une fonction intégrée pour copier des chaînes appelées ```strcpy```. Il peut être mis en œuvre comme suit :

```c
  #include <cs50.h>
  #include <ctype.h>
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>

  int main(void)
  {
      // Get a string
      char *s = get_string("s: ");

      // Allocate memory for another string
      char *t = malloc(strlen(s) + 1);

      // Copy string into memory
      strcpy(t, s);

      // Capitalize copy
      t[0] = toupper(t[0]);

      // Print strings
      printf("s: %s\n", s);
      printf("t: %s\n", t);
  }
```

*   Notez que cela ```strcpy``` fait le même travail que notre boucle for faisait précédemment.

*   Les deux ```get_string``` et ```malloc``` return ```NULL```, une valeur spéciale en mémoire, en cas de problème. Vous pouvez écrire du code qui peut vérifier cette ```NULL``` condition comme suit :

```c

  #include <cs50.h>
  #include <ctype.h>
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>

  int main(void)
  {
      // Get a string
      char *s = get_string("s: ");
      if (s == NULL)
      {
          return 1;
      }

      // Allocate memory for another string
      char *t = malloc(strlen(s) + 1);
      if (t == NULL)
      {
          return 1;
      }

      // Copy string into memory
      strcpy(t, s);

      // Capitalize copy
      if (strlen(t) > 0)
      {
          t[0] = toupper(t[0]);
      }

      // Print strings
      printf("s: %s\n", s);
      printf("t: %s\n", t);

      // Free memory
      free(t);
      return 0;
  }

```
Notez que si la chaîne obtenue est de longueur 0 ou si ```malloc``` échoue, ```NULL``` est renvoyé. De plus, notez que cela freepermet à l'ordinateur de savoir que vous en avez terminé avec ce bloc de mémoire que vous avez créé via ```malloc```.

## Valgrind

Valgrind est un outil qui peut vérifier s'il y a des problèmes liés à la mémoire avec vos programmes dans lesquels vous avez utilisé ```malloc```. Plus précisément, il vérifie si vous avez ```free``` toute la mémoire que vous avez allouée.
Considérez le code suivant :

```c

  #include <stdio.h>
  #include <stdlib.h>

  int main(void)
  {
      int *x = malloc(3 * sizeof(int));
      x[1] = 72;
      x[2] = 73;
      x[3] = 33;
  }

```

*   Notez que l'exécution de ce programme ne provoque aucune erreur. Alors que ```malloc``` est utilisé pour allouer suffisamment de mémoire pour un tableau, le code échoue dans ```free``` cette mémoire allouée.

*   Si vous tapez ```make memory``` suivi de ```valgrind ./memory``` , vous obtiendrez un rapport de valgrind qui indiquera où la mémoire a été perdue à cause de votre programme.
Vous pouvez modifier votre code comme suit :

```c

  #include <stdio.h>
  #include <stdlib.h>

  int main(void)
  {
      int *x = malloc(3 * sizeof(int));
      x[1] = 72;
      x[2] = 73;
      x[3] = 33;
      free(x);
  }
```
Notez que la réexécution de valgrind entraîne maintenant des fuites de mémoire.

## Valeurs Inutiles

*   Lorsque vous demandez au compilateur un bloc de mémoire, rien ne garantit que cette mémoire sera vide.

*   Il est très possible que cette mémoire que vous avez allouée ait été précédemment utilisée par l'ordinateur. En conséquence, vous pouvez voir des valeurs indésirables ou inutiles . Ceci est dû au fait que vous obtenez un bloc de mémoire mais que vous ne l'initialisez pas. Par exemple, considérez le code suivant :

```c
  #include <stdio.h>
  #include <stdlib.h>

  int main(void)
  {
      int scores[1024];
      for (int i = 0; i < 1024; i++)
      {
          printf("%i\n", scores[i]);
      }
  }
```

Notez que l'exécution de ce code allouera des 1024emplacements en mémoire pour votre tableau, mais la forboucle montrera probablement que toutes les valeurs qu'il contient ne sont pas 0. Il est toujours préférable d'être conscient du potentiel de valeurs parasites lorsque vous n'initialisez pas des blocs de mémoire à une autre valeur comme zéro ou autre.

## Pointer Fun with Binky

*   Nous avons regardé une
[vidéo de l'Université de Stanford](https://translate.google.com/website?sl=en&tl=fr&hl=fr&client=webapp&u=https://www.youtube.com/watch?v%3D5VnDaHBi8dM) qui nous a aidés à visualiser et à comprendre les pointeurs.



## Swap

*   Dans le monde réel, un besoin courant en programmation est d'échanger deux valeurs. Naturellement, il est difficile d'échanger deux variables sans un espace de stockage temporaire. En pratique, vous pouvez taper code swap.c et écrire du code comme suit pour voir cela en action :

```c
  #include <stdio.h>

  void swap(int a, int b);

  int main(void)
  {
      int x = 1;
      int y = 2;

      printf("x is %i, y is %i\n", x, y);
      swap(x, y);
      printf("x is %i, y is %i\n", x, y);
  }

  void swap(int a, int b)
  {
      int tmp = a;
      a = b;
      b = tmp;
  }
```

*   Notez que pendant que ce code s'exécute, il ne fonctionne pas. Les valeurs, même après avoir été envoyées à la swap fonction, ne s'échangent pas. Pourquoi?

*   Lorsque vous transmettez des valeurs à une fonction, vous ne fournissez que des copies. Au cours des semaines précédentes, nous avons discuté du concept de portée . Les valeurs de `x` et ```y``` créées dans les `{}` accolades de la `` main`` fonction n'ont que la portée de la ``main`` fonction. Considérez l'image suivante :

![pile](https://cs50.harvard.edu/extension/2022/fall/notes/4/cs50Week4Slide163.png)

*   Notez que les variables globales , que nous n'avons pas utilisées dans ce cours, vivent à un endroit en mémoire. Diverses fonctions sont stockées dans la ``stack`` dans une autre zone de la mémoire.

*   Maintenant, considérons l'image suivante :

![rectangle](https://cs50.harvard.edu/extension/2022/fall/notes/4/cs50Week4Slide167.png)

*   Notez que ```main``` et ```swap``` ont deux cadres ou zones de mémoire  distincts . Par conséquent, nous ne pouvons pas simplement passer les valeurs d'une fonction à une autre pour les modifier.

Modifiez votre code comme suit :

```c  
#include <stdio.h>

  void swap(int *a, int *b);

  int main(void)
  {
      int x = 1;
      int y = 2;

      printf("x is %i, y is %i\n", x, y);
      swap(&x, &y);
      printf("x is %i, y is %i\n", x, y);
  }

  void swap(int *a, int *b)
  {
      int tmp = *a;
      *a = *b;
      *b = tmp;
  }
```

Notez que les variables ne sont pas passées par valeur mais par référence . Autrement dit, les adresses de ``a`` et ``b`` sont fournies à la fonction. Par conséquent, la ``swap`` fonction peut savoir où apporter des modifications à la fonction réelle ```a``` et ```b``` à partir de la fonction principale.

Vous pouvez visualiser cela comme suit :

![a et b](https://cs50.harvard.edu/extension/2022/fall/notes/4/cs50Week4Slide173.png)

## Overflow

*   Un débordement de tas *heap overflow* se produit lorsque vous débordez la ``heap``, touchant des zones de mémoire que vous n'êtes pas censés toucher.

*   Un débordement de pile *stack overflow* se produit lorsque trop de fonctions sont appelées, dépassant la quantité de mémoire disponible.

*   Ces deux éléments sont considérés comme des débordements de tampon *buffer overflows* .

``scanf``

*   Dans CS50, nous avons créé des fonctions comme ``get_int`` pour simplifier l'acte d'obtenir l'entrée de l'utilisateur.

*   ``scanf`` est une fonction intégrée qui peut obtenir l'entrée de l'utilisateur.

*   Nous pouvons réimplémenter ``get_int`` assez facilement en utilisant ``scanf`` comme suit:

```c
  #include <stdio.h>

  int main(void)
  {
      int x;
      printf("x: ");
      scanf("%i", &x);
      printf("x: %i\n", x);
  }
```

Notez que la valeur de ``x`` est stockée à l'emplacement de ``x`` dans la ligne ``scanf("%i", &x)``.

*   Cependant, tenter de réimplémenter ``get_string`` n'est pas facile. Considérer ce qui suit:

```
  #include <stdio.h>

  int main(void)
  {
      char *s;
      printf("s: ");
      scanf("%s", s);
      printf("s: %s\n", s);
  }
```
Notez que non ``&`` est requis car les chaînes sont spéciales. Pourtant, ce programme ne fonctionnera pas. Nulle part dans ce programme nous n'allouons la quantité de mémoire requise pour notre chaîne.

*   Nous pouvons modifier notre code comme suit :

```c
  #include <stdio.h>

  int main(void)
  {
      char s[4];
      printf("s: ");
      scanf("%s", s);
      printf("s: %s\n", s);
  }
```

Notez que si nous pré-allouons un tableau de size ``4``, nous pouvons taper ``cat`` et les fonctions du programme. Cependant, une chaîne plus grande que cela créerait une erreur.

## Files

*   Vous pouvez lire et manipuler des fichiers. Bien que ce sujet soit abordé plus en détail dans une semaine à venir, considérez le code suivant pour ``phonebook.c`` :

```c
  #include <cs50.h>
  #include <stdio.h>
  #include <string.h>

  int main(void)
  {
      // Open CSV file
      FILE *file = fopen("phonebook.csv", "a");

      // Get name and number
      char *name = get_string("Name: ");
      char *number = get_string("Number: ");

      // Print to file
      fprintf(file, "%s,%s\n", name, number);

      // Close file
      fclose(file);
  }
```
Notez que ce code utilise des pointeurs pour accéder au fichier.

*   Vous pouvez créer un fichier appelé ``phonebook.csv`` avant d'exécuter le code ci-dessus. Après avoir exécuté le programme ci-dessus et saisi un nom et un numéro de téléphone, vous remarquerez que ces données persistent dans votre fichier CSV.

## Summing Up

Dans cette leçon, vous avez découvert les pointeurs qui vous permettent d'accéder à des données et de les manipuler à des emplacements de mémoire spécifiques. Plus précisément, nous nous sommes penchés sur…

*   Mémoire
*   Hexadécimal
*   Adresses
*   Pointeurs
*   Cordes
*   Arithmétique du pointeur
*   Comparer des chaînes
*   Copier
*   Valgrind
*   Valeurs inutiles
*   Échanger
*   Débordement
*   scanf

```python
À la prochaine!


```

Semaine suivant : [Week5](https://github.com/BlockchainSpot/Formation-Blockchain/tree/main/0%20-%20Science%20Informatique%20CS50/Week5%20-%20%20Data)

[🙏 Buy Me A Coffee 🙏](https://www.buymeacoffee.com/karlblock)



