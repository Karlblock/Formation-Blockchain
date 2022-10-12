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