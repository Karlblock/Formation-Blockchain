# Lecture 2  - Tableau (Array)

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
__Lien vers la vidéo  de l'[introduction](https://www.youtube.com/watch?v=XmYnsO7iSI8&t=1s)__

*   Lors de notre session précédente, nous avons découvert C, un langage de programmation textuel.

*   Cette semaine, nous allons examiner de plus près les éléments de base supplémentaires qui soutiendront nos objectifs d'en savoir plus sur la programmation de bas en haut.

*   Fondamentalement, en plus des éléments essentiels de la programmation, ce cours porte sur la résolution de problèmes. En conséquence, nous nous concentrerons également sur la manière d'aborder les problèmes informatiques.


##  Compiler


*   Le cryptage consiste à cacher du texte brut aux regards indiscrets. déchiffrer est donc l'acte de prendre un morceau de texte chiffré et de le remettre sous une forme lisible par l'homme.

*   Un morceau de texte crypté peut ressembler à ce qui suit :

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/2/cs50Week2Slide008.png)

*   Rappelez-vous que la semaine dernière, vous avez entendu parler d'un compilateur , un programme informatique spécialisé qui convertit le code source en code machine compréhensible par un ordinateur.

*   Par exemple, vous pourriez avoir un programme informatique qui ressemble à ceci :

```c
 #include <stdio.h>

  int main(void)
  {
      printf("hello, world\n");
  }
```


*   Un compilateur prendra le code ci-dessus et le transformera en code machine suivant :


![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/2/cs50Week2Slide012.png)

*   VS Code , l'environnement de programmation qui vous est fourni en tant qu'étudiant CS50, utilise un compilateur appelé clangou langage c .

*   Si vous deviez taper make hello, il exécute une commande qui exécute clang pour créer un fichier de sortie que vous pouvez exécuter en tant qu'utilisateur.

*   VS Code a été préprogrammé de manière à makeexécuter de nombreux arguments de ligne de commande avec clang pour votre commodité en tant qu'utilisateur.

*   Considérez le code suivant :
```c
  #include <cs50.h>
  #include <stdio.h>

  int main(void)
  {
      string name = get_string("What's your name? ");
      printf("hello, %s\n", name);
  }
  ```

*   Vous pouvez essayer d'entrer dans la fenêtre du terminal : clang -o hello hello.c. Vous rencontrerez une erreur indiquant que clang ne sait pas où trouver la cs50.hbibliothèque.

*   En essayant à nouveau de compiler ce code, exécutez la commande suivante dans la fenêtre du terminal : clang -o hello hello.c -lcs50. Cela permettra au compilateur d'accéder à la cs50.hbibliothèque.

*   S'exécutant dans la fenêtre du terminal ./hello, votre programme s'exécutera comme prévu.

*   Bien que ce qui précède soit proposé à titre d'illustration, de sorte que vous puissiez comprendre plus profondément le processus et le concept de compilation de code, l'utilisation makedans CS50 est parfaitement correcte et l'attente !

*   La compilation implique des étapes majeures, notamment les suivantes :
    *   Tout d'abord, le prétraitement est l'endroit où les fichiers d'en-tête de votre code, désignés par un #(tel que #include \<cs50.h\>) sont effectivement copiés et collés dans votre fichier. Au cours de cette étape, le code de cs50.hest copié dans votre programme. De même, tout comme votre code contient #include \<stdio.h\>, le code contenu stdio.hquelque part sur votre ordinateur est copié dans votre programme. Cette étape peut être visualisée comme suit :

    ```c      ...
        string get_string(string prompt);
        int printf(string format, ...);
        ...

        int main(void)
        {
            string name = get_string("What's your name? ");
            printf("hello, %s\n", name);
        }```

*   Deuxièmement, la compilation est l'endroit où votre programme est converti en code assembleur. Cette étape peut être visualisée comme suit :

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/2/cs50Week2Slide033.png)


*   Troisièmement, l' assemblage implique que le compilateur convertit votre code d'assemblage en code machine. Cette étape peut être visualisée comme suit :

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/2/cs50Week2Slide038.png)

*   Enfin, lors de l' étape de liaison , le code de vos bibliothèques incluses est également converti en code machine et combiné avec votre code. Le fichier exécutable final est ensuite sorti.

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/2/cs50Week2Slide049.png)


##  Deboger

*   Tout le monde fera des erreurs lors du codage.

*   Considérez l'image suivante de la semaine dernière :

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/2/cs50Week2Slide061.png)

En outre, considérez le code suivant dans lequel un bogue a été inséré à dessein :

```c
  #include <stdio.h>

  int main(void)
  {
      for (int i = 0; i <= 3; i++)
      {
          printf("#\n");
      }
  }
```

*   Tapez code buggy0.cdans la fenêtre du terminal et écrivez le code ci-dessus.
En exécutant ce code, quatre briques apparaissent au lieu des trois prévues.
printfest un moyen très utile de déboguer votre code. Vous pourriez modifier votre code comme suit :

```c
  #include <stdio.h>

  int main(void)
  {
      for (int i = 0; i <= 3; i++)
      {
          printf("i is %i\n", i);
          printf("#\n");
      }
  }
```

*   En exécutant ce code, vous verrez de nombreuses instructions, notamment i is 0, i is 1, i is 2et i is 3. En voyant cela, vous vous rendrez peut-être compte que le code supplémentaire doit être corrigé comme suit :

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

Notez que le <=a été remplacé par <.

*   Un deuxième outil de débogage est appelé un débogueur , un outil logiciel créé par des programmeurs pour aider à traquer les bogues dans le code.
Dans VS Code, un débogueur préconfiguré vous a été fourni.
Pour utiliser ce débogueur, définissez d'abord un point d' arrêt en cliquant à gauche d'une ligne de votre code, juste à gauche du numéro de ligne. Lorsque vous cliquez dessus, vous verrez apparaître un point rouge. Imaginez cela comme un panneau d'arrêt, demandant au compilateur de faire une pause afin que vous puissiez considérer ce qui se passe dans cette partie de votre code.

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/2/cs50Week2Debugging.png)

*   Deuxièmement, courez debug50 ./buggy0. Vous remarquerez qu'après l'activation du débogueur, une ligne de votre code s'illuminera d'une couleur dorée. Littéralement, le code s'est arrêté à cette ligne de code. Remarquez dans le coin supérieur gauche comment toutes les variables locales sont affichées, y compris i, qui a une valeur actuelle de 0. En haut de votre fenêtre, vous pouvez cliquer sur le step overbouton et il continuera à se déplacer dans votre code. Remarquez comment la valeur de iaugmente.

*   Bien que cet outil ne vous montre pas où se trouve votre bogue, il vous aidera à ralentir et à voir comment votre code s'exécute étape par étape.

*   Pour illustrer un troisième moyen de débogage, veuillez démarrer un nouveau fichier en l'exécutant code buggy1.cdans la fenêtre de votre terminal. Ecrivez votre code comme suit :

```c

  #include <cs50.h>
  #include <stdio.h>

  int get_negative_int(void);

  int main(void)
  {
      int i = get_negative_int();
      printf("%i\n", i);
  }

  // Prompt user for positive integer
  int get_negative_int(void)
  {
      int n;
      do
      {
          n = get_int("Negative Integer: ");
      }
      while (n < 0);
      return n;
  }

```

*   Notice get_negative_intest conçu pour obtenir un entier négatif de l'utilisateur.

*   En cours d' exécution make buggy1, vous remarquerez qu'il ne fonctionne pas comme prévu. Il accepte les entiers positifs et semble ignorer les négatifs.
Comme précédemment, définissez un point d'arrêt sur une ligne de votre code. Le mieux est de définir un point d'arrêt à int i = get_negative_int. Maintenant, cours debug50 buggy1.

*   Contrairement à avant, où vous utilisiez le step overbouton en haut de la fenêtre, utilisez le step intobouton . Cela amènera le débogueur dans votre get_negative_intfonction. Remarquez comment cela vous montrera que vous êtes, en effet, coincé dans la do whileboucle.

*   Avec cette connaissance, vous pourriez vous demander pourquoi vous êtes coincé dans cette boucle, ce qui vous amène à modifier votre code comme suit :

```c
  #include <cs50.h>
  #include <stdio.h>

  int get_negative_int(void);

  int main(void)
  {
      int i = get_negative_int();
      printf("%i\n", i);
  }

  // Prompt user for positive integer
  int get_negative_int(void)
  {
      int n;
      do
      {
          n = get_int("Negative Integer: ");
      }
      while (n >= 0);
      return n;
  }
```

L'avis n < 0a été modifié.

*   Une dernière forme de débogage est appelée débogage du canard en caoutchouc . Lorsque vous rencontrez des difficultés avec votre code, pensez à parler à haute voix, littéralement, à un canard en caoutchouc du problème de code. Si vous préférez ne pas parler à un petit canard en plastique, vous pouvez parler à un humain près de chez vous ! Ils n'ont pas besoin de comprendre comment programmer : parler avec eux est l'occasion pour vous de parler de votre code.

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/2/cs50Week2Slide070.png)


##  Tableaux

*   Au cours de la semaine 0, nous avons parlé des types de données tels que bool, int, char, string, etc.

*   Chaque type de données nécessite une certaine quantité de ressources système :

    *   bool1 octet
    *   int4 octets
    *   long8 octets
    *   float4 octets
    *   double8 octets
    *   char1 octet
    *   string? octets

*   À l'intérieur de votre ordinateur, vous disposez d'une quantité limitée de mémoire disponible.

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/2/cs50Week2Slide084.png)

*   Physiquement, sur la mémoire de votre ordinateur, vous pouvez imaginer comment des types de données spécifiques sont stockés sur votre ordinateur. Vous pouvez imaginer qu'un char, qui ne nécessite qu'un octet de mémoire, peut ressembler à ceci :

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/2/cs50Week2Slide087.png)

De même, un int, qui nécessite 4 octets peut ressembler à ceci :

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/2/cs50Week2Slide088.png)

*   Nous pouvons créer un programme qui explore ces concepts. Dans votre terminal, tapez code scores.cet écrivez le code comme suit :

```c
  #include <stdio.h>

  int main(void)
  {
      // Scores
      int score1 = 72;
      int score2 = 73;
      int score3 = 33;

      // Print average
      printf("Average: %f\n", (score1 + score2 + score3) / 3.0);
  }
```

*   Notez que le nombre à droite est une valeur à virgule flottante de 3.0, de sorte que le calcul est rendu comme une valeur à virgule flottante à la fin.

*   En cours d' exécution make scores, le programme s'exécute.
Vous pouvez imaginer comment ces variables sont stockées en mémoire :

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/2/cs50Week2Slide098.png)

Les tableaux sont un moyen de stocker des données dos à dos dans la mémoire de sorte que ces données soient facilement accessibles.
int scores[3]est une façon de dire au compilateur de vous fournir trois emplacements dos à dos en mémoire de taille intpour stocker trois fichiers scores. Compte tenu de notre programme, vous pouvez réviser votre code comme suit :

```c
  #include <cs50.h>
  #include <stdio.h>

  int main(void)
  {
      // Scores
      int scores[3];
      scores[0] = 72;
      scores[1] = 73;
      scores[2] = 33;

      // Print average
      printf("Average: %f\n", (scores[0] + scores[1] + scores[2]) / 3.0);
  }
```

*   Notez que score[0]examine la valeur à cet emplacement de la mémoire par indexing intole tableau appelé scoresà l'emplacement 0pour voir quelle valeur y est stockée.

*   Vous pouvez voir comment, bien que le code ci-dessus fonctionne, il existe encore une possibilité d'améliorer notre code. Révisez votre code comme suit :
```c

  #include <cs50.h>
  #include <stdio.h>

  int main(void)
  {
      // Get scores
      int scores[3];
      for (int i = 0; i < 3; i++)
      {
          scores[i] = get_int("Score: ");
      }

      // Print average
      printf("Average: %f\n", (scores[0] + scores[1] + scores[2]) / 3.0);
  }

```
Remarquez comment nous indexons into scoresen utilisant scores[i]where iest fourni par la forboucle.

Nous pouvons simplifier ou abstraire le calcul de la moyenne. Modifiez votre code comme suit :

```c
  #include <cs50.h>
  #include <stdio.h>

  // Constant
  const int N = 3;

  // Prototype
  float average(int length, int array[]);

  int main(void)
  {
      // Get scores
      int scores[N];
      for (int i = 0; i < N; i++)
      {
          scores[i] = get_int("Score: ");
      }

      // Print average
      printf("Average: %f\n", average(N, scores));
  }

  float average(int length, int array[])
  {
      // Calculate average
      int sum = 0;
      for (int i = 0; i < length; i++)
      {
          sum += array[i];
      }
      return sum / (float) length;
  }
```

*   Notez qu'une nouvelle fonction appelée averageest déclarée. De plus, notez qu'une constvaleur ou constante de Nest déclarée. Plus important encore, notez comment la averagefonction prend int array[], ce qui signifie que le compilateur passe un tableau à cette fonction.

*   Non seulement les tableaux peuvent être des conteneurs : ils peuvent être passés entre des fonctions.


##  String

*   A stringest simplement un tableau de variables de type char: un tableau de caractères.

*   En considérant l'image suivante, vous pouvez voir comment une chaîne est un tableau de caractères qui commence par le premier caractère et se termine par un caractère spécial appelé a NUL character:

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/2/cs50Week2Slide116.png)

*   En imaginant cela en décimal, votre tableau ressemblerait à ceci :

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/2/cs50Week2Slide117.png)

*   Implémentez ceci dans votre propre code, tapez code hi.cdans la fenêtre du terminal et écrivez le code comme suit :

```c
  #include <stdio.h>

  int main(void)
  {
      char c1 = 'H';
      char c2 = 'I';
      char c3 = '!';

      printf("%i %i %i\n", c1, c2, c3);
  }
```

Notez que cela affichera les valeurs décimales de chaque caractère.

Pour mieux comprendre comment stringfonctionne a, révisez votre code comme suit :

```c
  #include <cs50.h>
  #include <stdio.h>

  int main(void)
  {
      string s = "HI!";
      printf("%i %i %i\n", s[0], s[1], s[2]);
  }
```

Remarquez comment l' printfinstruction présente trois valeurs de notre tableau appelé s.

Imaginons que nous voulons dire à la fois HI!et BYE!. Modifiez votre code comme suit :

```c
  #include <cs50.h>
  #include <stdio.h>

  int main(void)
  {
      string s = "HI!";
      string t = "BYE!";

      printf("%s\n", s);
      printf("%s\n", t);
  }
```

Notez que deux chaînes sont déclarées et utilisées dans cet exemple.

Vous pouvez visualiser ceci comme suit :

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/2/cs50Week2Slide126.png)

Nous pouvons encore améliorer ce code. Modifiez votre code comme suit :

```c
  #include <cs50.h>
  #include <stdio.h>

  int main(void)
  {
      string words[2];

      words[0] = "HI!";
      words[1] = "BYE!";

      printf("%s\n", words[0]);
      printf("%s\n", words[1]);
  }
```

Notez que les deux chaînes sont stockées dans un seul tableau de type string.

Un problème courant en programmation, et peut-être en C plus spécifiquement, est de découvrir la longueur d'un tableau. Comment pourrions-nous implémenter cela dans le code ? Tapez code length.cdans la fenêtre du terminal et codez comme suit :

```c
  #include <cs50.h>
  #include <stdio.h>

  int main(void)
  {
      // Prompt for user's name
      string name = get_string("Name: ");

      // Count number of characters up until '\0' (aka NUL)
      int n = 0;
      while (name[n] != '\0')
      {
          n++;
      }
      printf("%i\n", n);
  }
```

*   Notez que ce code boucle jusqu'à ce que le NULcaractère soit trouvé.

*   Comme il s'agit d'un problème si courant dans la programmation, d'autres programmeurs ont créé du code dans la string.hbibliothèque pour trouver la longueur d'une chaîne. Vous pouvez trouver la longueur d'une chaîne en modifiant votre code comme suit :

```c
  #include <cs50.h>
  #include <stdio.h>
  #include <string.h>

  int main(void)
  {
      // Prompt for user's name
      string name = get_string("Name: ");
      int length = strlen(name);
      printf("%i\n", length);
  }
```

*   Notez que ce code utilise la string.hbibliothèque, déclarée en haut du fichier. De plus, il utilise une fonction de cette bibliothèque appelée strlen, qui calcule la longueur de la chaîne qui lui est transmise.

*   ctype.hest une autre bibliothèque qui est très utile. Imaginez que nous voulions créer un programme qui convertit tous les caractères minuscules en majuscules. Dans la fenêtre du terminal, tapez code uppercase.

*   cet écrivez le code comme suit :

```c
  #include <cs50.h>
  #include <stdio.h>
  #include <string.h>

  int main(void)
  {
      string s = get_string("Before: ");
      printf("After:  ");
      for (int i = 0, n = strlen(s); i < n; i++)
      {
          if (s[i] >= 'a' && s[i] <= 'z')
          {
              printf("%c", s[i] - 32);
          }
          else
          {
              printf("%c", s[i]);
          }
      }
      printf("\n");
  }
```

*   Notez que ce code parcourt chaque valeur de la chaîne. Le programme examine chaque caractère. Si le caractère est en minuscule, il lui soustrait la valeur 32 pour le convertir en minuscule.

*   En rappelant nos travaux précédents de la semaine dernière, vous vous souviendrez peut-être de ce tableau des valeurs ASCII :

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/2/cs50Week2Slide120.png)

*   Lorsqu'un caractère minuscule en a été 32soustrait, il en résulte une version majuscule de ce même caractère.

*   Bien que le programme fasse ce que nous voulons, il existe un moyen plus simple d'utiliser la ctype.hbibliothèque. Modifiez votre programme comme suit :


```c
  #include <cs50.h>
  #include <ctype.h>
  #include <stdio.h>
  #include <string.h>

  int main(void)
  {
      string s = get_string("Before: ");
      printf("After:  ");
      for (int i = 0, n = strlen(s); i < n; i++)
      {
          if (islower(s[i]))
          {
              printf("%c", toupper(s[i]));
          }
          else
          {
              printf("%c", s[i]);
          }
      }
      printf("\n");
  }
```
*   Notez que le programme utilise islowerpour détecter si chaque caractère est en majuscule ou en minuscule. Ensuite, la toupperfonction est passée s[i]. Chaque caractère (si minuscule) est converti en majuscule.

*   Encore une fois, bien que ce programme fasse ce qui est souhaité, il y a une possibilité d'amélioration. Comme la documentation pour les ctype.hétats, toupperest assez intelligente pour savoir que si elle est passée ce qui est déjà une lettre majuscule, elle l'ignorera simplement. Par conséquent, nous n'avons plus besoin de notre ifdéclaration. Vous pouvez simplifier ce code comme suit :

```c
  #include <cs50.h>
  #include <ctype.h>
  #include <stdio.h>
  #include <string.h>

  int main(void)
  {
      string s = get_string("Before: ");
      printf("After:  ");
      for (int i = 0, n = strlen(s); i < n; i++)
      {
          printf("%c", toupper(s[i]));
      }
      printf("\n");
  }

```

*   Notez que ce code est assez simplifié, supprimant l' ifinstruction inutile.

*   Vous pouvez lire toutes les fonctionnalités de la ctypebibliothèque sur les pages du manuel .