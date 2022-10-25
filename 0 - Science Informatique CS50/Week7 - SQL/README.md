# Lecture 7 - SQL 

- [Semaine 7 en anglais ](https://cs50.harvard.edu/x/2022/notes/7/)
- [Les notes 2022 en anglais ](https://cs50.harvard.edu/extension/2022/fall/notes/7/#welcome)
- [Vidéo Semaine 7](https://www.youtube.com/watch?v=zrCLRC3Ci1c)

## Table des matières

*   [Accueillir!](#)
*   [Base de données de fichiers plats](#)
*   [Bases de données relationnelles](#)
*   [IMDb](#)
*   [JOINs](#)
*   [Index](#)
*   [Utiliser SQL en Python](#)
*   [Conditions de course](#)
*   [Attaques par injection SQL](#)
*   [Résumé](#)

---

## Accueillir!

*   Au cours des semaines précédentes, nous vous avons présenté Python, un langage de programmation de haut niveau qui utilisait les mêmes blocs de construction que nous avons appris en C.

*   Cette semaine, nous continuerons plus de syntaxe liée à Python.

*   De plus, nous intégrerons ces connaissances aux données.

*   Enfin, nous aborderons SQL ou Structured Query Language .

*   Dans l'ensemble, l'un des objectifs de ce cours est d'apprendre à programmer en général - pas simplement à programmer dans les langages décrits dans ce cours.

---

##  Base de données de fichiers plats

*   Comme vous l'avez probablement déjà vu, les données peuvent souvent être décrites dans des modèles de colonnes et de tableaux.
Les feuilles de calcul telles que celles créées dans Microsoft Excel et Google Sheets peuvent être générées dans un fichier de valeurs séparées par descsv virgules .

*   Si vous regardez un csvfichier, vous remarquerez que le fichier est plat dans la mesure où toutes nos données sont stockées dans un seul tableau représenté par un fichier texte. Nous appelons cette forme de données une base de données à fichier plat .

*   Python est livré avec un support natif pour les csvfichiers.

*   Dans la fenêtre de votre terminal, saisissez code favorites.pyet écrivez le code comme suit :
```py
 # Prints all favorites in CSV using csv.reader

  import csv

  # Open CSV file
  with open("favorites.csv", "r") as file:

      # Create reader
      reader = csv.reader(file)

      # Skip header row
      next(reader)

      # Iterate over CSV file, printing each favorite
      for row in reader:
          print(row[1])
```

*   Notez que la csvbibliothèque est importée. De plus, nous avons créé un readerqui contiendra le résultat de csv.reader(file). La csv.readerfonction lit chaque ligne du fichier et, dans notre code, nous stockons les résultats dans reader. print(row[1]), par conséquent, imprimera la langue du favorites.csvfichier.

*   Vous pouvez améliorer votre code comme suit :

```py
  # Stores favorite in a variable

  import csv

  # Open CSV file
  with open("favorites.csv", "r") as file:

      # Create reader
      reader = csv.reader(file)

      # Skip header row
      next(reader)

      # Iterate over CSV file, printing each favorite
      for row in reader:
          favorite = row[1]
          print(favorite)
```

*   Avis qui favoriteest stocké puis imprimé. Notez également que nous utilisons la nextfonction pour passer à la ligne suivante de notre lecteur.

*   Python vous permet également d'indexer par les clés d'une liste. Modifiez votre code comme suit :

```py

  # Prints all favorites in CSV using csv.DictReader

  import csv

  # Open CSV file
  with open("favorites.csv", "r") as file:

      # Create DictReader
      reader = csv.DictReader(file)

      # Iterate over CSV file, printing each favorite
      for row in reader:
          print(row["language"])
Notez que cet exemple utilise directement la languageclé dans l'instruction print.

Pour compter le nombre de langues préférées exprimées dans le csvfichier, nous pouvons procéder comme suit :

  # Counts favorites using variables

  import csv

  # Open CSV file
  with open("favorites.csv", "r") as file:

      # Create DictReader
      reader = csv.DictReader(file)

      # Counts
      scratch, c, python = 0, 0, 0

      # Iterate over CSV file, counting favorites
      for row in reader:
          favorite = row["language"]
          if favorite == "Scratch":
              scratch += 1
          elif favorite == "C":
              c += 1
          elif favorite == "Python":
              python += 1

  # Print counts
  print(f"Scratch: {scratch}")
  print(f"C: {c}")
  print(f"Python: {python}")

```

*   Notez que chaque langue est comptée à l'aide d' ifinstructions.

*   Python nous permet d'utiliser un dictionnaire pour compter le countsde chaque langue. Considérez l'amélioration suivante de notre code :

```py
  # Counts favorites using dictionary

  import csv

  # Open CSV file
  with open("favorites.csv", "r") as file:

      # Create DictReader
      reader = csv.DictReader(file)

      # Counts
      counts = {}

      # Iterate over CSV file, counting favorites
      for row in reader:
          favorite = row["language"]
          if favorite in counts:
              counts[favorite] += 1
          else:
              counts[favorite] = 1

  # Print counts
  for favorite in counts:
      print(f"{favorite}: {counts[favorite]}")
```

*   Notez que la valeur countsavec la clé favoriteest incrémentée lorsqu'elle existe déjà. S'il n'existe pas, nous le définissons counts[favorite]et le définissons sur 1. De plus, la chaîne formatée a été améliorée pour présenter le counts[favorite].

*   Python permet également de trier counts. Améliorez votre code comme suit :

```py
  # Sorts favorites by key

  import csv

  # Open CSV file
  with open("favorites.csv", "r") as file:

      # Create DictReader
      reader = csv.DictReader(file)

      # Counts
      counts = {}

      # Iterate over CSV file, counting favorites
      for row in reader:
          favorite = row["language"]
          if favorite in counts:
              counts[favorite] += 1
          else:
              counts[favorite] = 1

  # Print counts
  for favorite in sorted(counts):
      print(f"{favorite}: {counts[favorite]}")
```

*   Remarquez le sorted(counts)au bas du code.

*   Si vous regardez les paramètres de la sortedfonction dans la documentation Python, vous constaterez qu'elle contient de nombreux paramètres intégrés. Vous pouvez tirer parti de certains de ces paramètres intégrés comme suit :

```py
  # Sorts favorites by value

  import csv

  # Open CSV file
  with open("favorites.csv", "r") as file:

      # Create DictReader
      reader = csv.DictReader(file)

      # Counts
      counts = {}

      # Iterate over CSV file, counting favorites
      for row in reader:
          favorite = row["language"]
          if favorite in counts:
              counts[favorite] += 1
          else:
              counts[favorite] = 1

  def get_value(language):
      return counts[language]

  # Print counts
  for favorite in sorted(counts, key=get_value, reverse=True):
      print(f"{favorite}: {counts[favorite]}")
```

*   Notez qu'une fonction appelée get_valueest créée et que la fonction elle-même est transmise en tant qu'argument à la sortedfonction. L' keyargument vous permet d'indiquer à Python la méthode que vous souhaitez utiliser pour trier les éléments.

*   Python a une capacité unique que nous n'avons pas vue à ce jour : il permet l'utilisation de fonctions ou anonymeslambda . Ces fonctions peuvent être utilisées lorsque vous ne voulez pas créer une fonction entièrement différente. Notez la modification suivante :

```py
  # Sorts favorites by value using lambda function

  import csv

  # Open CSV file
  with open("favorites.csv", "r") as file:

      # Create DictReader
      reader = csv.DictReader(file)

      # Counts
      counts = {}

      # Iterate over CSV file, counting favorites
      for row in reader:
          favorite = row["language"]
          if favorite in counts:
              counts[favorite] += 1
          else:
              counts[favorite] = 1

  # Print counts
  for favorite in sorted(counts, key=lambda language: counts[language], reverse=True):
      print(f"{favorite}: {counts[favorite]}")
```

*   Notez que la get_valuefonction a été supprimée. Au lieu de cela, lambda language: counts[language]fait en une ligne ce que faisait notre précédente fonction à deux lignes.

*   Nous pouvons changer la colonne que nous examinons, en nous concentrant plutôt sur notre problème préféré :

```py
  # Favorite problem instead of favorite language

  import csv

  # Open CSV file
  with open("favorites.csv", "r") as file:

      # Create DictReader
      reader = csv.DictReader(file)

      # Counts
      counts = {}

      # Iterate over CSV file, counting favorites
      for row in reader:
          favorite = row["problem"]
          if favorite in counts:
              counts[favorite] += 1
          else:
              counts[favorite] = 1

  # Print counts
  for favorite in sorted(counts, key=lambda problem: counts[problem], reverse=True):
      print(f"{favorite}: {counts[favorite]}")
```

*   Notez que problemremplacé language.

*   Et si nous voulions permettre aux utilisateurs de fournir une entrée directement dans le terminal ? Nous pouvons modifier notre code, en tirant parti de nos connaissances antérieures sur les entrées utilisateur :

```py
  # Favorite problem instead of favorite language

  import csv

  # Open CSV file
  with open("favorites.csv", "r") as file:

      # Create DictReader
      reader = csv.DictReader(file)

      # Counts
      counts = {}

      # Iterate over CSV file, counting favorites
      for row in reader:
          favorite = row["problem"]
          if favorite in counts:
              counts[favorite] += 1
          else:
              counts[favorite] = 1

  # Print count
  favorite = input("Favorite: ")
  if favorite in counts:
      print(f"{favorite}: {counts[favorite]}")
```

*   Remarquez à quel point notre code est compact par rapport à notre expérience en C.

##  Bases de données relationnelles

*   Google, Twitter et Meta utilisent tous des bases de données relationnelles pour stocker leurs informations à grande échelle.

*   Les bases de données relationnelles stockent les données en lignes et en colonnes dans des structures appelées tables .

*   SQL autorise quatre types de commandes :

```
  Create
  Read
  Update
  Delete
```

*   Ces quatre opérations sont affectueusement appelées CRUD .

*   Nous pouvons créer une base de données SQL sur le terminal en tapant sqlite3 favorites.db. Lorsque vous y serez invité, nous conviendrons que nous voulons créer favorites.dben appuyant sur y.

*   Vous remarquerez une invite différente car nous sommes maintenant dans un programme appelé sqlite3.
*   On peut mettre sqlite3en csvmode en tapant .mode csv. Ensuite, nous pouvons importer nos données depuis notre csvfichier en tapant .import favorites.csv favorites. Il semble que rien ne se soit passé !

*   Nous pouvons taper .schemapour voir la structure de la base de données.
*   Vous pouvez lire les éléments d'une table en utilisant la syntaxe SELECT columns FROM table.
*   Par exemple, vous pouvez taper SELECT * FROM favorites;qui itérera chaque ligne dans favorites.
*   Vous pouvez obtenir un sous-ensemble des données à l'aide de la commande SELECT language FROM favorites;.
*   SQL prend en charge de nombreuses commandes pour accéder aux données, notamment :

```
  AVG
  COUNT
  DISTINCT
  LOWER
  MAX
  MIN
  UPPER
```

*   Par exemple, vous pouvez taper SELECT COUNT(language) FROM favorites;. De plus, vous pouvez taper SELECT DISTINCT(language) FROM favorites;pour obtenir une liste des langues individuelles dans la base de données. Vous pouvez même taper SELECT COUNT(DISTINCT(language)) FROM favorites;pour obtenir un décompte de ceux-ci.

```py
  # Searches database popularity of a problem

  import csv

  from cs50 import SQL

  # Open database
  db = SQL("sqlite:///favorites.db")

  # Prompt user for favorite
  favorite = input("Favorite: ")

  # Search for title
  rows = db.execute("SELECT COUNT(*) FROM favorites WHERE problem LIKE ?", "%" + favorite + "%")

  # Get first (and only) row
  row = rows[0]

  # Print popularity
  print(row["COUNT(*)"])
```

*   SQL propose des commandes supplémentaires que nous pouvons utiliser dans nos requêtes :

```
  WHERE       -- adding a Boolean expression to filter our data
  LIKE        -- filtering responses more loosely
  ORDER BY    -- ordering responses
  LIMIT       -- limiting the number of responses
  GROUP BY    -- grouping responses together
```

*   Notez que nous utilisons --pour écrire un commentaire en SQL.

*   Par exemple, nous pouvons exécuter SELECT COUNT(*) FROM favorites WHERE language = 'C'. Un décompte est présenté.

*   De plus, nous pourrions taper SELECT COUNT(*) FROM favorites WHERE language = 'C' AND problem = 'Mario'. Remarquez comment le ANDest utilisé pour affiner nos résultats.

*   De même, nous pourrions exécuter SELECT language, COUNT(*) FROM favorites GROUP BY language. Cela offrirait une table temporaire qui montrerait la langue et le nombre.

*   Nous pourrions améliorer cela en tapant SELECT language, COUNT(*) FROM favorites GROUP BY language ORDER BY COUNT(*). Cela ordonnera la table résultante par le count.

*   Nous pouvons également INSERTentrer dans une base de données SQL en utilisant le formulaire INSERT INTO table (column...) VALUES(value, ...);.
*   Nous pouvons exécuter INSERT INTO favorites (language, problem) VALUES ('SQL', 'Fiftyville').
*   Nous pouvons également utiliser la UPDATEcommande pour mettre à jour vos données.
*   Par exemple, vous pouvez exécuter UPDATE favorites SET language = 'C++' WHERE language = 'C'. Cela entraînera l'écrasement de toutes les instructions précédentes où C était le langage de programmation préféré.
*   Notez que ces requêtes ont un pouvoir immense. Par conséquent, dans le cadre du monde réel, vous devez déterminer qui a les autorisations pour exécuter certaines commandes.
*   *DELETE* vous permet de supprimer des parties de vos données. Par exemple, vous pourriez DELETE FROM favorites WHERE problem = 'Tideman'.

##  IMDb

*   IMDb propose une base de données de personnes, d'émissions, d'écrivains, de débuts, de genres et de classements. Chacun de ces tableaux est lié les uns aux autres comme suit :

![avec les autres](https://cs50.harvard.edu/extension/2022/fall/notes/7/cs50Week7Slide025.png)

*   Après le téléchargement shows.db, vous pouvez exécuter sqlite3 shows.dbdans la fenêtre de votre terminal.
*   Lors de l'exécution .schema, vous trouverez non seulement chacune des tables, mais les champs individuels à l'intérieur de chacun de ces champs.
*   Comme vous pouvez le voir sur l'image ci-dessus, showsa un idchamp. La genrestable a un show_idchamp qui a des données communes entre elle et la showstable.

*   Comme vous pouvez le voir également dans l'image ci-dessus, show_idexiste dans tous les tableaux. Dans le showstableau, il s'appelle simplement id. Ce champ commun à tous les champs s'appelle une clé . Les clés primaires sont utilisées pour identifier un enregistrement unique dans une table. Les clés étrangères sont utilisées pour établir des relations entre les tables en pointant vers la clé primaire dans une autre table.

*   En stockant les données dans une base de données relationnelle, comme ci-dessus, les données peuvent être stockées plus efficacement.

*   Dans sqlite , nous avons cinq types de données, dont :

```
  BLOB       -- binary large objects that are groups of ones and zeros
  INTEGER    -- an integer
  NUMERIC    -- for numbers that are formatted specially like dates
  REAL       -- like a float
  TEXT       -- for strings and the like
```

*   De plus, les colonnes peuvent être définies pour ajouter des contraintes spéciales :
```
  NOT NULL
  UNIQUE
```

*   Pour illustrer davantage la relation entre ces tables, nous pourrions exécuter la commande suivante : SELECT * FROM people LIMIT 10. En examinant la sortie, nous pourrions exécuter SELECT * FROM shows LIMIT 10. De plus, nous pourrions exécuter SELECT * FROM stars LIMIT 10. show_idest une clé étrangère dans cette requête finale car show_idcorrespond au champ unique iddans shows. correspond au champ person_idunique de la colonne.idpeople

*   Nous pouvons encore jouer avec ces données pour comprendre ces relations. Exécuter SELECT * FROM genres. Il y a beaucoup de genres !

*   Nous pouvons encore limiter ces données en exécutant SELECT * FROM genres WHERE genre = 'Comedy' LIMIT 10. À partir de cette requête, vous pouvez voir qu'il y a 10 émissions présentées.

*   Vous pouvez découvrir de quoi il s'agit en exécutantSELECT * FROM shows WHERE id = 626124;
*   Nous pouvons approfondir notre requête pour être plus efficace en exécutant

```
SELECT title 
FROM shows 
WHERE id IN (
  SELECT * 
  FROM genres 
  WHERE genre = 'Comedy'
) 
LIMIT 10
```

*   Notez que cette requête imbrique deux requêtes. Une requête interne est utilisée par une requête externe.

*   Nous pouvons affiner davantage en exécutant

```
SELECT title 
FROM shows 
WHERE id IN (
  SELECT * 
  FROM genres 
  WHERE genre = 'Comedy'
) 
ORDER BY title LIMIT 10
```

*   Et si vous vouliez trouver toutes les séries dans lesquelles Steve Carell joue ? Vous pourriez exécuter SELECT * FROM people WHERE name = 'Steve Carell';Vous trouveriez son individu id. Vous pouvez l'utiliser idpour en localiser plusieurs showsdans lesquels il apparaît. Cependant, il serait fastidieux de tenter celui-ci un par un. Comment pourrions-nous ensuite nos requêtes pour rendre cela plus simple ? Considérer ce qui suit:

```
  SELECT title FROM shows WHERE id IN
    (SELECT show_id FROM stars WHERE person_id =
      (SELECT * FROM people WHERE name = 'Steve Carell'));
```

*   Notez que cette longue requête aboutira à un résultat final utile pour découvrir la réponse à notre question.


##  JOINs


*   Considérez les deux tableaux suivants :

![de de l'émission](https://cs50.harvard.edu/extension/2022/fall/notes/7/cs50Week7Slide030.png)

*   Comment pourrions-nous combiner des tables temporairement ? Les tables peuvent être jointes à l'aide de la JOINcommande.


Exécutez la commande suivante :

```
  SELECT * FROM shows
    JOIN ratings on shows.id = ratings.show_id
    WHERE title = 'The Office';
```

*   Vous pouvez maintenant voir toutes les émissions qui ont été appelées The Office .
*   Vous pouvez également appliquer JOINà notre requête Steve Carell ci-dessus en exécutant ce qui suit :

```
  SELECT title FROM people
    JOIN stars ON people.id = stars.person_id
    JOIN shows ON stars.show_id = shows.id
    WHERE name = `Steve Carell`;
```

*   Remarquez comment chaque JOINcommande nous indique quelles colonnes sont alignées sur chacune des autres colonnes.

*   Cela pourrait être implémenté de la même manière comme suit :

```
  SELECT title FROM people, stars, shows
  WHERE people.id = stars.person_id
  AND stars.show_id = shows.id
  AND name = 'Steve Carell';
```

*   Notez que cela donne les mêmes résultats.

*   L'opérateur générique %peut être utilisé pour trouver toutes les personnes dont le nom commence par Steve Cun pourrait utiliser la syntaxe SELECT * 

FROM people WHERE name = LIKE 'Steve C%';.

##  Index

*   Alors que les bases de données relationnelles ont la capacité d'être plus rapides et plus robustes que l'utilisation d'un CSVfichier, les données peuvent être optimisées dans une table à l'aide d' index .

*   Les index peuvent être utilisés pour accélérer nos requêtes.

*   Nous pouvons suivre la vitesse de nos requêtes en exécutant .timer ondans sqlite3.

*   Pour comprendre comment les index peuvent accélérer nos requêtes, exécutez ce qui suit : SELECT * FROM shows WHERE title = 'The Office';Notez le temps qui s'affiche après l'exécution de la requête.

*   Ensuite, nous pouvons créer un index avec la syntaxe CREATE INDEX title_index on shows (title);. Cela indique sqlite3de créer un index et d'effectuer une optimisation spéciale sous le capot relative à cette colonne title.

*   Cela créera une structure de données appelée B Tree , une structure de données qui ressemble à un arbre binaire. Cependant, contrairement à un arbre binaire, il peut y avoir plus de deux notes enfants.

![un](https://cs50.harvard.edu/extension/2022/fall/notes/7/cs50Week7Slide039.png)

*   En exécutant la requête SELECT * FROM shows WHERE title = 'The Office';, vous remarquerez que la requête s'exécute beaucoup plus rapidement !
Malheureusement, l'indexation de toutes les colonnes entraînerait l'utilisation de plus d'espace de stockage. Par conséquent, il existe un compromis pour une vitesse accrue.

##  Utiliser SQL en Python

*   Pour vous aider à travailler avec SQL dans ce cours, la bibliothèque CS50 peut être utilisée comme suit dans votre code :

```
from cs50 import SQL
```

*   Semblable aux utilisations précédentes de la bibliothèque CS50, cette bibliothèque vous aidera dans les étapes compliquées d'utilisation de SQL dans votre code Python.

*   Vous pouvez en savoir plus sur la fonctionnalité SQL de la bibliothèque CS50 dans la documentation .

*   Rappelez-vous où nous nous sommes arrêtés pour la dernière fois dans favorites.py. Votre code doit apparaître comme suit :

```
  # Favorite problem instead of favorite language

  import csv

  # Open CSV file
  with open("favorites.csv", "r") as file:

      # Create DictReader
      reader = csv.DictReader(file)

      # Counts
      counts = {}

      # Iterate over CSV file, counting favorites
      for row in reader:
          favorite = row["problem"]
          if favorite in counts:
              counts[favorite] += 1
          else:
              counts[favorite] = 1

  # Print count
  favorite = input("Favorite: ")
  if favorite in counts:
      print(f"{favorite}: {counts[favorite]}")
```

Modifiez votre code comme suit :

```
  # Searches database popularity of a problem

  import csv

  from cs50 import SQL

  # Open database
  db = SQL("sqlite:///favorites.db")

  # Prompt user for favorite
  favorite = input("Favorite: ")

  # Search for title
  rows = db.execute("SELECT COUNT(*) FROM favorites WHERE problem LIKE ?", "%" + favorite + "%")

  # Get first (and only) row
  row = rows[0]

  # Print popularity
  print(row["COUNT(*)"])
```

*   Notez que db = SQL("sqlite:///favorites.db")Python indique l'emplacement du fichier de base de données. Ensuite, la ligne qui commence par rowsexécute les commandes SQL en utilisant db.execute. En effet, cette commande passe la syntaxe entre guillemets à la db.executefonction. Nous pouvons émettre n'importe quelle commande SQL en utilisant cette syntaxe. En outre, notez qu'il rowsest renvoyé sous la forme d'une liste de dictionnaires. Dans ce cas, il n'y a qu'un seul résultat, une ligne, renvoyé à la liste des lignes sous forme de dictionnaire.

##  Conditions de course

*   L'utilisation de SQL peut parfois entraîner des problèmes.

*   Vous pouvez imaginer un cas où plusieurs utilisateurs pourraient accéder à la même base de données et exécuter des commandes en même temps.

*   Cela pourrait entraîner des problèmes où le code est interrompu par les actions d'autres personnes. Cela pourrait entraîner une perte de données.

*   Les fonctionnalités SQL intégrées telles que BEGIN TRANSACTION, COMMITet ROLLBACKpermettent d'éviter certains de ces problèmes de condition de concurrence.

##  Attaques par injection SQL

*   Maintenant, toujours en considérant le code ci-dessus, vous vous demandez peut-être ce que font les ?points d'interrogation ci-dessus. L'un des problèmes qui peuvent survenir dans les applications réelles de SQL est ce qu'on appelle une attaque par injection . Une attaque par injection est l'endroit où un acteur malveillant pourrait entrer du code SQL malveillant.

Par exemple, considérez un écran de connexion comme suit :

![ mot de passe](https://cs50.harvard.edu/extension/2022/fall/notes/7/cs50Week7Slide051.png)

*   Sans les protections appropriées dans notre propre code, un acteur malveillant pourrait exécuter un code malveillant. Considérer ce qui suit:

  ```rows = db.execute("SELECT COUNT(*) FROM favorites WHERE problem LIKE ?", "%" + favorite + "%")```

*   Notez que parce que le ?est en place, la validation peut être exécutée favoriteavant qu'elle ne soit acceptée aveuglément par la requête.

*   Vous ne voulez jamais utiliser de chaînes formatées dans les requêtes comme ci-dessus ou faire aveuglément confiance à l'entrée de l'utilisateur.

*   À l'aide de la bibliothèque CS50, la bibliothèque désinfecte et supprime tous les caractères potentiellement malveillants.

##  Résumé

*   Dans cette leçon, vous avez appris plus de syntaxe liée à Python. De plus, vous avez appris à intégrer ces connaissances à des données sous forme de fichiers plats et de bases de données relationnelles. Enfin, vous avez découvert SQL . Plus précisément, nous avons discuté…

*   Bases de données à fichier plat
*   Bases de données relationnelles
*   SQL
*   JOINs
*   Index
*   Utiliser SQL en Python
*   Conditions de course
*   Attaques par injection SQL

-> À la prochaine!