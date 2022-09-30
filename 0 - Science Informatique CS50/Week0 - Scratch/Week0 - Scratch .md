
# Lecture 0 - Scratch 

- [Semaine O en anglais ](https://cs50.harvard.edu/x/2022/notes/0/)
- [Les notes 2022 en anglais ](https://cs50.harvard.edu/extension/2022/fall/notes/0/#welcome)
- [Vidéo Semaine 0](https://www.youtube.com/watch?v=IDDmrzzB14M&t=20s)


## Table des matières 


* [Bienvenue](#Bienvenue)
* [Ce qui nous attend](#Ce-qui-nous-attend)
* [La Communautée ](#La-communautée)
* [Pensée computationnelle](#Pensée-computationnelle)
* [Texte](#Texte)
* [Emojis](#Emojis)
* [Les images, vidéos et le son](#Les-images,-vidéos-et-le-son)
* [Les algorithmes](#les-algorithmes)
* [Le speudocode et les éléments de base de la programmation](#Le-speudocode-et-les-éléments-de-base-de-la-programmation)
* [Logiciel Scratch ](#logiciel-Scratch)
* [Les abstactions](#Les-abstactions)
* [Si (if)](#Si-(if))
* [Développez votre imagination](#Développez-votre-imagination)
* [L'esprit en mouvement](#L'esprit-en-mouvement)
* [Plus d'esprit](#plus-d'esprit)
* [Résumé de la premier semaine ](#Résumé-de-la-premier-semaine )

--- 

## Bienvenue
__Lien vers la vidéo  de l'[introduction](https://www.youtube.com/watch?v=IDDmrzzB14M&t=0s)__

* Ce cours ne se limite pas à la programmation informatique !

* En effet, ce cours porte sur la résolution de problèmes d'une manière extrêmement stimulante ! Vous prendrez probablement la résolution de problèmes que vous apprenez ici sera probablement applicable instantanément à votre travail au-delà de ce cours et même à votre carrière dans son ensemble !

* Cependant, ce ne sera pas facile ! Vous "boirez à la lance à incendie" de connaissances pendant ce cours. Vous serez étonné de ce que vous pourrez accomplir dans les semaines à venir.

* Ce cours consiste bien plus à vous faire progresser "vous" par rapport à "où vous êtes aujourd'hui" qu'à atteindre une norme imaginaire.

* La considération d'ouverture la plus importante dans ce cours : donnez le temps dont vous avez besoin pour apprendre tout au long de ce cours. Tout le monde apprend différemment. Si quelque chose ne fonctionne pas bien au début, sachez qu'avec le temps, vous évoluerez et développerez vos compétences.

---

## Ce qui nous attend

*   Vous découvrirez cette semaine Scratch, un langage de programmation visuel.

*   Ensuite, dans les semaines à venir, vous en apprendrez plus sur C. Cela ressemblera à ceci :

```c
  #include <stdio.h>

  int main(void)
  {
      printf("hello, world\n");
  }
  
```

*  De plus, au fil des semaines, vous en apprendrez davantage sur les algorithmes.
Vous apprendrez la mémoire.

*  Vous en apprendrez davantage sur le code bogué et sur les causes des pannes informatiques.

*  Vous découvrirez les structures de données telles qu'une table de hachage.

*  Ensuite, nous passerons à un nouveau langage de niveau supérieur appelé Python . Votre code ressemblera à ceci :

```c

print("hello, world")

```

*  Ce cours vous permettra de bien comprendre comment les langages de programmation récents se sont développés à partir des précédents.

*  Nous verrons également comment nous pouvons utiliser des bases de données et des frameworks tiers pour créer des applications Web.

---

## La communautée

*   Vous faites partie d'une communauté de ceux qui suivent ce cours au Harvard College, à la Harvard Extension School et via edX.org.

*   Puzzle Day et salon CS50

--- 

## Pensée computationnelle

*   Essentiellement, la programmation informatique consiste à prendre des entrées et à créer des sorties - résolvant ainsi un problème. Ce qui se passe entre l'entrée et la sortie, ce que nous pourrions appeler une boîte noire, est au centre de ce cours.

    ![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/0/cs50Week0Slide38.png)

*   Par exemple, nous devrons peut-être assister à un cours. Nous pourrions utiliser un système appelé [**unaire**](https://fr.wikipedia.org/wiki/Syst%C3%A8me_unaire) pour compter, un doigt à la fois. Les ordinateurs d'aujourd'hui comptent en utilisant un système appelé [**binaire**](https://fr.wikipedia.org/wiki/Syst%C3%A8me_binaire) . C'est à partir du terme chiffre binaire que nous obtenons un terme familier appelé [bit](https://fr.wikipedia.org/wiki/Bit) . Un bit est un **0** ou **1** .

*   Les ordinateurs ne parlent qu'en termes de **0** et de **1**. Les **0** représentent **OFF**. Les **1** représentent **ON**. Les ordinateurs sont des millions, voire des milliards, de [transistors](https://fr.wikipedia.org/wiki/Transistor) qui s'allument et s'éteignent.

*   Si vous imaginez utiliser une ampoule, une seule ampoule ne peut compter que de zéro à un.

*   Cependant, si vous deviez avoir trois ampoules, il y a plus d'options qui s'offrent à vous !

*   En utilisant trois ampoules, ce qui suit pourrait représenter zéro :

    ``` 
    0 0 0 

    ```

*   De même, ce qui suit en représenterait un :

    ``` 
    0 0 1 

    ```

*   Selon cette logique, nous pourrions proposer que ce qui suit est égal à deux :

    ``` 
    0 1 0 

    ```

*   En étendant cette logique plus loin, ce qui suit en représente trois :

    ```
    0 1 1
    ```

*   Quatre apparaîtrait comme:

    ```
    1 0 0
    ```

*   Nous pourrions, en fait, en utilisant seulement trois ampoules compter jusqu'à sept !

    ```
     1 1 1
    ```

*   Comme heuristique, nous pourrions imaginer que les valeurs suivantes représentent chaque place possible dans notre chiffre binaire :

    ```
    4 2 1
    ```

*   Les ordinateurs utilisent **'base-2'** pour compter. Cela peut être illustré comme suit :

    ```
    2^2  2^1  2^0
    4    2    1
    ```

*   Par conséquent, vous pourriez dire qu'il faudrait trois bits (la place des quatre, la place des deux et la place de l'un) pour représenter un nombre aussi élevé que sept.


*   Les ordinateurs utilisent généralement huit bits pour représenter un nombre. Par exemple, 00000101est le nombre 5 en binaire .

```
8 bit : 

  0  0  0  0 0 0 0 0
128 64 32 16 8 4 2 1 
```
---

## Texte 


*   Tout comme les nombres sont des combinaisons binaires de uns et de zéros, les lettres sont également représentées par des uns et des zéros !

*   Puisqu'il y a un chevauchement entre les uns et les zéros qui représentent les nombres et les lettres, la norme ASCII a été créée pour mapper des lettres spécifiques à des nombres spécifiques.

*   Par exemple, la lettre Aa été décidée pour correspondre au nombre 65.

*   Si vous avez reçu un message texte, le binaire sous ce message pourrait représenter les nombres 72, 73 et 33. En les mappant en ASCII, votre message ressemblerait à ceci :

```

  H   I   !
  72  73  33

```

---

## Emojis 

----

## Les images, vidéos et le son

---

## les algorithmes

---

## Le speudocode et les éléments de base de la programmation

---

## logiciel Scratch 

---

## Les abstactions

---

## Si (if)

---

## Développez votre imagination

---

## L'esprit en mouvement

---

## plus d'esprit

---

## Résumé de la premier semaine 

---
