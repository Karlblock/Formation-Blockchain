# Lecture 2  - Tableau (Array)

- [Semaine 2 en anglais ](https://cs50.harvard.edu/x/2022/notes/2/)
- [Les notes 2022 en anglais ](https://cs50.harvard.edu/extension/2022/fall/notes/2/#welcome)
- [Vidéo Semaine 2](https://www.youtube.com/watch?v=ywg7cW0Txs4)

## Table des matières 

* [Bienvenue](#Bienvenue)
* [Compiler](#Compiler)
* [Deboger](#deboger)
* [Tableaux](#Tableaux)
* [Cordes](#Cordes)
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