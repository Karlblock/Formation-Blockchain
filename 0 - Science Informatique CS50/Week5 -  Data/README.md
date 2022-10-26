# Lecture 5  - Data 

- [Semaine 5 en anglais ](https://cs50.harvard.edu/x/2022/notes/5/)
- [Les notes 2022 en anglais ](https://cs50.harvard.edu/extension/2022/fall/notes/5/#welcome)
- [Vidéo Semaine 5](https://www.youtube.com/watch?v=X8h4dq9Hzq8&t=1s)

## Table des matières 

* [Bienvenue](#Bienvenue)
* [Structures de données](#Structures-de-données)
* [Stacks and Queues](#Stacks-and-Queues)
* [Piles et files d'attente](#Piles-et-files-d'attente)
* [Jack apprend les faits](#Jack-apprend-les-faits)
* [Redimensionner les tableaux](#Redimensionner-les-tableaux)
* [Des arbres](#Des-arbres)
* [Dictionnaires](#Dictionnaires)
* [Hachage et tables de hachage](#Hachage-et-tables-de-hachage)
* [Essaie](#Essaie)
* [Résumé](#Résumé)

---

##  Accueillir !

*   Toutes les semaines précédentes vous ont présenté les éléments fondamentaux de la programmation.

*   Tout ce que vous avez appris en C vous permettra d'implémenter ces blocs de construction dans des langages de programmation de niveau supérieur tels que Python.

 *   Aujourd'hui, nous allons parler de l'organisation des données en mémoire.

---

##  Structures de données

*   Les structures de données sont essentiellement des formes d'organisation en mémoire.

*   Il existe de nombreuses façons d'organiser les données en mémoire.

*   Les structures de données abstraites sont celles que nous pouvons imaginer conceptuellement. Lors de l'apprentissage de l'informatique, il est souvent utile de commencer par ces structures de données conceptuelles. En les apprenant, il sera plus facile par la suite de comprendre comment mettre en œuvre des structures de données plus concrètes.

---

##  Piles et files d'attente

*   Les files d'attente sont une forme de structure de données abstraite.

*   Les files d'attente ont des propriétés spécifiques. À savoir, ils sont FIFO ou "premier entré, premier sorti". Vous pouvez vous imaginer dans une file d'attente pour une balade dans un parc d'attractions. La première personne de la file est la première à monter dans le manège. La dernière personne peut faire le trajet en dernier.

Les files d'attente sont associées à des actions spécifiques. Par exemple, un élément peut être mis en file d' attente ; c'est-à-dire que l'élément peut rejoindre la ligne ou la file d'attente. De plus, un article peut être retiré de la file d'attente ou quitter la file d'attente une fois qu'il atteint le début de la file.

*   Les files d'attente contrastent avec une pile . Fondamentalement, les propriétés d'une pile sont différentes de celles d'une file d'attente. Plus précisément, c'est LIFO ou "dernier entré, premier sorti". Tout comme empiler des plateaux dans une cafétéria, un plateau qui est placé en dernier dans une pile est le premier qui peut être ramassé.

*   Les piles ont des actions spécifiques qui leur sont associées. Par exemple, push place quelque chose au sommet d'une pile. Pop retire quelque chose du haut de la pile.

Dans le code, vous pouvez imaginer une pile comme suit :

```c

  const int CAPACITY = 50;

  typedef struct
  {
      person people[CAPACITY];
      int size;
  }
  stack;

```

*   Notez qu'un tableau appelé people est de type person.  la valeur CAPACITY est à quelle hauteur la pile pourrait être. L'entier size est le niveau de remplissage réel de la pile, quelle que soit sa capacité .

*   Vous pouvez imaginer que le code ci-dessus a une limitation. Étant donné que la capacité du tableau est toujours prédéterminée dans ce code. Par conséquent, la pile peut toujours être surdimensionnée. Vous pourriez imaginer n'utiliser qu'une seule place dans la pile sur 5000.

*   Ce serait bien que notre pile soit dynamique - capable de croître au fur et à mesure que des éléments y sont ajoutés.

---

##  Jack apprend les faits

*   Nous avons regardé une vidéo intitulée Jack Learns the Facts par le professeur Shannon Duvall de l'Université d'Elon.

---

## Redimensionner les tableaux

*   Revenant à la semaine 2, nous vous avons présenté votre première structure de données.

*   Un tableau est un bloc de mémoire contigu.

*   Vous pouvez imaginer un tableau comme suit :

![*](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide019.png)

*   En mémoire, d'autres valeurs sont stockées par d'autres programmes, fonctions et variables. Beaucoup d'entre eux peuvent être des valeurs parasites inutilisées qui ont été utilisées à un moment donné mais qui sont maintenant disponibles pour être utilisées.

![trois boîtes avec 1 2 3 parmi plein d'autres éléments de mémoire](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide022.png)

*   Imaginez que vous souhaitiez stocker une quatrième valeur 4 dans notre tableau ? Ce qu'il faudrait, c'est allouer une nouvelle zone de mémoire et déplacer l'ancien tableau vers un nouveau.

![e](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide025.png)

*   Les anciennes valeurs parasites seraient écrasées par nos nouvelles données.

![Tu](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide026.png)

*   L'un des inconvénients de cette approche est qu'elle est mal conçue : chaque fois que nous ajoutons un nombre, nous devons copier le tableau élément par élément.

*   Ne serait-ce pas bien si nous pouvions mettre le 4 ailleurs en mémoire ? Par définition, ce ne serait plus un tableau car le 4  serait plus en mémoire contiguë.

*   Dans votre terminal, tapez code list.cet écrivez le code comme suit :

```c

  // Implements a list of numbers with an array of fixed size

  #include <stdio.h>

  int main(void)
  {
      // List of size 3
      int list[3];

      // Initialize list with numbers
      list[0] = 1;
      list[1] = 2;
      list[2] = 3;

      // Print list
      for (int i = 0; i < 3; i++)
      {
          printf("%i\n", list[i]);
      }
  }
```

Notez que ce qui précède ressemble beaucoup à ce que nous avons appris plus tôt dans ce cours. Nous avons de la mémoire préallouée pour trois éléments.

*   En nous appuyant sur nos connaissances acquises plus récemment, nous pouvons tirer parti de notre compréhension des pointeurs pour créer une meilleure conception dans ce code. Modifiez votre code comme suit :

```c
  // Implements a list of numbers with an array of dynamic size

  #include <stdio.h>
  #include <stdlib.h>

  int main(void)
  {
      // List of size 3
      int *list = malloc(3 * sizeof(int));
      if (list == NULL)
      {
          return 1;
      }

      // Initialize list of size 3 with numbers
      list[0] = 1;
      list[1] = 2;
      list[2] = 3;

      // List of size 4
      int *tmp = malloc(4 * sizeof(int));
      if (tmp == NULL)
      {
          free(list);
          return 1;
      }

      // Copy list of size 3 into list of size 4
      for (int i = 0; i < 3; i++)
      {
          tmp[i] = list[i];
      }

      // Add number to list of size 4
      tmp[3] = 4;

      // Free list of size 3
      free(list);

      // Remember list of size 4
      list = tmp;

      // Print list
      for (int i = 0; i < 4; i++)
      {
          printf("%i\n", list[i]);
      }

      // Free list
      free(list);
      return 0;
```

*   Notez qu'une liste d'entiers de taille trois est créée. Ensuite, trois adresses mémoire peuvent être affectées aux valeurs 1, 2et 3. Ensuite, une liste de taille quatre est créée. Ensuite, la liste est copiée du premier au second. La valeur de 4est ajoutée à la tmpliste. Le bloc de mémoire sur lequel listpointe n'étant plus utilisé, il est libéré à l'aide de la commande free(list). Enfin, le compilateur est invité à pointer le listpointeur vers le bloc de mémoire tmpvers lequel il pointe. Le contenu de listest imprimé puis libéré.

*   Il est utile de penser à listet tmpcomme les deux signes qui pointent vers un morceau de mémoire. Comme dans l'exemple ci-dessus, listà un moment pointé vers un tableau de taille 3. À la fin, liston lui a dit de pointer vers un morceau de mémoire de taille 4. Techniquement, à la fin du code ci-dessus, tmples listdeux pointaient vers le même bloc de mémoire.

*   C'est livré avec une fonction très utile appelée reallocqui réaffectera la mémoire pour vous. reallocprend deux arguments. Tout d'abord, il vous demande de spécifier le tableau que vous essayez de copier. Deuxièmement, il vous demande de spécifier la taille à laquelle vous souhaitez que le tableau final soit. Modifiez votre code comme suit :

```c
  // Implements a list of numbers with an array of dynamic size using realloc

  #include <stdio.h>
  #include <stdlib.h>

  int main(void)
  {
      // List of size 3
      int *list = malloc(3 * sizeof(int));
      if (list == NULL)
      {
          return 1;
      }

      // Initialize list of size 3 with numbers
      list[0] = 1;
      list[1] = 2;
      list[2] = 3;

      // Resize list to be of size 4
      int *tmp = realloc(list, 4 * sizeof(int));
      if (tmp == NULL)
      {
          free(list);
          return 1;
      }
      list = tmp;

      // Add number to list
      list[3] = 4;

      // Print list
      for (int i = 0; i < 4; i++)
      {
          printf("%i\n", list[i]);
      }

      // Free list
      free(list);
      return 0;
  }
```

*   Notez que int *tmp = realloc(list, 4 * sizeof(int))crée une liste d'entiers de taille quatre. Ensuite, il copie les valeurs de listdans ce nouveau tableau. Enfin, un pointeur nommé tmppointe sur l'emplacement mémoire de ce nouveau tableau. La copie est gérée par realloc. Une fois cette copie effectuée, la mémoire à l'emplacement de listest libérée. Ensuite, le pointeur appelé listest pointé à l'emplacement de tmp, où se trouve le nouveau tableau.

*   Vous pouvez imaginer à quel point l'utilisation reallocd'une file d'attente ou d'une pile pourrait être utile. À mesure que la quantité de données augmente, reallocpeut être utilisé pour augmenter ou réduire la pile ou la file d'attente.

---

##  Listes liées

*   Ces dernières semaines, vous avez découvert trois primitives utiles. A structest un type de données que vous pouvez définir vous-même. Une notation. entre points vous permet d'accéder aux variables à l'intérieur de cette structure. L' opérateur permet de déclarer un pointeur ou de déréférencer une variable.*

*   Aujourd'hui, vous êtes présenté à l' ->opérateur. C'est une flèche. Cet opérateur va à une adresse et regarde à l'intérieur d'une structure.

*   Une liste chaînée est l'une des structures de données les plus puissantes du C. Une liste chaînée vous permet d'inclure des valeurs situées dans différentes zones de la mémoire. De plus, ils vous permettent de développer et de réduire dynamiquement la liste à votre guise.

*   Vous pouvez imaginer trois valeurs stockées dans trois zones différentes de la mémoire comme suit :

![Trois cases avec 1 2 3 dans des zones de mémoire séparées](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide036.png)

*   Comment pourrait-on assembler ces valeurs dans une liste ?

*   Nous pourrions imaginer ces données illustrées ci-dessus comme suit :

![Trois attachées](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide037.png)

*   Nous pourrions utiliser plus de mémoire pour savoir où se trouve l'élément suivant.

![Trois boîtes avec 1 2 3 dans des zones de mémoire séparées avec des boîtes plus petites attachées où les adresses de mémoire sont dans ces boîtes attachées](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide041.png)

Notez que NULL est utilisé pour indiquer que rien d'autre n'est le prochain dans la liste.

*   Par convention, nous conserverions un élément supplémentaire en mémoire, un pointeur, qui garde la trace du premier élément de la liste.

![Trois boîtes avec 1 2 3 dans des zones de mémoire séparées avec des boîtes plus petites attachées où les adresses mémoire sont dans ces boîtes attachées maintenant avec une dernière boîte avec l'adresse mémoire de la première boîte](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide042.png)

*   En faisant abstraction des adresses mémoire, la liste apparaîtrait comme suit :

![Trois cases avec dans des zones de mémoire séparées avec des cases plus petites avec une case finale où une case pointe vers une autre et une autre jusqu'à la fin des cases](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide043.png)

*   Ces boîtes sont appelées nœuds . Un nœud contient à la fois un élément et un pointeur appelé next . En code, vous pouvez imaginer un nœud comme suit :

```c
  typedef struct node
  {
      int number;
      struct node *next;
  }
  node;
```

Notez que l'élément contenu dans ce nœud est un entier appelé number. Deuxièmement, un pointeur vers un nœud appelé nextest inclus, qui pointera vers un autre nœud quelque part en mémoire.

*   Les listes chaînées ne sont pas stockées dans un bloc de mémoire contigu. Ils peuvent grandir autant que vous le souhaitez, à condition que suffisamment de ressources système existent. L'inconvénient, cependant, est qu'il faut plus de mémoire pour garder une trace de la liste au lieu d'un tableau. En effet, pour chaque élément, vous devez stocker non seulement la valeur de l'élément, mais également un pointeur vers le nœud suivant. De plus, les listes liées ne peuvent pas être indexées comme c'est possible dans un tableau car nous devons passer par le premieréléments pour trouver l'emplacement deème élément. Pour cette raison, la liste illustrée ci-dessus doit être recherchée de manière linéaire. La recherche binaire n'est donc pas possible dans une liste construite comme ci-dessus.

*   Conceptuellement, nous pouvons imaginer le processus de création d'une liste chaînée. Tout d'abord, node *listest déclaré, mais il est d'une valeur poubelle.

![##  Une valeur poubelle](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide055.png)

*   Ensuite, un nœud appelé nest alloué en mémoire.

![liste](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide059.png)

*   Ensuite, le numbernœud of reçoit la valeur 1.

![n pointant vers un nœud avec 1 comme nombre et valeur parasite comme prochain](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide064.png)

*   Ensuite, le nextchamp du nœud est affecté NULL.

![n pointant vers un nœud avec 1 comme nombre et null comme valeur de suivant](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide066.png)

Ensuite, listest pointé à l'emplacement de la mémoire où npointe. net listpointez maintenant vers le même endroit.

![n et liste tous deux pointant vers un nœud avec 1 comme nombre et null comme valeur de suivant](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide068.png)

*   Un nouveau nœud est alors créé. Les champs numberet nextsont tous deux remplis de valeurs parasites.

![liste pointant vers un nœud avec 1 comme nombre et null comme valeur de suivant et n pointant vers un nouveau nœud avec des valeurs parasites](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide073.png)

*   La number valeur du nnœud de (le nouveau nœud) est mise à jour en 2.

![liste pointant vers un nœud avec 1 comme nombre et null comme valeur de suivant et n pointant vers un nouveau nœud avec 2 comme nombre et poubelle comme suivant](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide075.png)

*   De plus, le nextchamp est également mis à jour.

![liste pointant vers un nœud avec 1 comme nombre et null comme valeur de suivant et n pointant vers un nouveau nœud avec 2 comme nombre et null comme suivant](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide077.png)

*   Plus important encore, nous ne voulons pas perdre notre connexion à l'un de ces nœuds de peur qu'ils ne soient perdus à jamais. Par conséquent, nle nextchamp de est pointé vers le même emplacement mémoire que list.

![l](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide084.png)

*   Enfin, listest mis à jour pour pointer vers n. Nous avons maintenant une liste liée de deux éléments.

*   ![liste comme suivant](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide086.png)

Pour implémenter cela dans le code, modifiez votre code comme suit :

```c
  // Prepends numbers to a linked list, using while loop to print

  #include <cs50.h>
  #include <stdio.h>
  #include <stdlib.h>

  typedef struct node
  {
      int number;
      struct node *next;
  }
  node;

  int main(int argc, char *argv[])
  {
      // Memory for numbers
      node *list = NULL;

      // For each command-line argument
      for (int i = 1; i < argc; i++)
      {
          // Convert argument to int
          int number = atoi(argv[i]);

          // Allocate node for number
          node *n = malloc(sizeof(node));
          if (n == NULL)
          {
              return 1;
          }
          n->number = number;
          n->next = NULL;

          // Prepend node to list
          n->next = list;
          list = n;
      }

      // Print numbers
      node *ptr = list;
      while (ptr != NULL)
      {
          printf("%i\n", ptr->number);
          ptr = ptr->next;
      }

      // Free memory
      ptr = list;
      while (ptr != NULL)
      {
          node *next = ptr->next;
          free(ptr);
          ptr = next;
      }
  }
```

*   Notez que ce que l'utilisateur saisit sur la ligne de commande est placé dans le numberchamp d'un nœud appelé n, puis ce nœud est ajouté au list. Par exemple, ./list 1 2placera le nombre 1dans le numberchamp d'un nœud appelé n, puis placera un pointeur vers listdans le nextchamp du nœud, puis mettra à jour listpour pointer vers n. Ce même processus est répété pour 2. Ensuite, node *ptr = listcrée une variable temporaire qui pointe au même endroit que celui listvers lequel pointe. Le whileimprime ce vers quoi le nœud ptrpointe, puis se met à jour ptrpour pointer vers le nextnœud dans la liste. Enfin, toute la mémoire est libérée.

*   Compte tenu du temps nécessaire pour rechercher cette liste, il est de l'ordre de, car dans le pire des cas, la liste entière doit toujours être parcourue pour trouver un élément. La complexité temporelle de l'ajout d'un nouvel élément à la liste dépendra de l'endroit où cet élément est ajouté. Ceci est illustré dans les exemples ci-dessous.

*   En tant que programmeur, vous avez le choix de la manière d'implémenter votre liste. Le code suivant, par exemple, implémente une liste chaînée qui ajoute des nombres au début de la liste :

```c
  // Prepends numbers to a linked list, using for loop to print

  #include <cs50.h>
  #include <stdio.h>
  #include <stdlib.h>

  typedef struct node
  {
      int number;
      struct node *next;
  }
  node;

  int main(int argc, char *argv[])
  {
      // Memory for numbers
      node *list = NULL;

      // For each command-line argument
      for (int i = 1; i < argc; i++)
      {
          // Convert argument to int
          int number = atoi(argv[i]);

          // Allocate node for number
          node *n = malloc(sizeof(node));
          if (n == NULL)
          {
              return 1;
          }
          n->number = number;
          n->next = NULL;

          // Prepend node to list
          n->next = list;
          list = n;
      }

      // Print numbers
      for (node *ptr = list; ptr != NULL; ptr = ptr->next)
      {
          printf("%i\n", ptr->number);
      }

      // Free memory
      node *ptr = list;
      while (ptr != NULL)
      {
          node *next = ptr->next;
          free(ptr);
          ptr = next;
      }
  }
```  
*   Remarquez comment les nombres sont placés au début de la liste. Cette insertion se déroulera dans l'ordre de, car le nombre d'étapes nécessaires pour le faire ne dépend pas de la taille de la liste.

*   De plus, vous pouvez placer des nombres à la fin de la liste comme illustré dans ce code :
```c
  // Implements a list of numbers using a linked list

  #include <cs50.h>
  #include <stdio.h>
  #include <stdlib.h>

  typedef struct node
  {
      int number;
      struct node *next;
  }
  node;

  int main(int argc, char *argv[])
  {
      // Memory for numbers
      node *list = NULL;

      // For each command-line argument
      for (int i = 1; i < argc; i++)
      {
          // Convert argument to int
          int number = atoi(argv[i]);

          // Allocate node for number
          node *n = malloc(sizeof(node));
          if (n == NULL)
          {
              return 1;
          }
          n->number = number;
          n->next = NULL;

          // If list is empty
          if (list == NULL)
          {
              // This node is the whole list
              list = n;
          }

          // If list has numbers already
          else
          {
              // Iterate over nodes in list
              for (node *ptr = list; ptr != NULL; ptr = ptr->next)
              {
                  // If at end of list
                  if (ptr->next == NULL)
                  {
                      // Append node
                      ptr->next = n;
                      break;
                  }
              }
          }
      }

      // Print numbers
      for (node *ptr = list; ptr != NULL; ptr = ptr->next)
      {
          printf("%i\n", ptr->number);
      }

      // Free memory
      node *ptr = list;
      while (ptr != NULL)
      {
          node *next = ptr->next;
          free(ptr);
          ptr = next;
      }
  }
```

*   Remarquez comment ce code parcourt cette liste pour trouver la fin. Lors de l'ajout d'un élément, (en ajoutant à la fin de la liste) notre code s'exécutera dans, car nous devons parcourir toute notre liste avant de pouvoir ajouter le dernier élément.

*   De plus, vous pouvez trier votre liste au fur et à mesure que des éléments sont ajoutés :

```c
  // Implements a sorted list of numbers using a linked list

  #include <cs50.h>
  #include <stdio.h>
  #include <stdlib.h>

  typedef struct node
  {
      int number;
      struct node *next;
  }
  node;

  int main(int argc, char *argv[])
  {
      // Memory for numbers
      node *list = NULL;

      // For each command-line argument
      for (int i = 1; i < argc; i++)
      {
          // Convert argument to int
          int number = atoi(argv[i]);

          // Allocate node for number
          node *n = malloc(sizeof(node));
          if (n == NULL)
          {
              return 1;
          }
          n->number = number;
          n->next = NULL;

          // If list is empty
          if (list == NULL)
          {
              list = n;
          }

          // If number belongs at beginning of list
          else if (n->number < list->number)
          {
              n->next = list;
              list = n;
          }

          // If number belongs later in list
          else
          {
              // Iterate over nodes in list
              for (node *ptr = list; ptr != NULL; ptr = ptr->next)
              {
                  // If at end of list
                  if (ptr->next == NULL)
                  {
                      // Append node
                      ptr->next = n;
                      break;
                  }

                  // If in middle of list
                  if (n->number < ptr->next->number)
                  {
                      n->next = ptr->next;
                      ptr->next = n;
                  }
              }
          }
      }

      // Print numbers
      for (node *ptr = list; ptr != NULL; ptr = ptr->next)
      {
          printf("%i\n", ptr->number);
      }

      // Free memory
      node *ptr = list;
      while (ptr != NULL)
      {
          node *next = ptr->next;
          free(ptr);
          ptr = next;
      }
  }

```

*   Remarquez comment cette liste est triée au fur et à mesure de sa construction. Pour insérer un élément dans cet ordre spécifique, notre code s'exécutera toujours danspour chaque insertion, car dans le pire des cas, nous devrons parcourir tous les éléments courants.

---

##  Des arbres

*   Les arbres de recherche binaires sont une autre structure de données qui peut être utilisée pour stocker des données plus efficacement afin qu'elles puissent être recherchées et récupérées.

*   Vous pouvez imaginer une séquence triée de nombres.

![1  côte](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide086.png)

*   Imaginez alors que la valeur centrale devienne la cime d'un arbre. Ceux qui sont inférieurs à cette valeur sont placés à gauche. Les valeurs supérieures à cette valeur sont à droite.

![ de celles-ci](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide119.png)

*   Des pointeurs peuvent ensuite être utilisés pour pointer vers l'emplacement correct de chaque zone de mémoire de sorte que chacun de ces nœuds puisse être connecté.

![1](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide120.png)

Dans le code, cela peut être implémenté comme suit.

```c

  // Implements a list of numbers as a binary search tree

  #include <stdio.h>
  #include <stdlib.h>

  // Represents a node
  typedef struct node
  {
      int number;
      struct node *left;
      struct node *right;
  }
  node;

  void free_tree(node *root);
  void print_tree(node *root);

  int main(void)
  {
      // Tree of size 0
      node *tree = NULL;

      // Add number to list
      node *n = malloc(sizeof(node));
      if (n == NULL)
      {
          return 1;
      }
      n->number = 2;
      n->left = NULL;
      n->right = NULL;
      tree = n;

      // Add number to list
      n = malloc(sizeof(node));
      if (n == NULL)
      {
          free_tree(tree);
          return 1;
      }
      n->number = 1;
      n->left = NULL;
      n->right = NULL;
      tree->left = n;

      // Add number to list
      n = malloc(sizeof(node));
      if (n == NULL)
      {
          free_tree(tree);
          return 1;
      }
      n->number = 3;
      n->left = NULL;
      n->right = NULL;
      tree->right = n;

      // Print tree
      print_tree(tree);

      // Free tree
      free_tree(tree);
      return 0;
  }

  void free_tree(node *root)
  {
      if (root == NULL)
      {
          return;
      }
      free_tree(root->left);
      free_tree(root->right);
      free(root);
  }

  void print_tree(node *root)
  {
      if (root == NULL)
      {
          return;
      }
      print_tree(root->left);
      printf("%i\n", root->number);
      print_tree(root->right);
  }
```

*   La recherche dans cet arbre pourrait être implémentée comme suit :

```c
  bool search(node *tree, int number)
  {
      if (tree == NULL)
      {
          return false;
      }
      else if (number < tree->number)
      {
          return search(tree->left, number);
      }
      else if (number > tree->number)
      {
          return search(tree->right, number);
      }
      else if (number == tree->number)
      {
          return true;
      }
  }
```
Notez que cette fonction de recherche commence par aller à l'emplacement de tree. Ensuite, il utilise la récursivité pour rechercher number.

*   Un arbre comme celui-ci offre un dynamisme qu'un tableau n'offre pas. Il peut grandir et rétrécir comme nous le souhaitons.

---

##  Dictionnaires

*   Les dictionnaires sont une autre structure de données.

*   Les dictionnaires, comme les vrais dictionnaires sous forme de livre qui ont un mot et une définition, ont une clé et une valeur .

*   Le Saint Graal de la complexité temporelle estou temps constant . C'est-à-dire que l'ultime est que l'accès soit instantané.

![un  meilleur](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide151.png)

*   Les dictionnaires peuvent offrir cette vitesse d'accès.

---

##  Hachage et tables de hachage

*   Le hachage est l'idée de prendre une valeur et de pouvoir produire une valeur qui devient un raccourci vers celle-ci plus tard.

*   Par exemple, le hachage de la pomme peut être haché comme une valeur de 1, et la baie peut être hachée comme 2. Par conséquent, trouver Apple est aussi simple que de demander à l' algorithme de hachage où Apple est stocké. Bien qu'il ne soit pas idéal en termes de conception, en fin de compte, en mettant tous les a dans un compartiment et les b dans un autre, ce concept de compartimentage des valeurs hachées illustre comment vous pouvez utiliser ce concept : une valeur hachée peut être utilisée pour trouver un raccourci comme un évaluer.

*   Une fonction de hachage est un algorithme qui réduit une valeur plus grande à quelque chose de petit et de prévisible. Généralement, cette fonction prend un élément que vous souhaitez ajouter à votre table de hachage et renvoie un entier représentant l'index du tableau dans lequel l'élément doit être placé.

*   Une table de hachage est une combinaison fantastique de tableaux et de listes chaînées. Lorsqu'elle est implémentée dans le code, une table de hachage est un tableau de pointeurs vers des nœuds .

*   Une table de hachage pourrait être imaginée comme suit :

![une colonne lphabet](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide157.png)
*Notez qu'il s'agit d'un tableau auquel chaque valeur de l'alphabet est affectée.

*   Ensuite, à chaque emplacement du tableau, une liste chaînée est utilisée pour suivre chaque valeur qui y est stockée :

![une colonne ](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide169.png)

*   Les collisions se produisent lorsque vous ajoutez des valeurs à la table de hachage et que quelque chose existe déjà à l'emplacement haché. Dans ce qui précède, les   collisions sont simplement ajoutées à la fin de la liste.

*   Les collisions peuvent être réduites en programmant mieux votre table de hachage et votre algorithme de hachage. Vous pouvez imaginer une amélioration par rapport à ce qui précède comme suit :

![une colonne verticale de diverses boîtes disposées par HAG et HAR avec hagrid sortant de HAG et harry sortant de HAR](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide184.png)

*   En tant que programmeur, vous devez prendre une décision sur les avantages d'utiliser plus de mémoire pour avoir une grande table de hachage et de réduire potentiellement le temps de recherche ou d'utiliser moins de mémoire et d'augmenter potentiellement le temps de recherche.

---

##  Essaie

*   Les essais sont une autre forme de structure de données.

*   Les essais sont toujours consultables en temps constant.

*   L'un des inconvénients des essais est qu'ils ont tendance à occuper une grande quantité de mémoire. Remarquez qu'il nous faut nodec'est juste pour ranger Hagrid !

*   Hagrid serait stocké comme suit :

![hagrid de suite](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide207.png)

Harry serait alors stocké comme suit :

![hagrid  H et A](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide209.png)

---

##  Résumé

*   Dans cette leçon, vous avez appris à utiliser des pointeurs pour créer de nouvelles structures de données. Plus précisément, nous nous sommes penchés sur…

*   Structures de données
*   Piles et files d'attente
*   Redimensionner les tableaux
*   Listes liées
*   Dictionnaires
*   Essaie

À la prochaine!

---

Semaine suivant : [Week6](https://github.com/BlockchainSpot/Formation-Blockchain/tree/main/0%20-%20Science%20Informatique%20CS50/Week6%20-%20Python)

[🙏 Buy Me A Coffee 🙏](https://www.buymeacoffee.com/karlblock)