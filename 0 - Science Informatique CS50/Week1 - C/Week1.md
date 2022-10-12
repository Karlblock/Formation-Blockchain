
# Lecture 1  - C

- [Semaine 1 en anglais ](https://cs50.harvard.edu/x/2022/notes/1/)
- [Les notes 2022 en anglais ](https://cs50.harvard.edu/extension/2022/fall/notes/1/#welcome)
- [Vidéo Semaine 1](https://www.youtube.com/watch?v=ywg7cW0Txs4)

## Table des matières 

* [Bienvenue](#Bienvenue)
* [Hello World](#Hello-World)
* [Les functions ](#les-functions)
* [Variables](#varibles)
* [Conditionnels](#Conditionnels)
* [Boucles](#Boucles)
* [Linux et les lignes de commande](#Linux-et-les-lignes-e-commande)
* [Mario](#Mario)
* [Commantaire](#Commantaire)
* [Les abstactions](#Les-abstactions)
* [Operateur de type](#operateur-de-type)
* [Résumé](#Résumé)

---


## Bienvenue
__Lien vers la vidéo  de l'[introduction](https://www.youtube.com/watch?v=XmYnsO7iSI8&t=0s)__

## Hello-World

*   Le compilateur utilisé pour ce cours est Visual Studio Code , affectueusement appelé , accessible via cette même URL, ou simplement en tant que *VS Code.*

*   L'une des raisons les plus importantes pour lesquelles nous utilisons VS Code est qu'il contient tous les logiciels requis pour le cours déjà préchargés. Ce cours et les instructions qu'il contient ont été conçus avec VS Code à l'esprit. Il est préférable de toujours utiliser VS Code pour les devoirs de ce cours.

*   Vous pouvez ouvrir VS Code sur __[code.cs50.io](https://translate.google.com/website?sl=en&tl=fr&hl=fr&client=webapp&u=https://code.cs50.io/)__ .

*   Le compilateur peut être divisé en plusieurs régions :

```c

#include <cs50.h>
#include <stdio.h>

int main(void)
{
    string answer = get_string("What's your name? ");
    printf("hello, %s\n", answer);
}
  
```

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/1/cs50Week1Slide017.png)

Notez qu'il y a un explorateur de fichiers sur le côté gauche où vous pouvez trouver vos fichiers. De plus, notez qu'il y a une région au milieu appelée un éditeur de texte où vous pouvez éditer votre programme. Enfin, il existe un command line interface, appelé CLI , ligne de commande ou fenêtre de terminal où nous pouvons envoyer des commandes à l'ordinateur dans le cloud.

*   Nous pouvons construire votre premier programme en C en tapant code hello.cdans la fenêtre du terminal. Notez que nous avons délibérément mis en minuscules le nom de fichier entier et inclus l' .cextension. Ensuite, dans l'éditeur de texte qui apparaît, écrivez le code comme suit :

```c
  #include <stdio.h>

  int main(void)
  {
    printf("hello, world\n");
  }
```

Notez que chaque caractère ci-dessus a un but. Si vous ne le tapez pas correctement, le programme ne fonctionnera pas.

*   En cliquant de nouveau dans la fenêtre du terminal, vous pouvez compiler votre code en exécutant make hello. Remarquez que nous omettons .c. makeest un compilateur qui recherchera notre hello.cfichier et le transformera en un programme appelé hello. Si l'exécution de cette commande ne génère aucune erreur, vous pouvez continuer. Si ce n'est pas le cas, revérifiez votre code pour vous assurer qu'il correspond à ce qui précède.

*   Maintenant, tapez ./helloet votre programme s'exécutera en disant hello, world.

*   Maintenant, ouvrez l' explorateur de fichiers sur la gauche. Vous remarquerez qu'il existe maintenant à la fois un fichier appelé hello.cet un autre fichier appelé hello. hello.cpeut être lu par le compilateur : c'est là que votre code est stocké. helloest un fichier exécutable que vous pouvez exécuter, mais qui ne peut pas être lu par le compilateur.

*   Regardons notre code plus attentivement :

```c
  #include <stdio.h>

  int main(void)
  {
    printf("hello, world\n");
  }
```

*   Notez que notre code est mis en surbrillance à l'aide de la coloration syntaxique.

## les functions


*   Dans Scratch, nous avons utilisé le saybloc pour afficher n'importe quel texte à l'écran. En effet, en C, nous avons une fonction appelée printfqui fait exactement cela.
*   Notez que notre code invoque déjà cette fonction :

```c
  printf("hello, world\n");
```

Notez que la fonction printf est appelée. L'argument passé à printf est 'hello, world\n'. L'énoncé de code est fermé par un ;.

*   Une erreur courante en programmation C est l'omission d'un point-virgule. Modifiez votre code comme suit :

```c
  #include <stdio.h>

  int main(void)
  {
    printf("hello, world\n")
  }
```

Remarquez que le point-virgule a maintenant disparu.

*   Dans votre fenêtre de terminal, exécutez make hello. Vous allez maintenant rencontrer de nombreuses erreurs ! En remettant le point-virgule dans la bonne position et en l'exécutant make helloà nouveau, les erreurs disparaissent.

*   Remarquez également le symbole spécial \ndans votre code. Essayez de supprimer ces caractères et de recréer votre programme en exécutant make hello. En tapant ./hellodans la fenêtre du terminal, comment votre programme a-t-il changé ?

*   Restaurez votre programme comme suit :

```c
  #include <stdio.h>

  int main(void)
  {
    printf("hello, world\n");
  }
```

Remarquez le point-virgule et \nont été restaurés.

*   L'instruction au début du code #include <stdio.h>est une commande très spéciale qui indique à la compilation que vous souhaitez utiliser les fonctionnalités de la bibliothèque appelée stdio.h. Cela vous permet, entre autres choses, d'utiliser la printffonction. Vous pouvez lire toutes les fonctionnalités de cette bibliothèque sur les pages de manuel .

*   Il s'avère que CS50 a sa propre bibliothèque appelée cs50.h. Utilisons cette bibliothèque dans votre programme.

## variables

*   Rappelons que dans Scratch, nous avions la possibilité de demander à l'utilisateur "Comment t'appelles-tu ?" et dites "bonjour" avec ce nom en annexe.

*   En C, on peut faire la même chose. Modifiez votre code comme suit :
```c
  #include <cs50.h>
  #include <stdio.h>

  int main(void)
  {
    string answer = get_string("What's your name? ");
    printf("hello, %s\n", answer);
  }
```

Notez que cela #include <cs50.h>a été ajouté en haut de votre code. La get_stringfonction est utilisée pour obtenir une chaîne de l'utilisateur. Ensuite, la variable answerest passée à la printffonction. %sindique à la printffonction de se préparer à recevoir un string.

*   answer est un lieu de détention spécial que nous appelons une variable . answerest de type stringet peut contenir n'importe quelle chaîne. Il existe de nombreux types de données , tels que int, bool, charet bien d'autres.

*   Exécutant make helloà nouveau dans la fenêtre du terminal, vous pouvez exécuter votre programme en tapant ./hello. Le programme vous demande maintenant votre nom, puis vous dit bonjour avec votre nom en pièce jointe.

## Conditionnels

*   Un autre bloc de construction que vous avez utilisé dans Scratch était celui des conditionnels . Par exemple, vous voudrez peut-être faire une chose si x est supérieur à y. De plus, vous voudrez peut-être faire autre chose si cette condition n'est pas remplie.

*   Dans la fenêtre du terminal, tapez code compare.cet écrivez le code comme suit :

```c
  #include <cs50.h>
  #include <stdio.h>

  int main(void)
  {
    int x = get_int("What's x? ")
    int y = get_int("What's y? ")

    if (x < y)
    {
      printf("x is less than y\n")
    }
  }
```

Notez que nous créons deux variables, une intou un entier appelé xet un autre appelé y. Les valeurs de ceux-ci sont renseignées à l'aide de la get_intfonction.

*   Vous pouvez exécuter votre code en exécutant make comparedans la fenêtre du terminal, suivi de ./compare. Si vous obtenez des messages d'erreur, vérifiez votre code pour les erreurs.

*   Nous pouvons améliorer votre programme en codant comme suit :

```c
  #include <cs50.h>
  #include <stdio.h>

  int main(void)
  {
    int x = get_int("What's x? ")
    int y = get_int("What's y? ")

    if (x < y)
    {
        printf("x is less than y\n");
    }
    else if (x > y)
    {
        printf("x is greater than y\n");
    }
    else
    {
        printf("x is equal to y\n");
    }
  }
```

Notez que tous les résultats potentiels sont désormais pris en compte.

*   Vous pouvez recréer et relancer votre programme et le tester.

*   Considérant un autre type de données appelé a, charnous pouvons démarrer un nouveau programme en tapant code agree.cdans la fenêtre du terminal. Dans l'éditeur de texte, écrivez le code comme suit :
```c
  #include <cs50.h>
  #include <stdio.h>

  int main(void)
  {
      // Prompt user to agree
      char c = get_char("Do you agree? ");

      // Check whether agreed
      if (c == 'Y' || c == 'y')
      {
          printf("Agreed.\n");
      }
      else if (c == 'N' || c == 'n')
      {
          printf("Not agreed.\n");
      }
  }
```

Notez que les guillemets simples sont utilisés pour les caractères uniques. De plus, notez que ==garantir que quelque chose est égal à autre chose, où un seul signe égal aurait une fonction très différente en C. Enfin, notez que ||signifie effectivement ou .

*   Vous pouvez tester votre code en tapant make agreedans la fenêtre du terminal, suivi de ./agree.

## Boucles

*   Nous pouvons également utiliser le bloc de construction de boucles de Scratch dans nos programmes C.

*   Dans la fenêtre de votre terminal, saisissez code meow.cet écrivez le code comme suit :
```c
  #include <stdio.h>

  int main(void)
  {
      printf("meow\n");
      printf("meow\n");
      printf("meow\n");
  }
```

Notez que cela fonctionne comme prévu, mais offre la possibilité d'une meilleure conception.

*   Nous pouvons améliorer notre programme en modifiant votre code comme suit :
```c
  #include <stdio.h>

  int main(void)
  {
      int i = 0;
      while (i < 3)
      {
          printf("meow\n");
          i++;
      }
  }
```

Notez que nous créons un intappelé iet lui attribuons la valeur 0. Ensuite, nous créons une whileboucle qui s'exécutera aussi longtemps que i < 3. Ensuite, la boucle s'exécute. Chaque fois 1est ajouté à il'aide de la i++déclaration.

*   De même, nous pouvons implémenter une sorte de compte à rebours en modifiant notre code comme suit :

```c

  #include <stdio.h>

  int main(void)
  {
      int i = 3;
      while (i > 0)
      {
          printf("meow\n");
          i--;
      }
  }
```

Remarquez comment notre compteur idémarre à 3. Chaque fois que la boucle s'exécute, elle réduira le compteur de 1. Une fois que le compteur est inférieur à zéro, il arrêtera la boucle.

*   Nous pouvons encore améliorer la conception en utilisant une forboucle. Modifiez votre code comme suit :

```c
  #include <stdio.h>

  int main(void)
  {
      for (int i = 0; i < 3; i++)
      {
          printf("meow\n");
      }
  }
```

Notez que la forboucle comprend trois arguments. Le premier argument int i = 0démarre notre compteur à zéro. Le deuxième argument i < 3est la condition qui est vérifiée. Enfin, l'argument i++indique à la boucle d'incrémenter de un à chaque exécution de la boucle.

*   Nous pouvons même boucler indéfiniment en utilisant le code suivant :
```c
  #include <cs50.h>
  #include <stdio.h>

  int main(void)
  {
      while (true)
      {
          printf("meow\n");
      }
  }
  ```

Remarquez que ce truesera toujours le cas. Par conséquent, le code s'exécutera toujours. Vous perdrez le contrôle de la fenêtre de votre terminal en exécutant ce code. Vous pouvez sortir d'un infini en appuyant control-Csur votre clavier.

## Linux etles ligne de commande

*   Linux est un système d'exploitation accessible via la ligne de commande dans la fenêtre du terminal dans VS Code.

*   Certains arguments de ligne de commande courants que nous pouvons utiliser incluent :

    *   cd, pour changer notre répertoire actuel (dossier)
    *   cp, pour copier des fichiers et des répertoires
    *   ls, pour lister les fichiers dans un répertoire
    *   mkdir, pour créer un répertoire
    *   mv, pour déplacer (renommer) des fichiers et des répertoires
    *   rm, pour supprimer (supprimer) des fichiers
    *   rmdir, pour supprimer (supprimer) des répertoires

*   Le plus couramment utilisé est lscelui qui listera tous les fichiers du répertoire ou du répertoire courant. Allez-y et tapez lsdans la fenêtre du terminal et appuyez sur enter. Vous verrez tous les fichiers du dossier actuel.

*   Une autre commande utile est mv, où vous pouvez déplacer un fichier d'un fichier à un autre. Par exemple, vous pouvez utiliser cette commande pour renommer Hello.c(notez la majuscule H) en hello.cen tapant mv Hello.c hello.c.

*   Vous pouvez également créer des dossiers. Vous pouvez taper mkdir pset1pour créer un répertoire appelé pset1.

*   Vous pouvez ensuite utiliser cd pset1pour changer votre répertoire actuel en pset1.

## Mario

*   Tout ce dont nous avons discuté aujourd'hui s'est concentré sur divers éléments constitutifs de votre travail en tant que programmeur.

*   Les éléments suivants vous aideront à vous orienter vers le travail sur un problème posé pour cette classe en général : Comment aborder un problème lié à l'informatique ?

*   Imaginez que nous voulions imiter le visuel du jeu Super Mario Bros. Compte tenu des quatre blocs de questions illustrés, comment pourrions-nous créer un code qui représente approximativement ces quatre blocs horizontaux ?

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/1/cs50Week1Slide123.png)

*   Dans la fenêtre du terminal, tapez code mario.cet codez comme suit :
```c
  #include <stdio.h>

  int main(void)
  {
      for (int i = 0; i < 4; i++)
      {
          printf("?");
      }
      printf("\n");
  }
```

*   Remarquez comment quatre points d'interrogation sont imprimés ici à l'aide d'une boucle.

*   De même, on peut appliquer cette même logique pour pouvoir créer trois blocs verticaux.

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/1/cs50Week1Slide125.png)

*   Pour ce faire, modifiez votre code comme suit :
```c
  #include <stdio.h>

  int main(void)
  {
      for (int i = 0; i < 3; i++)
      {
          printf("#\n");
      }
  }
  ```

Remarquez comment trois briques verticales sont imprimées à l'aide d'une boucle.

*   Et si nous voulions combiner ces idées pour créer un groupe de blocs trois par trois ?

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/1/cs50Week1Slide127.png)

*   Nous pouvons suivre la logique ci-dessus, en combinant les mêmes idées. 

*   Modifiez votre code comme suit :
```c
  #include <stdio.h>

  int main(void)
  {
      for (int i = 0; i < 3; i++)
      {
          for (int j = 0; j < 3; j++)
          {
              printf("#");
          }
          printf("\n");
      }
  }
```

Notez qu'une boucle est à l'intérieur d'une autre. La première boucle définit 
quelle ligne verticale est imprimée. Pour chaque ligne, trois colonnes sont imprimées. Après chaque ligne, une nouvelle ligne est imprimée.

*   Et si nous voulions nous assurer que le nombre de blocs soit constant , c'est-à-dire immuable ? Modifiez votre code comme suit :

```c
  int main(void)
  {
      const int n = 3;
      for (int i = 0; i < n; i++)
      {
          for (int j = 0; j < n; j++)
          {
              printf("#");
          }
          printf("\n");
      }
```

Remarquez comment nest maintenant une constante. Il ne peut jamais être modifié.

*   Comme illustré précédemment dans cette conférence, nous pouvons faire en sorte que notre code demande à l'utilisateur la taille de la grille. Modifiez votre code comme suit :

```c
  #include <cs50.h>
  #include <stdio.h>

  int main(void)
  {
      int n = get_int("Size: ");

      for (int i = 0; i < n; i++)
      {
          for (int j = 0; j < n; j++)
          {
              printf("#");
          }
          printf("\n");
      }
  }
```

Notez qu'il get_intest utilisé pour inviter l'utilisateur.

*   Un conseil général dans la programmation est que vous ne devriez jamais faire entièrement confiance à votre utilisateur. Ils se comporteront probablement mal, en tapant des valeurs incorrectes là où ils ne le devraient pas. Nous pouvons protéger notre programme contre les mauvais comportements en vérifiant que l'entrée de l'utilisateur répond à nos besoins. Modifiez votre code comme suit :

```c
  #include <cs50.h>
  #include <stdio.h>

  int main(void)
  {
      int n;
      do
      {
          n = get_int("Size: ");
      }
      while (n < 1);

      for (int i = 0; i < n; i++)
      {
          for (int j = 0; j < n; j++)
          {
              printf("#");
          }
          printf("\n");
      }
  }
  ```

*   Remarquez comment l'utilisateur est continuellement invité à entrer la taille jusqu'à ce que l'entrée de l'utilisateur soit supérieure ou égale à 1.

## Commantaire

*   Les commentaires sont des éléments fondamentaux d'un programme informatique, où vous laissez des remarques explicatives à vous-même et à d'autres qui peuvent collaborer avec vous concernant votre code.

*   Tout le code que vous créez pour ce cours doit inclure des commentaires robustes.

*   En règle générale, chaque commentaire contient quelques mots ou plus, ce qui permet au lecteur de comprendre ce qui se passe dans un bloc de code spécifique. De plus, ces commentaires vous serviront de rappel plus tard lorsque vous devrez réviser votre code.

*   Les commentaires impliquent le placement //dans votre code, suivi d'un commentaire. Modifiez votre code comme suit pour intégrer les commentaires :

```c
  #include <cs50.h>
  #include <stdio.h>

  int main(void)
  {
      // Get size of grid
      int n;
      do
      {
          n = get_int("Size: ");
      }
      while (n < 1);

      // Print grid of bricks
      for (int i = 0; i < n; i++)
      {
          for (int j = 0; j < n; j++)
          {
              printf("#");
          }
          printf("\n");
      }
  }
  ```
Remarquez comment chaque commentaire commence par un //.


## Les abstactions

*   L'abstraction est l'art de simplifier notre code de sorte qu'il traite des problèmes de plus en plus petits.

*   En regardant votre code, vous pouvez voir comment deux problèmes essentiels dans notre code sont get size of grid et print grid of bricks .

*   Nous pouvons résumer ces deux problèmes en fonctions distinctes. Modifiez votre code comme suit :

```c

  #include <cs50.h>
  #include <stdio.h>

  int get_size(void);
  void print_grid(int n);

  int main(void)
  {
      int n = get_size();
      print_grid(n);
  }

  int get_size(void)
  {
      int n;
      do
      {
          n = get_int("Size: ");
      }
      while (n < 1);
      return n;
  }

  void print_grid(int n)
  {
      for (int i = 0; i < n; i++)
      {
          for (int j = 0; j < n; j++)
          {
              printf("#");
          }
          printf("\n");
      }
  }
```

Remarquez que nous avons maintenant trois fonctions. Tout d'abord, nous avons la mainfonction qui appelle deux autres fonctions appelées get_sizeet print_grid. Deuxièmement, nous avons une deuxième fonction appelée get_sizequi inclut le code exact que nous avions pour accomplir cette tâche auparavant. Troisièmement, nous avons une autre fonction appelée print_gridqui imprime la grille. Parce que nous avons fait abstraction des problèmes essentiels dans notre programme, notre mainfonction est très courte.

## operateur de type


*   Les opérateurs font référence aux opérations mathématiques prises en charge par votre compilateur. En C, ces opérateurs mathématiques incluent :

    *   +pour plus
    *   -pour la soustraction
    *   *pour la multiplication
    *   /pour division
    *   %pour le reste

*   Les types font référence aux données pouvant être stockées dans une variable. Par exemple, a charest conçu pour accueillir un seul caractère comme aou 2.
Les types sont très importants car chaque type a des limites spécifiques. Par exemple, en raison des limites de la mémoire, la valeur la plus élevée de an intpeut être 4294967296.

*   Les types avec lesquels vous pourriez interagir pendant ce cours incluent :

bool, une expression booléenne de vrai ou faux
char, un seul caractère comme a ou 2
double, une valeur à virgule flottante avec plus de chiffres qu'un flottant
float, une valeur à virgule flottante ou un nombre réel avec une valeur décimale
int, entiers jusqu'à une certaine taille, ou nombre de bits
long, des entiers avec plus de bits, donc ils peuvent compter plus qu'un int
string, une chaîne de caractères

*   Vous pouvez implémenter une calculatrice en C. Dans votre terminal, tapez code calculator.cet écrivez le code comme suit :

```c
  #include <cs50.h>
  #include <stdio.h>

  int main(void)
  {
      // Prompt user for x
      int x = get_int("x: ");

      // Prompt user for y
      int y = get_int("y: ");

      // Perform addition
      printf("%i\n", x + y);
  }

```
Remarquez comment la get_intfonction est utilisée pour obtenir deux fois un nombre entier de l'utilisateur. Un entier est stocké dans la intvariable appelée x. Un autre est stocké dans la intvariable appelée y. Ensuite, la printffonction imprime la valeur de x + y, désignée par le %isymbole .

Pendant que vous codez, portez une attention particulière aux types de variables que vous utilisez pour éviter les problèmes dans votre code.

## Résumé