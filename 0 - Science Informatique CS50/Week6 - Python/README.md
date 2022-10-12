# Lecture 6 - Python 

- [Semaine 6 en anglais ](https://cs50.harvard.edu/x/2022/notes/6/)
- [Les notes 2022 en anglais ](https://cs50.harvard.edu/extension/2022/fall/notes/6/#welcome)
- [Vidéo Semaine 6](https://www.youtube.com/watch?v=5Jppcxc1Qzc)

## Table des matières 

*    [Accueillir!](#)
*    [Python](#)
*    [Bonjour](#)
*    [Les types](#)
*    [Orthographe](#)
*    [Reconnaissance d'images](#)
*    [Bibliothèque CS50](#)
*    [Conditionnels](#)
*    [variables](#)
*    [Boucles](#)
*    [Calculatrice](#)
*    [Comparer](#)
*    [Programmation orientée objet](#)
*    [Miaou](#)
*    [Mario](#)
*    [Partitions](#)
*    [Majuscule](#)
*    [Saluer](#)
*    [Statut de sortie](#)
*    [Chercher](#)
*    [Annuaire](#)
*    [Comparaison](#)
*    [Échanger](#)
*    [CSV](#)
*    [Expressions régulières](#)
*    [Parole](#)
*    [Résumé](#)


---

## Accueillir!

*   Au cours des semaines précédentes, vous avez été initié aux éléments de base de la programmation.

*   Vous avez appris la programmation dans un langage de programmation de niveau inférieur appelé C.

*   Aujourd'hui, nous allons travailler avec un langage de programmation de niveau supérieur appelé Python .

*   Au fur et à mesure que vous apprendrez ce nouveau langage, vous constaterez que vous serez plus apte à vous apprendre de nouveaux langages de programmation.

--- 

## Python

*   Les humains, au fil des décennies, ont vu comment les décisions de conception précédentes pouvaient être améliorées.

*   Python est un langage de programmation qui s'appuie sur ce que vous

---

##  Bonjour

*   Jusqu'à présent, le code ressemblait à ceci :

```python
  // A program that says hello to the world

  #include <stdio.h>

  int main(void)
  {
      printf("hello, world\n");
  }
```

Aujourd'hui, vous constaterez que le processus d'écriture et de compilation du code a été simplifié.
Par exemple, le code ci-dessus sera rendu en Python comme :

  # A program that says hello to the world

  print("hello, world")
Remarquez que le point-virgule a disparu.

*   En C, vous vous souvenez peut-être de ce code :

``` c
  // get_string and printf with %s

  #include <cs50.h>
  #include <stdio.h>

  int main(void)
  {
      string answer = get_string("What's your name? ");
      printf("hello, %s\n", answer);
  }

```

Ce code est transformé en Python en :

```python
  # get_string and print, with concatenation

  from cs50 import get_string

  answer = get_string("What's your name? ")
  print("hello, " + answer)
```

*   Vous pouvez écrire ce code en l'exécutant code hello.pydans la fenêtre du terminal. Ensuite, vous pouvez exécuter ce code en exécutant python hello.py. Remarquez comment le +signe concatène helloet answer.

*   De même, vous pouvez implémenter le code ci-dessus comme :
```py
  # get_string and print, with format strings

  from cs50 import get_string

  answer = get_string("What's your name? ")
  print(f"hello, {answer}")
```

Remarquez comment les accolades permettent à la printfonction d'interpoler le answertel qui answerapparaît à l'intérieur.

##  Les types

*   Les types de données en python n'ont pas besoin d'être explicitement déclarés. Par exemple, vous avez vu comment answerci-dessus est une chaîne, mais nous n'avons pas eu à dire à l'interpréteur que c'était le cas : il savait tout seul.

*   En Python, les types couramment utilisés incluent :

```
  bool
  float
  int
  str
```

*   Notez que longet doublemanquent. Python gérera le type de données à utiliser pour les nombres plus grands et plus petits.

*   Certains autres types de données en Python incluent :
```
  range
  list
  tuple
  dict
  set
```

*   Chacun de ces types de données peut être implémenté en C, mais Python peut l'implémenter plus simplement.

---

##  Orthographe

*   Pour illustrer cette simplicité, tapons 'code dictionary.py' dans la fenêtre du terminal et écrivons le code comme suit :

```py
  # Words in dictionary
  words = set()


  def check(word):
      """Return true if word is in dictionary else false"""
      if word.lower() in words:
          return True
      else:
          return False


  def load(dictionary):
      """Load dictionary into memory, returning true if successful else false"""
      file = open(dictionary, "r")
      for line in file:
          word = line.rstrip()
          words.add(word)
      file.close()
      return True


  def size():
      """Returns number of words in dictionary if loaded else 0 if not yet loaded"""
      return len(words)


  def unload():
      """Unloads dictionary from memory, returning true if successful else false"""
      return True
```

   Notez qu'il y a quatre fonctions ci-dessus. Dans la checkfonction, si a wordest dans words, elle renvoie vrai. Tellement plus simple qu'une implémentation en C ! De même, dans la loadfonction, le fichier dictionnaire est ouvert. Pour chaque ligne de ce fichier, nous ajoutons cette ligne à words. En utilisant rstrip, la nouvelle ligne de fin est supprimée du mot ajouté. sizerenvoie simplement la lenou la longueur de words. unloadn'a besoin de revenir trueque parce que Python gère lui-même la gestion de la mémoire.

*   Le code ci-dessus illustre pourquoi les langages de niveau supérieur existent : pour simplifier et vous permettre d'écrire du code plus facilement.

*   Cependant, la vitesse est un compromis. Étant donné que C vous permet, en tant que programmeur, de prendre des décisions concernant la gestion de la mémoire, il peut souvent fonctionner plus rapidement que Python, en fonction de votre code. Alors que C n'exécute que vos lignes de code, Python exécute tout le code qui se trouve sous le capot avec lui lorsque vous appelez les fonctions intégrées de Python.

*   Vous pouvez en savoir plus sur les fonctions dans la documentation Python

##  Reconnaissance d'images

*   De nombreuses bibliothèques ont été écrites par les contributeurs de Python.

*   Vous pouvez utiliser ces bibliothèques dans vos propres créations de code.

*   Par exemple, vous pouvez simplement importer la reconnaissance faciale en utilisant une bibliothèque Python telle que PIL.

*   David a fourni une démonstration de reconnaissance faciale utilisant Python et des bibliothèques tierces.

##  Bibliothèque CS50

*   Comme avec C, la bibliothèque CS50 peut être utilisée dans Python.
Les fonctions suivantes seront particulièrement utiles :

```
  get_float
  get_int
  get_string
```

*   Vous avez également la possibilité d'importer uniquement des fonctions spécifiques de la bibliothèque CS50 comme suit :

 ```
  from CS50 import get_float, get_int, get_string
```

##  Conditionnels

*   En C, vous vous souvenez peut-être d'un programme comme celui-ci :

```c
  // Conditionals, Boolean expressions, relational operators

  #include <cs50.h>
  #include <stdio.h>

  int main(void)
  {
      // Prompt user for integers
      int x = get_int("What's x? ");
      int y = get_int("What's y? ");

      // Compare integers
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

En Python, cela se présenterait comme suit :

```py
  # Conditionals, Boolean expressions, relational operators

  from cs50 import get_int

  # Prompt user for integers
  x = get_int("What's x? ")
  y = get_int("What's y? ")

  # Compare integers
  if x < y:
      print("x is less than y")
  elif x > y:
      print("x is greater than y")
  else:
      print("x is equal to y")
```

Remarquez qu'il n'y a plus d'accolades. Au lieu de cela, des indentations sont utilisées. Deuxièmement, deux-points sont utilisés dans la ifdéclaration. De plus, elifremplace else if. Les parenthèses ne sont également plus nécessaires dans la ifdéclaration.

---

##  variables

*   La déclaration des variables est également simplifiée. En C, vous pourriez avoir int counter = 1;. En Python, cette même ligne se lirait counter = 1. Vous n'avez pas besoin de déclarer le type de la variable.
Python préfère counter += 1incrémenter de un, perdant la possibilité trouvée en C de taper counter++.

##  Boucles

*   Les boucles en Python sont très similaires au C. Vous vous souviendrez peut-être du code suivant en C :

```c
  // Demonstrates while loop

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
*   En Python, ce code apparaît comme :

```py

  # Demonstrates while loop

  i = 0
  while i < 3:
      print("meow")
      i += 1
```
*   for les boucles peuvent être implémentées en Python comme suit :
```py

  # Better design


  for i in range(3):
      print("meow")
```
De même, on pourrait exprimer le code ci-dessus comme suit :

```py

  # Abstraction with parameterization

  def main():
      meow(3)



  # Meow some number of times
  def meow(n):
      for i in range(n):
          print("meow")


  main()
```

Notez qu'une fonction est utilisée pour résumer le miaulement.

##  Calculatrice

*   Nous pouvons implémenter une calculatrice simple comme nous l'avons fait en C. Tapez code calculator.pydans la fenêtre du terminal et écrivez le code comme suit :

```py
  # Addition with int [using get_int]

  from cs50 import get_int

  # Prompt user for x
  x = get_int("x: ")

  # Prompt user for y
  y = get_int("y: ")

  # Perform addition
  print(x + y)
```

Remarquez comment la bibliothèque CS50 est importée. Ensuite, xet y sont recueillies auprès de l'utilisateur. Enfin, le résultat est imprimé. Notez que la mainfonction qui aurait été vue dans un programme C a complètement disparu ! Bien que l'on puisse utiliser une mainfonction, ce n'est pas obligatoire.

*   Il est possible d'enlever les roues stabilisatrices de la librairie CS50. Modifiez votre code comme suit :

```py   

  # Addition with int [using input]

  # Prompt user for x
  x = input("x: ")

  # Prompt user for y
  y = input("y: ")

  # Perform addition
  print(x + y)
```

Remarquez comment l'exécution du code ci-dessus entraîne un comportement étrange du programme. Pourquoi pourrait-il en être ainsi?

*   Vous avez peut-être deviné que l'interprète a compris xet yêtre des chaînes. Vous pouvez corriger votre code en utilisant la intfonction comme suit :

```py
  # Addition with int [using input]

  # Prompt user for x
  x = int(input("x: "))

  # Prompt user for y
  y = int(input("y: "))

  # Perform addition
  print(x + y)
```

Remarquez comment l'entrée pour xet yest transmise à la intfonction qui la convertit en entier.

*   Nous pouvons étendre les capacités de notre calculatrice. Modifiez votre code comme suit :
```py
  # Division with integers, demonstration lack of truncation

  # Prompt user for x
  x = int(input("x: "))

  # Prompt user for y
  y = int(input("y: "))

  # Divide x by y
  z = x / y
  print(z)
```

Notez que l'exécution de ce code donne une valeur, mais que si vous voyiez plus de chiffres après .333333, vous verriez que nous sommes confrontés à une imprécision en virgule flottante .

*   Nous pouvons révéler cette imprécision en modifiant légèrement nos codes :
```py

  # Floating-point imprecision

  # Prompt user for x
  x = int(input("x: "))

  # Prompt user for y
  y = int(input("y: "))

  # Divide x by y
  z = x / y
  print(f"{z:.50f}")

```

Notez que ce code révèle l'imprécision. Python est toujours confronté à ce problème, tout comme C.


##  Comparer

*   En C, nous avons rencontré des difficultés lorsque nous avons voulu comparer deux valeurs. Considérez le code suivant :

```py
  // Conditionals, Boolean expressions, relational operators

  #include <cs50.h>
  #include <stdio.h>

  int main(void)
  {
      // Prompt user for integers
      int x = get_int("What's x? ");
      int y = get_int("What's y? ");

      // Compare integers
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

En Python, nous pouvons exécuter ce qui précède comme suit :

```py
  # Conditionals, Boolean expressions, relational operators

  from cs50 import get_int

  # Prompt user for integers
  x = get_int("What's x? ")
  y = get_int("What's y? ")

  # Compare integers
  if x < y:
      print("x is less than y")
  elif x > y:
      print("x is greater than y")
  else:
      print("x is equal to y")

```

Notez que la bibliothèque CS50 est importée. De plus, des changements mineurs existent dans la ifdéclaration.

*   En regardant plus loin les comparaisons, considérons le code suivant en C :
```py

  // Logical operators

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
Ce qui précède peut être mis en œuvre comme suit :

```py

  # Logical operators

  from cs50 import get_string

  # Prompt user to agree
  s = get_string("Do you agree? ")

  # Check whether agreed
  if s == "Y" or s == "y":
      print("Agreed.")
  elif s == "N" or s == "n":
      print("Not agreed.")
```

Notez que les deux barres verticales utilisées dans C sont remplacées par or. En effet, les gens apprécient souvent Python car il est plus lisible par les humains. Notez également que cela charn'existe pas en Python. Au lieu de cela, strs sont utilisés.

*   Une autre approche de ce même code pourrait être la suivante :
```py

  # Logical operators, using lists

  from cs50 import get_string

  # Prompt user to agree
  s = get_string("Do you agree? ")

  # Check whether agreed
  if s in ["y", "yes"]:
      print("Agreed.")
  elif s in ["n", "no"]:
      print("Not agreed.")
```
Remarquez comment nous pouvons exprimer plusieurs mots-clés comme yet yes.

##  Programmation orientée objet

*   Jusqu'à présent, nos programmes dans ce cours étaient linéaires : séquentiels.
Il est possible que certains types de valeurs aient non seulement des propriétés ou des attributs à l'intérieur, mais aussi des fonctions.

*   Alors qu'en C, nous pourrions créer un structoù vous pourriez associer plusieurs variables à l'intérieur d'un seul type de données auto-créé, Python peut le faire et vous permettre d'avoir des fonctions intégrées pour vos types de données.

*   Par exemple, strsen Python, il y a des méthodes intégrées . Par conséquent, vous pouvez modifier votre code comme suit :

```py
  # Logical operators, using lists

  from cs50 import get_string

  # Prompt user to agree
  s = get_string("Do you agree? ")

  # Check whether agreed
  if s.lower() in ["y", "yes"]:
      print("Agreed.")
  elif s.lower() in ["n", "no"]:
      print("Not agreed.")
```

Remarquez comment nous sommes capables d'exprimer plusieurs mots-clés comme yet yeset de convertir toute entrée utilisateur en minuscules.

*   Cela pourrait être encore simplifié comme suit :

```py

  # Logical operators, using lists

  from cs50 import get_string

  # Prompt user to agree
  s = get_string("Do you agree? ")

  s = s.lower()

  # Check whether agreed
  if s in ["y", "yes"]:
      print("Agreed.")
  elif s in ["n", "no"]:
      print("Not agreed.")
```

Remarquez comment l'ancienne valeur de sest écrasée par le résultat de s.lower().


Dans cette classe, nous ne ferons qu'effleurer la surface de Python. Par conséquent, la documentation Python revêtira une importance particulière au fur et à mesure que vous avancerez.

Vous pouvez en savoir plus sur les méthodes de chaîne dans la documentation Python

---

##  Miaou

*   Revenant à meow.cdes semaines plus tôt, rappelez-vous le code suivant :

```py

  // Demonstrates while loop

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

Ce qui précède peut être implémenté dans Python comme :

```py

  # Demonstrates while loop

  i = 0
  while i < 3:
      print("meow")
      i += 1
De même, en utilisant une forboucle, nous pouvons écrire du code comme suit :

  # Better design

  for i in range(3):
      print("meow")
Comme nous l'avons laissé entendre plus tôt dans la journée, vous pouvez encore améliorer ce code en utilisant des fonctions. Modifiez votre code comme suit :

  # Abstraction

  def main():
      for i in range(3):
          meow()

  # Meow once
  def meow():
      print("meow")


  main()

```

Notez que la meowfonction résume l' printinstruction. De plus, notez que la mainfonction apparaît en haut du fichier. En bas du fichier, la mainfonction est appelée. Par convention, on s'attend à ce que vous créiez une mainfonction en Python.

*   En effet, nous pouvons passer des variables entre nos fonctions comme suit :

```py

  # Abstraction with parameterization

  def main():
      meow(3)


  # Meow some number of times
  def meow(n):
      for i in range(n):
          print("meow")


  main()
```

*   Remarquez comment meowprend maintenant une variable n. Dans la mainfonction, vous pouvez appeler meowet transmettre une valeur similaire 3à celle-ci. Ensuite, meowutilise la valeur de ndans la forboucle.

*   En lisant le code ci-dessus, remarquez comment vous, en tant que programmeur C, êtes capable de donner un sens assez facilement au code ci-dessus. Bien que certaines conventions soient différentes, les blocs de construction que vous avez appris précédemment sont très apparents dans ce nouveau langage de programmation.

##  Mario

Rappelez-vous il y a quelques semaines notre défi de construire trois blocs les uns sur les autres, comme dans Mario.

![trois blocs verticaux](https://cs50.harvard.edu/extension/2022/fall/notes/6/cs50Week6Slide073.png)

*   En Python, nous pouvons implémenter quelque chose qui ressemble à ceci comme suit :

```py
  # Prints a column of 3 bricks with a loop

  for i in range(3):
      print("#")
```

*   En C, nous avions l'avantage d'une do-whileboucle. Cependant, en Python, il est de convention d'utiliser une whileboucle. Python n'a pas de do whileboucle. Vous pouvez écrire du code comme suit dans un fichier appelé mario.py:

```py
  # Prints a column of bricks, using a helper function to get input

  from cs50 import get_int


  def main():
      height = get_height()
      for i in range(height):
          print("#")


  def get_height():
      while True:
          n = get_int("Height: ")
          if n > 0:
              return n


  main()
```

Remarquez comment la portée de nest partout dans la get_heightfonction une fois qu'une valeur lui a été attribuée. Notez en outre que, par convention, il existe des doubles espaces entre les fonctions.

*   On peut repartir les roues stabilisatrices de la librairie CS50 comme suit :

```py
  # Prints a column of bricks, catching exceptions


  def main():
      height = get_height()
      for i in range(height):
          print("#")


  def get_height():
      while True:
          try:
              n = int(input("Height: "))
              if n > 0:
                  return n
          except ValueError:
              print("Not an integer")


  main()
```

Notez qu'il tryest utilisé pour tenter de convertir nen entier. S'il ne peut pas le faire, une erreur est émise.

Considérez l'image suivante :

quatre blocs de questions horizontaux

En Python, nous pourrions implémenter en modifiant votre code comme suit :

```py
  # Prints a row of 4 question marks with a loop

  for i in range(4):
      print("?", end="")
  print()
```

Notez que vous pouvez remplacer le comportement de la printfonction pour rester sur la même ligne que l'impression précédente.

*   Dans l'esprit des itérations précédentes, nous pouvons encore simplifier ce programme :

```py
  # Prints a row of 4 question marks without a loop

  print("?" * 4)

```

Notez que nous pouvons utiliser *pour multiplier l'instruction d'impression pour répéter les 4temps.

*   Qu'en est-il d'un gros bloc de briques ?

![bloc trois par trois de blocs mario](https://cs50.harvard.edu/extension/2022/fall/notes/6/cs50Week6Slide078.png)

Pour implémenter ce qui précède, vous pouvez modifier votre code comme suit :
```py
  # Prints a 3-by-3 grid of bricks with loops

  for i in range(3):
      for j in range(3):
          print("#", end="")
      print()
```

Remarquez comment une forboucle existe à l'intérieur d'une autre. L' printinstruction ajoute une nouvelle ligne à la fin de chaque rangée de briques.

Vous pouvez en savoir plus sur la printfonction dans la documentation Python

---

##  Partitions

*   lists sont une structure de données dans Python.

*   lists ont des méthodes ou des fonctions intégrées en leur sein.

*   Par exemple, considérez le code suivant :

```py
  # Averages three numbers using a list and a loop

  from cs50 import get_int

  # Get scores
  scores = []
  for i in range(3):
      score = get_int("Score: ")
      scores.append(score)

  # Print average
  average = sum(scores) / len(scores)
  print(f"Average: {average}")
```

Notez que vous pouvez utiliser la appendméthode intégrée, grâce à laquelle vous pouvez appendattribuer le score à la liste.

*   Vous pouvez même utiliser la syntaxe suivante :

```py
  # Averages three numbers using a list and a loop with + operator

  from cs50 import get_int

  # Get scores
  scores = []
  for i in range(3):
      score = get_int("Score: ")
      scores += [score]

  # Print average
  average = sum(scores) / len(scores)
  print(f"Average: {average}")
```

Avis qui +=est utilisé pour ajouter le score à la liste.

*   Vous pouvez en savoir plus sur les listes dans la documentation Python

*   Vous pouvez également en savoir plus lendans la documentation Python

---

##  Majuscule

*   De même, considérez le code suivant :

```py
  # Uppercases string one character at a time

  before = input("Before: ")
  print("After:  ", end="")
  for c in before:
      print(c.upper(), end="")
  print()
```

Notez que chaque caractère est en majuscule un à la fois.

*   Python a une méthode intégrée pour strs. Vous pourriez modifier votre code comme suit :

```py
  # Uppercases string all at once

  before = input("Before: ")
  after = before.upper()
  print(f"After:  {after}")
```

Notez que la upperméthode est utilisée pour mettre en majuscule toute la chaîne en une seule fois.

##  Saluer

*   Comme avec C, vous pouvez également utiliser des arguments de ligne de commande. Considérez le code suivant :

```py
  # Prints a command-line argument

  from sys import argv

  if len(argv) == 2:
      print(f"hello, {argv[1]}")
  else:
      print("hello, world")
```

*   Avis qui argv[1]est imprimé à l'aide d'une chaîne formatée , notée par le fprésent dans l' printinstruction.

*   Vous pouvez imprimer tous les arguments argvcomme suit :

```py
  # Printing command-line arguments, indexing into argv

  from sys import argv

  for i in range(len(argv)):
      print(argv[i])
```

Notez que ce qui précède présentera le mot pythons'il est exécuté, tout comme pythonl'un des arguments que vous avez passés.

*   Vous pouvez découper des morceaux de listes. Considérez le code suivant :
```py
  # Printing command-line arguments using a slice

  from sys import argv

  for arg in argv[1:]:
      print(arg)
```
Notez que l'exécution de ce code entraînera le découpage du mot python.

*   Vous pouvez en savoir plus sur la sysbibliothèque dans la documentation Python

--- 

##   Statut de sortie

*   Dans la sysbibliothèque, il a aussi des méthodes intégrées :
```py
  # Exits with explicit value, importing sys

  import sys

  if len(sys.argv) != 2:
      print("Missing command-line argument")
      sys.exit(1)

  print(f"hello, {sys.argv[1]}")
  sys.exit(0)
```

Notez que la notation par points est utilisée pour utiliser les fonctions intégrées de sys.

---

##  Chercher

Python peut également être utilisé pour effectuer des recherches. Dans la fenêtre de votre terminal, saisissez code names.pyet écrivez le code comme suit :

```py
  # Implements linear search for names

  import sys

  # A list of names
  names = ["Bill", "Charlie", "Fred", "George", "Ginny", "Percy", "Ron"]

  # Ask for name
  name = input("Name: ")

  # Search for name
  if name in names:
      print("Found")
      sys.exit(0)

  print("Not found")
  sys.exit(1)
```

Notez que ce code fonctionne. En effet, c'est une recherche linéaire.

```py
##  Vous pouvez utiliser les capacités intégrées de Python comme suit :


  # Implements linear search for names using `in`

  import sys

  # A list of names
  names = ["Bill", "Charlie", "Fred", "George", "Ginny", "Percy", "Ron"]

  # Ask for name
  name = input("Name: ")

  # Search for name
  if name in names:
      print("Found")
      sys.exit(0)

  print("Not found")
  sys.exit(1)
```
Remarquez que la inpréposition est utilisée. Python comprend alors comment implémenter le code de niveau inférieur pour effectuer une recherche linéaire.

---

##  Annuaire

Rappelez-vous qu'un dictionnaire ou dictest une collection de paires de clés et de valeurs .

*   Vous pouvez implémenter un dictionnaire en Python comme suit :

```py
  # Implements a phone book

  from cs50 import get_string

  people = {
      "Carter": "+1-617-495-1000",
      "David": "+1-949-468-2750"
  }

  # Search for name
  name = get_string("Name: ")
  if name in people:
      print(f"Number: {people[name]}")
```

Notez que le dictionnaire est implémenté à l'aide d'accolades. Ensuite, l'instruction if name in peoplerecherche si le namese trouve dans le peopledictionnaire. De plus, notez comment, dans l' printinstruction, nous pouvons indexer dans le dictionnaire des personnes en utilisant la valeur de name. Très utile!

*   Python a fait de son mieux pour obtenir un temps constant en utilisant ses recherches intégrées.

---

##  Comparaison

Nous pouvons implémenter des comparaisons comme suit en Python :

```py
  # Compares two strings

  # Get two strings
  s = input("s: ")
  t = input("t: ")

  # Compare strings
  if s == t:
      print("Same")
  else:
      print("Different")
```

Remarquez comment Python utilise le ==pour pouvoir comparer deux variables. De plus, notez que Python vous permet de comparer deux chaînes sans examiner les chaînes caractère par caractère en utilisant des pointeurs comme en C.

---

##  Échanger

*   De plus, nous pouvons implémenter un programme qui échange les valeurs comme nous l'avons fait en C. Considérez le code suivant en Python :
```py 
  # Swaps two integers

  x = 1
  y = 2

  print(f"x is {x}, y is {y}")
  x, y = y, x
  print(f"x is {x}, y is {y}")
```


Notez que chaque valeur est échangée, en utilisant une syntaxe très Pythoniquex, y 
= y, x .

---

 ## CSV

*   Vous pouvez également utiliser Python pour interagir avec les fichiers CSV. Considérons le programme suivant appelé phonebook.py:

```py
  # Saves names and numbers to a CSV file

  import csv

  # Get name and number
  name = input("Name: ")
  number = input("Number: ")

  # Open CSV file
  with open("phonebook.csv", "a") as file:

      # Print to file
      writer = csv.writer(file)
      writer.writerow([name, number])
```

Notez que l'utilisation du withbloc de code, avec le writeret son travail en dessous en retrait, nous empêche d'avoir besoin de closenotre fichier une fois terminé.

*   Généralement, les fichiers CSV ont des colonnes qui portent des noms spécifiques. A DictWriterpeut être utilisé pour créer le fichier CSV et attribuer des noms spécifiques à chaque colonne. Considérez la modification suivante de notre code :
```py

  # Saves names and numbers to a CSV file using a DictWriter

  import csv

  # Get name and number
  name = input("Name: ")
  number = input("Number: ")

  # Open CSV file
  with open("phonebook.csv", "a") as file:

      # Print to file
      writer = csv.DictWriter(file, fieldnames=["name", "number"])
      writer.writerow({"name": name, "number": number})

```

Notez que la namecolonne et la numbercolonne sont définies dans la dernière ligne de code.

*   Vous pouvez en savoir plus sur les fichiers CSV en Python dans la documentation Python

---

##  Expressions régulières

*   Python peut être utilisé pour analyser des modèles de données à l'aide d'expressions régulières .

*   Certaines expressions régulières intégrées à Python sont les suivantes :
```
  .   any character
  .*  0 or more characters
  .+  1 or more characters
  ?   optional
  ^   start of input
  $   end of input
```

*   Notre programme précédent agree.pypeut utiliser des expressions régulières :

```py
  # Logical operators, using regular expressions

  import re

  from cs50 import get_string

  # Prompt user to agree
  s = get_string("Do you agree? ")

  # Check whether agreed
  if re.search("^y(es)?$", s, re.IGNORECASE):
      print("Agreed.")
  elif re.search("^no?$", s, re.IGNORECASE):
      print("Not agreed.")

```

Notez que le ^moyen de regarder le début de l'entrée pour un fichier y. Ensuite, il désigne le escomme facultatif à l'aide des parenthèses et du ?symbole . Enfin, il désigne la fin de l'entrée avec le $symbole . Un modèle similaire est utilisé pour no.

---

##  Parole

En utilisant une bibliothèque tierce, Python peut faire de la synthèse vocale.

```py
  # Says hello to someone

  import pyttsx3

  engine = pyttsx3.init()
  name = input("What's your name? ")
  engine.say(f"hello, {name}")
  engine.runAndWait()
De plus, vous pouvez exécuter le code suivant :

  # Says "This was CS50"

  import pyttsx3

  engine = pyttsx3.init()
  engine.say("This was CS50")
  engine.runAndWait()
```

---

##  Résumé

*   Dans cette leçon, vous avez appris comment les éléments de base de la programmation des leçons précédentes peuvent être implémentés dans Python. De plus, vous avez appris comment Python permettait un code plus simplifié. De plus, vous avez appris à utiliser diverses bibliothèques Python. En fin de compte, vous avez appris que vos compétences en tant que programmeur ne se limitent pas uniquement à un seul langage de programmation. Vous voyez déjà comment vous découvrez une nouvelle façon d'apprendre grâce à ce cours qui pourrait vous servir dans n'importe quel langage de programmation - et, peut-être, dans presque toutes les voies d'apprentissage ! Plus précisément, nous avons discuté…

*    Python
*    variables
*    Conditionnels
*    Boucles
*    Les types
*    Bibliothèques
*    Dictionnaires
*    Arguments de ligne de commande
*    Expressions régulières
*    À la prochaine!