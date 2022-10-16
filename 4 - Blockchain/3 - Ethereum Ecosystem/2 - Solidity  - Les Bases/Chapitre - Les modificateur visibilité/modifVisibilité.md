


 function private {être appelé que par des function du même contrac}

 function internal {être appelé comme private mais aussi par des contracs héritent de celui-ci}

 function public { peux être appelé de n'importe ou}

function external { être appelé que depuis l'exterieur du contract}


 Il existent des modificateurs de visibilité qui contrôlent quand et depuis où la fonction peut être appelée : private veut dire que la fonction ne peut être appelée que par les autres fonctions à l'intérieur du contrat; internal est comme private mais en plus, elle peut être appelée par les contrats qui héritent de celui-ci; avec external, la fonction ne peut être appelée que depuis l'extérieur du contrat; et enfin avec public, elle peut être appelée depuis n'importe où, à l'intérieur et à l'extérieur.

 Il existent aussi des modificateurs d'état, qui nous indiquent comment la fonction interagie avec la BlockChain : view nous indique qu'en exécutant cette fonction, aucune donnée ne saura sauvegardée/modifiée. pure nous indique que non seulement aucune donnée ne saura sauvée sur la BlockChain, mais qu'en plus aucune donnée de la BlockChain ne sera lue. Ces 2 fonctions ne coûtent pas de gas si elles sont appelées depuis l'extérieur du contrat (mais elle coûtent du gas si elles sont appelées intérieurement par une autre fonction).