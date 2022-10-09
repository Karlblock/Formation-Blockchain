
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
* [Le pseudocode et les éléments de base de la programmation(#Le-pseudocode-et-les-éléments-de-base-de-la-programmation)
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

*   Tout comme les nombres sont des combinaisons binaires de 1 et de 0, les lettres sont également représentées par des 1 et des 0 !

*   Puisqu'il y a un chevauchement entre les uns et les zéros qui représentent les nombres et les lettres, la norme [ASCII](https://fr.wikipedia.org/wiki/American_Standard_Code_for_Information_Interchange) a été créée pour mapper des lettres spécifiques à des nombres spécifiques.

*   Par exemple, la lettre Aa été décidée pour correspondre au nombre 65.

*   Si vous avez reçu un message texte, le binaire sous ce message pourrait représenter les nombres 72, 73 et 33. En les mappant en ASCII, votre message ressemblerait à ceci :

        ```

        H   I   !
        72  73  33

        ```

*   Dieu merci, des normes comme ASCII nous permettent de nous mettre d'accord sur ces valeurs !

*   Voici une carte étendue des valeurs ASCII :

    ![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/0/cs50Week0Slide93.png)

---

## Emojis 

*   Au fil du temps, il existe de plus en plus de moyens de communiquer par SMS.

*   Puisqu'il n'y avait pas assez de chiffres en binaire pour représenter tous les différents caractères pouvant être représentés par les humains, la norme Unicode a élargi le nombre de bits pouvant être transmis et compris par les ordinateurs.

*   Il y a des emojis que vous utilisez probablement tous les jours. Les éléments suivants peuvent vous sembler familiers :

    ![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/0/cs50Week0Slide103.png)

*   Les informaticiens ont été confrontés à un défi lorsqu'ils ont voulu attribuer différents tons de peau à chaque emoji pour permettre à la communication d'être davantage personnalisée. Dans ce cas, les créateurs et contributeurs d'emojis ont décidé que les éléments initiaux seraient la structure de l'emoji lui-même, suivi du teint de la peau.

*   De plus en plus de fonctionnalités sont ajoutées à la norme Unicode pour représenter d'autres caractères et emojis.

*   Si vous le souhaitez, vous pouvez en savoir plus sur [Unicode](https://fr.wikipedia.org/wiki/Unicode).

*   Si vous le souhaitez, vous pouvez en savoir plus sur les [emojis](https://fr.wikipedia.org/wiki/%C3%89moji).

    ### RVB

*   Rouge, vert et bleu (appelé RGB) est une combinaison de trois nombres.

    ![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/0/cs50Week0Slide118.png)

*   Prendre nos 72, 73 et 33 précédemment utilisés, qui se disaient HI!via du texte, serait interprété par les lecteurs d'images comme une légère nuance de jaune. La valeur rouge serait 72, la valeur verte serait 73 et la bleue serait 33.

    ![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/0/cs50Week0Slide120.png)

----

## Les images, vidéos et le son


*   Les images sont simplement des collections de valeurs RVB.

*   Les vidéos sont des séquences de nombreuses images qui sont stockées ensemble, tout comme un flipbook.

*   La musique peut être représentée par des données [MIDI](https://fr.wikipedia.org/wiki/Musical_Instrument_Digital_Interface).

---

## les algorithmes

*   La résolution de problèmes est au cœur de l'informatique et de la programmation informatique.

*   Imaginez le problème fondamental d'essayer de localiser un seul nom dans un annuaire téléphonique.

*   Comment pourriez-vous vous y prendre ?

*   Une approche pourrait être de simplement lire d'une page à l'autre jusqu'à atteindre la dernière page.

*   Une autre approche pourrait être de rechercher deux pages à la fois.

*   Une approche finale et peut-être meilleure pourrait être d'aller au milieu de l'annuaire téléphonique et de demander : « Est-ce que le nom que je recherche est à gauche ou à droite ? » Ensuite, répétez ce processus en coupant le problème en deux.

*   Chacune de ces approches pourrait être appelée algorithmes. La vitesse de chacun de ces algorithmes peut être représentée comme suit dans ce qu'on appelle la notation $big-O$

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/0/cs50Week0Slide141.png)

---

## Le pseudocode et les éléments de base de la programmation

*   La capacité de créer un pseudocode est essentielle à la réussite à la fois dans cette classe et dans la programmation informatique.

*   Le pseudocode est une version lisible par l'homme de votre code. Par exemple, en considérant le troisième algorithme ci-dessus, nous pourrions composer le pseudocode comme suit :

    ```
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
    ```

*   Le pseudocodage est une compétence si importante pour au moins deux raisons. Premièrement, lorsque vous pseudocodez avant de créer du code formel, cela vous permet de réfléchir à l'avance à la logique de votre problème. Deuxièmement, lorsque vous pseudocodez, vous pouvez ensuite fournir ces informations à d'autres personnes qui cherchent à comprendre vos décisions de codage et le fonctionnement de votre code.

*   Notez que le langage de notre pseudocode a des caractéristiques uniques. Premièrement, certaines de ces lignes commencent par des verbes comme ramasser, ouvrir, regarder. Plus tard, nous appellerons ces fonctions .

*   Deuxièmement, notez que certaines lignes incluent des instructions telles que ifou else if.Celles-ci sont appelées conditionnelles .

*   Troisièmement, remarquez qu'il existe des expressions qui peuvent être déclarées vraies ou fausses, telles que "la personne est plus tôt dans le livre". Nous appelons ces expressions booléennes .
Enfin, remarquez comment ces déclarations comme "revenir à la ligne 3". Nous appelons ces boucles .
Dans le contexte de Scratch , qui est discuté ci-dessous, nous utiliserons chacun des éléments de base de la programmation ci-dessus.

---

## logiciel Scratch 

*   Scratch est un langage de programmation visuel développé par le MIT.

*   Scratch utilise les mêmes blocs de construction de codage essentiels que nous avons abordés plus tôt dans cette conférence.

*   Scatch est un excellent moyen d'entrer dans la programmation informatique car il vous permet de jouer avec ces blocs de construction de manière visuelle, sans avoir à vous soucier de la syntaxe des accolades, des points-virgules, des parenthèses, etc.

*   Scatch IDE(environnement de développement intégré) ressemble à ceci :

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/0/cs50Week0Slide162.png)

Notez que sur la gauche, il y a des blocs de construction que vous pouvez utiliser dans votre programmation. Immédiatement à droite des blocs de construction, il y a la zone dans laquelle vous pouvez faire glisser des blocs pour créer un programme. À droite de cela, vous voyez la scène où se tient un chat. La scène est l'endroit où votre programmation prend vie.

*   Scratch fonctionne sur un système de coordonnées comme suit :

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/0/cs50Week0Slide167.png)

Notez que le centre de la scène est à la coordonnée (0,0). En ce moment, la position du chat est à cette même position.

*   Pour commencer, faites glisser le bloc de construction "lorsque le drapeau vert est cliqué" dans la zone de programmation. Ensuite, faites glisser le saybloc de construction vers la zone de programmation et attachez-le au bloc précédent.


*   Cela illustre assez bien ce dont nous parlions plus tôt concernant la programmation :

![alt-text](https://cs50.harvard.edu/extension/2022/fall/notes/0/cs50Week0Slide172.png)

*   Notez que l'entrée hello worldest transmise à la fonction sayet que l' effet secondaire de cette fonction en cours d'exécution est le chat qui dit hello world.

*   Nous pouvons rendre votre programme plus interactif en demandant au chat de dire hello à quelqu'un en particulier. Modifiez votre programme comme ci-dessous :

    ```
        when
        clicked
        ask
        What's your name?
        and
        wait
        say
        join
        hello,
        answer
    ```

Notez que lorsque le drapeau vert est cliqué, la fonction askest exécutée. Le programme vous invite, l'utilisateur, What's your name?Il stocke ensuite ce nom dans la variable appelée answer. Le programme passe ensuite answerà une fonction spéciale appelée join, qui combine deux chaînes de texte hello, et quel que soit le nom fourni. Ceux-ci sont passés collectivement à la sayfonction. Le chat dit, Hello,et un nom. Votre programme est maintenant interactif.

*   De manière assez similaire, nous pouvons modifier notre programme comme suit :

    ```
        when
        clicked
        ask
        What's your name?
        and
        wait
        speak
        join
        hello,
        answer
    ```

Notez que ce programme, lorsque le drapeau vert est cliqué, passe la même variable, jointe à hello, à une fonction appelée speak.

---

## Les abstactions

*   Avec le pseudocodage, l'abstraction est une compétence et un concept essentiels dans la programmation informatique.

*   L'abstraction est l'acte de simplifier un problème en problèmes de plus en plus petits.

*   Par exemple, si vous organisiez un grand dîner pour vos amis, le problème de devoir cuisiner tout le repas pourrait être assez écrasant ! Cependant, si vous décomposez la tâche de cuisiner le repas en tâches (ou problèmes) de plus en plus petites, la grande tâche de créer ce délicieux repas peut sembler moins difficile.

[Abstraction](https://cs50.harvard.edu/extension/2022/fall/notes/0/#abstraction)

---

## Si (if)

_Voir directement sur le site pour les image de Scratch_

[si](https://cs50.harvard.edu/extension/2022/fall/notes/0/#if)

---

## Développez votre imagination

_Voir directement sur le site pour les image de Scratch_

[Développez votre imagination](https://cs50.harvard.edu/extension/2022/fall/notes/0/#expanding-your-imagination)

---

## L'esprit en mouvement

_Voir directement sur le site pour les image de Scratch_

[ouvez votre espris](https://cs50.harvard.edu/extension/2022/fall/notes/0/#sprite-movement)

---

## plus d'esprit

_Voir directement sur le site pour les image de Scratch_

[plus d'esprit](https://cs50.harvard.edu/extension/2022/fall/notes/0/#more-sprites)

---

## Résumé de la premier semaine 


Dans cette leçon, vous avez appris comment ce cours se situe dans le vaste monde de l'informatique et de la programmation. Tu as appris…

*   Peu d'étudiants viennent à cette classe avec une expérience de codage préalable !

*   Tu n'es pas seul! Vous faites partie d'une communauté.

*   La résolution de problèmes est l'essence même du travail des informaticiens.

*   Ce cours ne concerne pas simplement la programmation - ce cours vous présentera une nouvelle façon d'apprendre que vous pouvez appliquer à presque tous les domaines de la vie.

*   Comment les nombres, le texte, les images, la musique et la vidéo sont compris par les ordinateurs.

*   La compétence de programmation fondamentale du pseudocodage.

*   Comment l'abstraction jouera un rôle dans votre travail futur dans ce cours.

*   Les blocs de construction de base de la programmation, y compris les fonctions, les conditions, les boucles et les variables.

*   Comment construire un projet dans Scratch.

À la prochaine!

---
