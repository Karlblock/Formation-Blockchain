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

##  Accueillir!

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

*   Notez qu'un tableau appelé people est de type person. C'est CAPACITYà quelle hauteur la pile pourrait être. L'entier sizeest le niveau de remplissage réel de la pile, quelle que soit sa capacité .

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

![https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide019.png](https://cs50.harvard.edu/extension/2022/fall/notes/5/cs50Week5Slide019.png)

En mémoire, d'autres valeurs sont stockées par d'autres programmes, fonctions et variables. Beaucoup d'entre eux peuvent être des valeurs parasites inutilisées qui ont été utilisées à un moment donné mais qui sont maintenant disponibles pour être utilisées.

trois boîtes avec 1 2 3 parmi plein d'autres éléments de mémoire

Imaginez que vous souhaitiez stocker une quatrième valeur 4dans notre tableau ? Ce qu'il faudrait, c'est allouer une nouvelle zone de mémoire et déplacer l'ancien tableau vers un nouveau.

Trois cases avec 1 2 3 au-dessus de quatre cases avec 1 2 et deux valeurs poubelles

Les anciennes valeurs parasites seraient écrasées par nos nouvelles données.

Trois cases avec 1 2 3 au-dessus de quatre cases avec 1 2 3 et une valeur poubelle

L'un des inconvénients de cette approche est qu'elle est mal conçue : chaque fois que nous ajoutons un nombre, nous devons copier le tableau élément par élément.

Ne serait-ce pas bien si nous pouvions mettre l' 4ailleurs en mémoire ? Par définition, ce ne serait plus un tableau car 4il ne serait plus en mémoire contiguë.

Dans votre terminal, tapez code list.cet écrivez le code comme suit :

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
Notez que ce qui précède ressemble beaucoup à ce que nous avons appris plus tôt dans ce cours. Nous avons de la mémoire préallouée pour trois éléments.

En nous appuyant sur nos connaissances acquises plus récemment, nous pouvons tirer parti de notre compréhension des pointeurs pour créer une meilleure conception dans ce code. Modifiez votre code comme suit :

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
Notez qu'une liste d'entiers de taille trois est créée. Ensuite, trois adresses mémoire peuvent être affectées aux valeurs 1, 2et 3. Ensuite, une liste de taille quatre est créée. Ensuite, la liste est copiée du premier au second. La valeur de 4est ajoutée à la tmpliste. Le bloc de mémoire sur lequel listpointe n'étant plus utilisé, il est libéré à l'aide de la commande free(list). Enfin, le compilateur est invité à pointer le listpointeur vers le bloc de mémoire tmpvers lequel il pointe. Le contenu de listest imprimé puis libéré.

Il est utile de penser à listet tmpcomme les deux signes qui pointent vers un morceau de mémoire. Comme dans l'exemple ci-dessus, listà un moment pointé vers un tableau de taille 3. À la fin, liston lui a dit de pointer vers un morceau de mémoire de taille 4. Techniquement, à la fin du code ci-dessus, tmples listdeux pointaient vers le même bloc de mémoire.

C est livré avec une fonction très utile appelée reallocqui réaffectera la mémoire pour vous. reallocprend deux arguments. Tout d'abord, il vous demande de spécifier le tableau que vous essayez de copier. Deuxièmement, il vous demande de spécifier la taille à laquelle vous souhaitez que le tableau final soit. Modifiez votre code comme suit :

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
Notez que int *tmp = realloc(list, 4 * sizeof(int))crée une liste d'entiers de taille quatre. Ensuite, il copie les valeurs de listdans ce nouveau tableau. Enfin, un pointeur nommé tmppointe sur l'emplacement mémoire de ce nouveau tableau. La copie est gérée par realloc. Une fois cette copie effectuée, la mémoire à l'emplacement de listest libérée. Ensuite, le pointeur appelé listest pointé à l'emplacement de tmp, où se trouve le nouveau tableau.

Vous pouvez imaginer à quel point l'utilisation reallocd'une file d'attente ou d'une pile pourrait être utile. À mesure que la quantité de données augmente, reallocpeut être utilisé pour augmenter ou réduire la pile ou la file d'attente.