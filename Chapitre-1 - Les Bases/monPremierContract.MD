**Les Variables dans solidity 

Une variable est essentiellement un espace réservé pour les données qui peuvent être manipulées lors de l'exécution.

 Les variables permettent aux utilisateurs de récupérer et de modifier les informations stockées. Règles de nommage des variables 

1. Un nom de variable ne doit pas correspondre à des mots-clés réservés. exemple : 

2. Les noms de variables doivent commencer par une lettre ou un trait de soulignement (_) et peuvent contenir des lettres de « a à z » ou « A à Z » ou des chiffres de « 0 à 9 » et des caractères également.

3. Le nom des variables est sensible à la casse, c'est-à-dire

```uint toto;``` 

est une variable Dif de 

```uint Toto;```

-------

Déclaration de variables Dans Solidity, la déclaration de variables est un peu différente, pour déclarer une variable, l'utilisateur doit d'abord spécifier le type de données, suivi du modificateur d'accès.


Syntax:
```<type> <access modifier> <variable name> ;```

Example:

```int public int_var;```