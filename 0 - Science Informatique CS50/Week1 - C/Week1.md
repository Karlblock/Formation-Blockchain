
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
## variables
## Conditionnels
## Boucles
## Linux etles ligne de commande
## Mario
## Commantaire
## Les abstactions
## operateur de type
## Résumé