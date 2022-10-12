



# Lecture 3  - Algorithmes 

- [Semaine 3 en anglais ](https://cs50.harvard.edu/x/2022/notes/3/)
- [Les notes 2022 en anglais ](https://cs50.harvard.edu/extension/2022/fall/notes/3/#welcome)
- [Vidéo Semaine 2](https://www.youtube.com/watch?v=4oqjcKenCH8)

## Table des matières 

* [Bienvenue](#Bienvenue)
* [Algorithmes](#Algorithmes)
* [Durée de fonctuonnement](#duree-de-fonctionnement)
* [recherche linéaire et binaire](#recherche-linéaire-et-binaire)
* [Tri](#Tri)
* [récusivité](#récusivite)
* [Tri par fusion](#Tri-par-fusion)

* [Résumé](#Résumé)

---

## Bienvenue

__Lien vers la vidéo  de l'[introduction](https://www.youtube.com/watch?v=4oqjcKenCH8&t=0s)__

*   Au cours de la semaine zéro, nous avons introduit l'idée d'un algorithme .

*   Cette semaine, nous allons développer notre compréhension des algorithmes à travers le pseudocode et dans le code lui-même.

*   Aussi, nous allons considérer l'efficacité de ces algorithmes. En effet, nous allons nous appuyer sur notre compréhension de la façon d'utiliser certains des concepts de niveau inférieur dont nous avons discuté la semaine dernière dans la construction d'algorithmes.

## Algorithmes

*   Rappelez-vous que la semaine dernière, on vous a présenté l'idée d'un tableau , des blocs de mémoire côte à côte.

*   Vous pouvez métaphoriquement imaginer un tableau comme une série de sept casiers rouges comme suit :

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/3/cs50Week3Slide018.png)

*   Nous pouvons imaginer que nous avons un problème essentiel de vouloir savoir, "Est-ce que le nombre 50 est à l'intérieur d'un tableau?"

*   Nous pouvons potentiellement confier notre tableau à un algorithme, dans lequel notre algorithme recherchera dans nos casiers pour voir si le numéro 50 se trouve derrière l'une des portes : en renvoyant la valeur true ou false.

https://cs50.harvard.edu/extension/2022/fall/notes/3/cs50Week3Slide022.png

*   Nous pouvons imaginer diverses instructions que nous pourrions fournir à notre algorithme pour entreprendre cette tâche comme suit :

```
  For each door from left to right
      If 50 is behind door
          Return true
  Return false
```

*   Notez que les instructions ci-dessus sont appelées pseudocode : Une version lisible par l'homme des instructions que nous pourrions fournir à l'ordinateur.

*   Un informaticien pourrait traduire ce pseudocode comme suit :

```
  For i from 0 to n-1
      If 50 is behind doors[i]
          Return true
  Return false
```

*   Notez que ce qui précède n'est toujours pas du code, mais c'est une approximation assez proche de ce à quoi pourrait ressembler le code final.

*   La recherche binaire est un algorithme de recherche qui pourrait être utilisé dans notre tâche de trouver le 50.

*   En supposant que les valeurs dans les casiers ont été classées du plus petit au plus grand, le pseudocode pour la recherche binaire apparaîtrait comme suit :

```
  If there are no doors
      Return false
  If 50 is behind middle door
      Return true
  Else if 50 < middle door
      Search left half
  Else if 50 > middle door
      Search right half
```

*   En utilisant la nomenclature du code, nous pouvons encore modifier notre algorithme comme suit :

```
  If no doors
      Return false
  If 50 is behind doors[middle]
      Return true
  Else if 50 < doors[middle]
      Search doors[0] through doors[middle-1]
  Else if 50 > doors[middle]
      Search doors[middle+1] through doors[n-1]
```

*   Remarquez, en regardant cette approximation du code, vous pouvez presque imaginer à quoi cela pourrait ressembler dans le code réel.


##  Durée de fonctionnement

*   le temps d'exécution implique une analyse utilisant la notation grand O. Jetez un oeil au graphique suivant :

*   graphique avec : « taille du problème » comme axe des abscisses ;  « temps de résolution » comme axe y ;  ligne droite rouge et raide de l'origine au sommet du graphique proche de la ligne droite jaune, moins raide de l'origine au sommet du graphique, toutes deux étiquetées "O(n)" ;  ligne verte et courbe qui devient de moins en moins raide de l'origine à la droite du graphique étiquetée "O(log n)

*   Dans le graphique ci-dessus, le premier algorithme est en. La seconde est enaussi bien. Le troisième est en.

*   C'est la forme de la courbe qui montre l'efficacité d'un algorithme. Certains temps de fonctionnement courants que nous pouvons voir sont :

*   Parmi les durées de fonctionnement ci-dessus,est considéré comme le pire temps d'exécution,est le plus rapide.

*   La recherche linéaire était de misecar il pourrait prendre n étapes dans le pire des cas pour s'exécuter.

*   La recherche binaire était de misecar il faudrait de moins en moins d'étapes pour fonctionner même dans le pire des cas.

*   Les programmeurs s'intéressent à la fois au pire des cas, ou borne supérieure , et au meilleur des cas, ou borne inférieure .

*   Lasymbole est utilisé pour désigner le meilleur cas d'un algorithme, tel que.
LaLe symbole est utilisé pour indiquer où la limite supérieure et la limite inférieure sont identiques, où les temps d'exécution dans le meilleur des cas et dans le pire des cas sont les mêmes.



##  Recherche linéaire et binaire

*   Vous pouvez implémenter nous-mêmes la recherche linéaire en tapant code search.cdans votre fenêtre de terminal et en écrivant le code comme suit :

```c
  #include <cs50.h>
  #include <stdio.h>

  int main(void)
  {
      // An array of integers
      int numbers[] = {20, 500, 10, 5, 100, 1, 50};

      // Search for number
      int n = get_int("Number: ");
      for (int i = 0; i < 7; i++)
      {
          if (numbers[i] == n)
          {
              printf("Found\n");
              return 0;
          }
      }
      printf("Not found\n");
      return 1;
  }
```

*   Notez que la ligne commençant par int numbers[]nous permet de définir les valeurs de chaque élément du tableau au fur et à mesure que nous le créons. Ensuite, dans la forboucle, nous avons une implémentation de la recherche linéaire.

*   Nous avons maintenant implémenté nous-mêmes la recherche linéaire en C !
Et si nous voulions rechercher une chaîne dans un tableau ? Modifiez votre code comme suit :
```c

  #include <cs50.h>
  #include <stdio.h>
  #include <string.h>

  int main(void)
  {
      // An array of strings
      string strings[] = {"battleship", "boot", "cannon", "iron", "thimble", "top hat"};

      // Search for string
      string s = get_string("String: ");
      for (int i = 0; i < 6; i++)
      {
          if (strcmp(strings[i], s) == 0)
          {
              printf("Found\n");
              return 0;
          }
      }
      printf("Not found\n");
      return 1;
  }
```

*   Notez que nous ne pouvons pas utiliser ==comme dans notre itération précédente de ce programme. Au lieu de cela, nous devons utiliser strcmp, qui vient de la string.hbibliothèque.

*   En effet, exécuter ce code nous permet de parcourir ce tableau de chaînes pour voir si une certaine chaîne s'y trouvait. Cependant, si vous voyez une erreur de segmentation , où une partie de la mémoire a été touchée par votre programme à laquelle il ne devrait pas avoir accès, assurez-vous d'avoir i < 6noté ci-dessus au lieu de i < 7.

*   Nous pouvons combiner ces idées de nombres et de chaînes dans un seul programme. Tapez code phonebook.cdans la fenêtre de votre terminal et écrivez le code comme suit :
```c
  #include <cs50.h>
  #include <stdio.h>
  #include <string.h>

  int main(void)
  {
      // Arrays of strings
      string names[] = {"Carter", "David"};
      string numbers[] = {"+1-617-495-1000", "+1-949-468-2750"};

      // Search for name
      string name = get_string("Name: ");
      for (int i = 0; i < 2; i++)
      {
          if (strcmp(names[i], name) == 0)
          {
              printf("Found %s\n", numbers[i]);
              return 0;
          }
      }
      printf("Not found\n");
      return 1;
  }
```

*   Notez que le numéro de Carter commence par +1-617et que le numéro de téléphone de David commence par '1-949'. Par conséquent, names[0]est Carter et numbers[0]est le numéro de Carter.

*   Bien que ce code fonctionne, il existe de nombreuses inefficacités. En effet, il est possible que les noms et les numéros des personnes ne correspondent pas. Ce ne serait pas bien si nous pouvions créer notre propre type de données où nous pourrions associer une personne au numéro de téléphone ?


##  Structures de données

*   Il s'avère que C permet de créer nos propres types de données via un fichier struct. Modifiez votre code comme suit :

```c
  #include <cs50.h>
  #include <stdio.h>
  #include <string.h>

  typedef struct
  {
      string name;
      string number;
  }
  person;

  int main(void)
  {
      person people[2];

      people[0].name = "Carter";
      people[0].number = "+1-617-495-1000";

      people[1].name = "David";
      people[1].number = "+1-949-468-2750";

      // Search for name
      string name = get_string("Name: ");
      for (int i = 0; i < 2; i++)
      {
          if (strcmp(people[i].name, name) == 0)
          {
              printf("Found %s\n", people[i].number);
              return 0;
          }
      }
      printf("Not found\n");
      return 1;
  }
```

*   Notez que le code commence par typedef structoù un nouveau type de données appelé personest défini. À l' intérieur de a personse trouve une chaîne appelée nameet un stringnuméro appelé. Dans la mainfonction, commencez par créer un tableau appelé peopledont le type personest de taille 2. Ensuite, nous mettons à jour les noms et numéros de téléphone des deux personnes de notre peopletableau. Plus important encore, notez comment la notation par points telle que people[0].namenous permet d'accéder personau 0ème emplacement et d'attribuer un nom à cet individu.

##  Tri

*   le tri est l'acte de prendre une liste de valeurs non triée et de transformer cette liste en une liste triée.

*   Lorsqu'une liste est triée, la recherche dans cette liste est beaucoup moins pénible pour l'ordinateur. Rappelons que nous pouvons utiliser la recherche binaire sur une liste triée, mais pas sur une liste non triée.

*   Il s'avère qu'il existe de nombreux types d'algorithmes de tri différents.

*   Le tri par sélection est l'un de ces algorithmes de recherche.

*   L'algorithme de tri par sélection en pseudocode est :
```
  For i from 0 to n–1
      Find smallest number between numbers[i] and numbers[n-1]
      Swap smallest number with numbers[i]

```

Considérez la liste non triée comme suit :

```c
  5 2 7 4 1 6 3 0
  ^
```
Le tri par sélection commencera par rechercher le plus petit nombre dans la liste et échangera ce nombre avec notre position actuelle dans la liste. Dans ce cas, le zéro est localisé et déplacé vers notre position actuelle.

 ```c
 0 | 2 7 4 1 6 3 5
```
Maintenant, notre problème est devenu plus petit puisque nous savons qu'au moins le début de notre liste est trié. Nous pouvons donc répéter ce que nous avons fait, en commençant par le deuxième numéro de la liste :

```c
  0 | 2 7 4 1 6 3 5
```
      ^    
1 est le plus petit nombre maintenant, nous allons donc l'échanger avec le deuxième nombre. Nous le répéterons encore…

```c
  0 1 | 7 4 2 6 3 5
```
        ^     
… et encore…

```python
  0 1 2 | 4 7 6 3 5
```
          ^
… et encore…

 ```c++
 0 1 2 3 | 7 6 4 5
```
            ^
… et encore …

```c
  0 1 2 3 4 | 6 7 5
```
              ^
etc.

*   Le tri à bulles est un autre algorithme de tri qui fonctionne en échangeant à plusieurs reprises des éléments pour "buller" des éléments plus grands jusqu'à la fin.

*   Le pseudocode pour le tri à bulles est :

```c
  Repeat n-1 times
  For i from 0 to n–2
      If numbers[i] and numbers[i+1] out of order
          Swap them
```
*   Nous commencerons par notre liste non triée, mais cette fois nous examinerons des paires de nombres et les échangerons s'ils ne sont pas dans l'ordre :

```c
5 2 7 4 1 6 3 0
^ ^
2 5 7 4 1 6 3 0
  ^ ^
2 5 7 4 1 6 3 0
    ^ ^
2 5 4 7 1 6 3 0
      ^ ^
2 5 4 1 7 6 3 0
        ^ ^
2 5 4 1 6 7 3 0
          ^ ^
2 5 4 1 6 3 7 0
            ^ ^
2 5 4 1 6 3 0 7

```
*   Maintenant, le nombre le plus élevé est tout à droite, nous avons donc amélioré notre problème. Nous allons répéter ceci:

```c
2 5 4 1 6 3 0 | 7
^ ^
2 5 4 1 6 3 0 | 7
  ^ ^
2 4 5 1 6 3 0 | 7
    ^ ^
2 4 1 5 6 3 0 | 7
      ^ ^
2 4 1 5 6 3 0 | 7
        ^ ^
2 4 1 5 3 6 0 | 7
          ^ ^
2 4 1 5 3 0 6 | 7
```
*   Maintenant, les deux plus grandes valeurs sont à droite. Nous répéterons encore :

  ```c
2 4 1 5 3 0 | 6 7
  ^ ^
  2 4 1 5 3 0 | 6 7
    ^ ^
  2 1 4 5 3 0 | 6 7
      ^ ^
  2 1 4 5 3 0 | 6 7
        ^ ^
  2 1 4 3 5 0 | 6 7
          ^ ^
  2 1 4 3 0 5 | 6 7

```
*   … et encore …

  ```c
2 1 4 3 0 | 5 6 7
  ^ ^
  1 2 4 3 0 | 5 6 7
    ^ ^
  1 2 3 4 0 | 5 6 7
      ^ ^
  1 2 3 4 0 | 5 6 7
        ^ ^
  1 2 3 0 4 | 5 6 7
```
*   … et encore …

```c
  1 2 3 0 | 4 5 6 7
  ^ ^
  1 2 3 0 | 4 5 6 7
    ^ ^
  1 2 3 0 | 4 5 6 7
      ^ ^
  1 2 0 3 | 4 5 6 7

```
*   … et encore …

```c
  1 2 0 | 3 4 5 6 7
  ^ ^
  1 2 0 | 3 4 5 6 7
    ^ ^
  1 0 2 | 3 4 5 6 7

```
*   … et enfin …

```c
  1 0 | 2 3 4 5 6 7
  ^ ^
  0 1 | 2 3 4 5 6 7
```
*   Notez qu'au fur et à mesure que nous parcourons notre liste, nous en savons de plus en plus qu'elle est triée, nous n'avons donc qu'à regarder les paires de nombres qui n'ont pas encore été triées.

*   En analysant le tri par sélection, nous n'avons effectué que sept comparaisons. En représentant cela mathématiquement, où n représente le nombre de cas, on pourrait dire que le tri par sélection peut être analysé comme :

```c
  (n-1)+(n-2)+(n-3)+ ... + 1
```

*   ou, plus simplement Pourquoi?

*   Compte tenu de cette analyse mathématique, n 2 est vraiment le facteur le plus influent pour déterminer l'efficacité de cet algorithme. Par conséquent, le tri par sélection est considéré comme étant de l'ordre dedans le pire des cas où toutes les valeurs ne sont pas triées. Même lorsque toutes les valeurs sont triées, cela prendra le même nombre d'étapes. Par conséquent, le meilleur des cas peut être noté comme. Étant donné que les cas de la borne supérieure et de la borne inférieure sont les mêmes, l'efficacité de cet algorithme dans son ensemble peut être considérée comme.

*   En analysant le tri à bulles, le pire des cas est. Le meilleur des cas est.
Vous pouvez visualiser une comparaison de ces algorithmes.

##  Récursivité

*   Comment pourrions-nous améliorer notre efficacité dans notre tri ?
La récursivité est un concept de programmation où une fonction s'appelle elle-même. Nous l'avons vu plus tôt lorsque nous avons vu…

  If no doors
      Return false
  If number behind middle door
      Return true
  Else if number < middle door
      Search left half
  Else if number > middle door
      Search right half
*   Notez que nous faisons appel searchà des itérations de plus en plus petites de ce problème.

*   De même, dans notre pseudocode pour la semaine 0, vous pouvez voir où la récursivité a été implémentée :

  1  Pick up phone book
  2  Open to middle of phone book
  3  Look at page
  4  If person is on page
  5      Call person
  6  Else if person is earlier in book
  7      Open to middle of left half of book
  8      Go back to line 3
  9  Else if person is later in book
  10     Open to middle of right half of book
  11     Go back to line 3
  12 Else
  13     Quit

*   Considérez comment, au cours de la semaine 1, nous voulions créer une structure pyramidale comme suit :

  #
  ##
  ###
  ####

*   Pour implémenter cela en utilisant la récursivité, tapez code recursion.cdans votre fenêtre de terminal et écrivez le code comme suit :

  #include <cs50.h>
  #include <stdio.h>

  void draw(int n);

  int main(void)
  {
      draw(1);
  }

  void draw(int n)
  {
      for (int i = 0; i < n; i++)
      {
          printf("#");
      }
      printf("\n");

      draw(n + 1);
  }

*   Notez que la fonction draw s'appelle elle-même. De plus, notez que votre code peut être pris dans une boucle infinie. Pour sortir de cette boucle, si vous êtes bloqué, appuyez ctrl-csur votre clavier. La raison pour laquelle cela crée une boucle infinie est que rien ne dit au programme de se terminer. Il n'y a aucun cas où le programme est terminé.

*   Nous pouvons corriger notre code comme suit :

```c
  #include <cs50.h>
  #include <stdio.h>

  void draw(int n);

  int main(void)
  {
      // Get height of pyramid
      int height = get_int("Height: ");

      // Draw pyramid
      draw(height);
  }

  void draw(int n)
  {
      // If nothing to draw
      if (n <= 0)
      {
          return;
      }

      // Draw pyramid of height n - 1
      draw(n - 1);

      // Draw one more row of width n
      for (int i = 0; i < n; i++)
      {
          printf("#");
      }
      printf("\n");
  }
```

*   Notez que le cas de base garantira que le code ne s'exécute pas indéfiniment. La ligne if (n <= 0)met fin à la récursivité car le problème a été résolu. Chaque fois drawqu'il s'appelle, il s'appelle par n-1. À un moment donné, n-1sera égal à 0, ce qui entraînera le drawretour de la fonction et le programme se terminera.

## Tri par fusion

*   Nous pouvons maintenant tirer parti de la récursivité dans notre quête d'un algorithme de tri plus efficace et implémenter ce qu'on appelle le tri par fusion , un algorithme de tri très efficace.

*   Le pseudocode pour le tri par fusion est assez court :

```c
  If only one number
      Quit
  Else
      Sort left half of number
      Sort right half of number
      Merge sorted halves
```

*   Considérez la liste de nombres suivante :

 ```c
 7254
```

*   Tout d'abord, le tri par fusion demande, "est-ce un numéro?" La réponse est "non", donc l'algorithme continue.

```c
  7254
```

*   Deuxièmement, le tri par fusion divisera désormais les nombres au milieu (ou aussi près que possible) et triera la moitié gauche des nombres.

```c

  72|54
```

*   Troisièmement, le tri par fusion regarderait ces nombres sur la gauche et demanderait, "est-ce un nombre?" Puisque la réponse est non, cela diviserait alors les nombres à gauche au milieu.

**  7|2**

*   Quatrièmement, le tri par fusion demandera à nouveau "est-ce un numéro?" La réponse est oui cette fois ! Par conséquent, il quittera cette tâche et reviendra à la dernière tâche en cours d'exécution à ce stade :

 ```python
 72|54
```
*   Cinquièmement, le tri par fusion triera les nombres sur la gauche.

```python
  27|54

```

*   Maintenant, nous revenons là où nous nous sommes arrêtés dans le pseudocode maintenant que le côté gauche a été trié. Un processus similaire des étapes 3 à 5 se produira avec les numéros de droite. Cela se traduira par :

**  27|45**

*   Les deux moitiés sont maintenant triées. Enfin, l'algorithme fusionnera les deux côtés. Il regardera le premier numéro à gauche et le premier numéro à droite. Il mettra le plus petit nombre en premier, puis le deuxième plus petit. L'algorithme répétera cela pour tous les nombres, ce qui donnera :

**  2457**

*   Le tri par fusion est terminé et le programme se ferme.

*   Le tri par fusion est un algorithme de tri très efficace avec un pire cas de. Le meilleur des cas est encorecar l'algorithme doit toujours visiter chaque endroit de la liste. Par conséquent, le tri par fusion est égalementpuisque le meilleur des cas et le pire des cas sont les mêmes.

*   Une visualisation finale a été partagée.

## Résumé

*   Dans cette leçon, vous avez découvert la pensée algorithmique et la création de vos propres types de données. Concrètement, vous avez appris…

    *   Algorithmes.
    *   Notation Grand O.
    *   Recherche binaire et recherche linéaire.
    *   Divers algorithmes de tri, y compris le tri à bulles, le tri par sélection et  le tri par fusion.
    *   Récursivité.
    
__À la prochaine!__