Lors de la création, chaque transaction est chargée d'une certaine quantité de gaz, dont le but est de limiter la quantité de travail nécessaire pour exécuter la transaction et de payer pour cette exécution en même temps

Pendant que l'EVM exécute la transaction, le gaz est progressivement épuisé selon des règles spécifiques.

Le prix du gaz est une valeur fixée par le créateur de la transaction, qui doit payer gas_price * gas à l'avance à partir du compte d'envoi. S'il reste du gaz après l'exécution, il est restitué au créateur de la même manière.

Si le gaz est épuisé à un moment quelconque (c'est-à-dire qu'il serait négatif), une exception de manque de gaz est déclenchée, qui rétablit toutes les modifications apportées à l'état dans la trame d'appel en cours.


