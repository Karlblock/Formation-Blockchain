#   10K to be an Master 

``Ressource``

https://github.com/darklab8/fl-darkstat

https://www.amazon.fr/Code-Complete-Second-Steve-McConnell/dp/0735619670

https://www.amazon.com/Unit-Testing-Principles-Practices-Patterns/dp/1617296279

https://www.amazon.com/Test-Driven-Development-Kent-Beck/dp/0321146530

https://www.amazon.com/Clean-Architecture-Craftsmans-Software-Structure/dp/0134494164

https://cryptopals.com/


# Linux Fondamental :

## launch Server Web  :

-   From apt :`apt install apache2` 

*   from python : `python3 -m http-server`

*   from npm  : `npm install http-server && http-server -p 8080`

*   from php : `php -S 127.0.0.1:8080`

## Backup and Restore :

*   outil de Sauvegarde  :
    -   Rsync
    -   Deja Dup
    -   Duplicity

*   outil de cryptage des données 
    -   GnyPG
    -   eCryptfs
    -   LUKS


    Rsync : 
    `rsync -av /path/to/mydirectory user@backup_server:/path/to/backup/directory`

    *   On peut crypter le transfert rsync avec ssh : `sync -avz -e ssh /path/to/mydirectory user@backup_server:/path/to/backup/directory`

    *   Ajouter votre sauvegarde à Cron

## File system Management :

*   ext2 system de gestion de base
*   btrfs ( convient au besoin instantanée) 
*   NTFS besoin de compatibilité avec WINDOWS

*   outil de partionnement :
    -   fdisk
    -   gpart
    -   GParted

Swap ( zone temporaire de mémoire )

## Contener :

### Docker :

**Docker build :**

docker ps -a
docker image
docker rm <container_id>    
docker rm -f <container_id> 
docker rmi <image_id>
docker rmi -f <image_id>     
docker ps	Listez tous les conteneurs en cours d'exécution
docker stop	Arrêtez un conteneur en cours d'exécution.
docker start	Démarrer un conteneur arrêté.
docker restart	Redémarrez un conteneur en cours d'exécution.
docker rm	Retirer un conteneur.
docker rmi	Supprimer une image Docker.
docker logs	Voir les journaux d'un conteneur.

### LXC :

1   Install LXC on your machine and create your first container.

2	Configure the network settings for your LXC container.

3	Create a custom LXC image and use it to launch a new container.

4	Configure resource limits for your LXC containers (CPU, memory, disk space).

5	Explore the lxc-* commands for managing containers.

6	Use LXC to create a container running a specific version of a web server (e.g., Apache, Nginx).

7	Configure SSH access to your LXC containers and connect to them remotely.

8	Create a container with persistence, so changes made to the container are saved and can be reused.

9	Use LXC to test software in a controlled environment, such as a vulnerable web application or malware.

## Configuration du Réseau

### NAC 

*   DAC;MAC;RBAC
*   Stratégie SELinux
*   AppArmor est un linux Security Module (LSM)
*   wrappers TCP

### introduction à l'analyse :

ping 
traceroute
netstat
tcpdump
wireshark
nmap
ss -plnt


1.	Installez SELinux sur votre VM.
2.	Configurez SELinux pour empêcher un utilisateur d'accéder à un fichier spécifique.
3.	Configurez SELinux pour permettre à un seul utilisateur d'accéder à un service réseau spécifique, mais refusez l'accès à tous les autres.
4.	Configurez SELinux pour refuser l'accès à un utilisateur ou à un groupe spécifique pour un service réseau spécifique.
AppArmor
5.	Configurez AppArmor pour empêcher un utilisateur d'accéder à un fichier spécifique.
6.	Configurez AppArmor pour permettre à un seul utilisateur d'accéder à un service réseau spécifique, mais refusez l'accès à tous les autres.
7.	Configurez AppArmor pour refuser l'accès à un utilisateur ou à un groupe spécifique pour un service réseau spécifique.
TCP Enveloppeurs
8.	Configurez les wrappers TCP pour permettre l'accès à un service réseau spécifique à partir d'une adresse IP spécifique.
9.	Configurez les wrappers TCP pour refuser l'accès à un service réseau spécifique à partir d'une adresse IP spécifique.
10.	Configurez les wrappers TCP pour permettre l'accès à un service réseau spécifique à partir d'une gamme d'adresses IP


**X11 sécurisé : **

xwd
xgrabsc

VNC protocole RFB
tigervpn
tightVNC
realVNC (crypté)
UltraVNC (crypté)

### Linux Security :

Ronflement, chkrootkit, rkhunter, Lynis

-   Supprimer ou désactiver tous les services et logiciels inutiles
-   Suppression de tous les services qui reposent sur des mécanismes
-   d'authentification non chiffrés
-   Assurez-vous que NTP est activé et que Syslog est en cours d'exécution.
-   Assurez-vous que chaque utilisateur possède son propre compte
-   Appliquer l'utilisation de mots de passe forts
-   Configurez le vieillissement des mots de passe et limitez      
-   l'utilisation -des mots de passe précédents
-   Verrouillage des comptes utilisateurs après des échecs de connexion
-   Désactivez tous les binaires SUID/SGID indésirables

### Log system :

Kernel Logs
System Logs
Authentication Logs
Application Logs
Security Logs


### Solaris :

code source peut connu ( cercle fermé)
Zttabyte ZFS pour le system de fichier
smf pour le service de management facility
IPS pour le packaging system
Rbac pour les controles d'acces

`showrev -a`
Hostname: solaris
Kernel architecture: sun4u
OS version: Solaris 10 8/07 s10s_u4wos_12b SPARC
Application architecture: sparc
Hardware provider: Sun_Microsystems
Domain: sun.com
Kernel version: SunOS 5.10 Generic_139555-08

Solaris truss
ubuntu Strace

*   Strace est une alternative à truss mais pour Ubuntu, et c'est un outil essentiel pour les administrateurs système et les développeurs, les aidant à diagnostiquer et résoudre les problèmes en temps réel. Il permet aux utilisateurs d'analyser les interactions entre le système d'exploitation et les applications qui s'y exécutent, ce qui est particulièrement utile dans des environnements très complexes et critiques

**command pour grep process apache :**

`ps auxw | grep sbin/apache | awk '{print"-p " $2}' | xargs strace`

------------------------------------------

# Setting up :

## Introduction :

## Organization :

**Structurer son audit :**
gestion des mdp : 1Mot-passe	LastPass	Gardien	Bitwarden

## mise à jour et automatisation :

## prise de note :

information nouvelle ;
idées pour des tests et des traitements ultérieurs ;
résultats de l'analyse ;
Enregistrement ;
capture d'écran ;

*   outil de prise de notre : `Notion.so`, `Obsidian` et `Xmind`
*   ur la documentation. Pour cela, nous pouvons utiliser `GhostWriter` ou `Pwndoc`.

Outil de capture d'écran flammes
Creer des gif  : peigne

## Virtualisation :

Virtualisation matérielle

Virtualisation des applications

Virtualisation du stockage

Virtualisation des données

Virtualisation réseau

Avantage : 

1. Les applications et les services d'une VM n'interfèrent pas entre eux
2. Indépendance totale du système invité vis-à-vis du système d'exploitation du système hôte et du matériel physique sous-jacent
3. Les VM peuvent être déplacées ou clonées vers d'autres systèmes par simple copie
4. Les ressources matérielles peuvent être allouées dynamiquement via l'hyperviseur
5. Utilisation améliorée et plus efficace des ressources matérielles existantes
6. Des délais de provisionnement plus courts pour les systèmes et les applications
7. Gestion simplifiée des systèmes virtuels
8. Disponibilité accrue des VM grâce à l'indépendance vis-à-vis des ressources physiques

##  Container :

#### Preparez ses VM { Linux & Winsdows}

Deux snapshots avec les outils pret à être installé 

Outils pouvant être utilisés pour installer les anciennes versions de Windows:

Chocolaté

MediaCreationTool.bat

Outil de téléchargement ISO Microsoft Windows et Office

Rufus

### config VPS 

-   Install Fail2ban
-   Working only with SSH keys
-   Reduce Idle timeout interval
-   Disable passwords
-   Disable x11 forwarding
-   Use a different port
-   Limit users' SSH access
-   Disable root logins
-   Use SSH proto 2
-   Enable 2FA Authentication for SSH 

> sshd_config :

`LogLevel VERBOSE`  Gives the verbosity level that is used when logging messages from SSH daemon.

``PermitRootLogin no``	Specifies whether root can log in using SSH.

``MaxAuthTries 3``	Specifies the maximum number of authentication attempts permitted per connection.

``MaxSessions 5``	Specifies the maximum number of open shell, login, or subsystem (e.g., SFTP) sessions allowed per network connection.

``HostbasedAuthentication no``	Specifies whether rhosts or /etc/hosts.equiv authentication together with successful public key client host authentication is allowed (host-based authentication).

``PermitEmptyPasswords no``	When password authentication is allowed, it specifies whether the server allows login to accounts with empty password strings.

``ChallengeResponseAuthentication yes``	Specifies whether challenge-response authentication is allowed.

``UsePAM yes``	Specifies if PAM modules should be used for authentification.

``X11Forwarding no``	Specifies whether X11 forwarding is permitted.

``PrintMotd no``	Specifies whether SSH daemon should print /etc/motd when a user logs in interactively.

``ClientAliveInterval 600	``Sets a timeout interval in seconds, after which if no data has been received from the client, the SSH daemon will send a message through the encrypted channel to request a response from the client.

``ClientAliveCountMax 0``	Sets the number of client alive messages which may be sent without SSH daemon receiving any messages back from the client.

``AllowUsers <username>`` This keyword can be followed by a list of user name patterns, separated by spaces. If specified, login is allowed only for user names that match one of the patterns.

``Protocol 2``	Specifies the usage of the newer protocol which is more secure.

``AuthenticationMethods publickey,keyboard-interactive``	Specifies the authentication methods that must be successfully completed for a user to be granted access.

``PasswordAuthentication no``	Specifies whether password authentication is allowed.

**OTP on VPS :**
[https://www.linuxbabe.com/debian/ssh-two-factor-authentication-debian](SSH_2FA)


# Windows Fondamental :

``Get-WmiObject -Class win32_OperatingSystem | select Version,BuildNumber``

**techno de prise à disctance :**

Réseaux Privés Virtuels (VPN)
Secure Shell (SSH)
Protocole de Transfert de Fichier (FTP)
Virtual Network Computing (VNC)
Gestion à distance Windows (ou PowerShell Remoting) (WinRM)
Protocole Bureau à Distance (RDP)

**Outil xfreerdp :**

`xfreerdp /v:<targetIp> /u:htb-student /p:Password`

## System de fihiers :

### FAT32 or else :

**Pros of FAT32 :**

Compatibilité des appareils - il peut être utilisé sur les ordinateurs, les appareils photo numériques, les consoles de jeu, les smartphones, les tablettes, etc.
Compatibilité croisée du système d'exploitation - Il fonctionne sur tous les systèmes d'exploitation Windows à partir de Windows 95 et est également pris en charge par MacOS et Linux.
Cons of FAT32:

Ne peut être utilisé qu'avec des fichiers de moins de 4Go.
Pas de protection des données intégrée ou de compression de fichiers.
Doit utiliser des outils tiers pour le cryptage des fichiers.

### NTFS :

**Pros of NTFS:**

NTFS est fiable et peut restaurer la cohérence du système de fichiers en cas de défaillance du système ou de perte de puissance.
Assure la sécurité en nous permettant de définir des autorisations granulaires sur les fichiers et dossiers.
Prend en charge les partitions de très grande taille.
A journalisation intégrée, ce qui signifie que les modifications de fichiers (ajout, modification, suppression) sont enregistrées.
Cons of NTFS:

La plupart des appareils mobiles ne prennent pas en charge NTFS nativement.
Les périphériques multimédias plus anciens tels que les téléviseurs et les appareils photo numériques n'offrent pas de prise en charge des périphériques de stockage NTFS.

#### Lise Controle d'acces (icacls) :

icacls c:\windows

Le niveau d'accès aux ressources est répertorié après chaque utilisateur dans la sortie. Les paramètres d'héritage possibles sont les suivants:

(CI): conteneur hériter
(OI): objet hériter
(IO): hériter seulement
(NP): ne pas propager hériter
(I): permission héritée du conteneur parent

Les autorisations d'accès de base sont les suivantes :

`icacls c:\Users`

F : accès complet
D :  supprimer l'accès
N :  pas d'accès
M :  modifier l'accès
RX :  lire et exécuter l'accès
R :  accès en lecture seule
W:  accès en écriture seule

**cifs tools : cifs-utils**

### Working with Services & Processes :

Les services Windows sont gérés via le système Service Control Manager (SCM),

`lsass.exe` est le processus responsable de l'application de la stratégie de sécurité sur les systèmes Windows

``xfreerdp /v:<target IP address> /u:htb-student /p:<password> `` RDP à cible de laboratoire

`` Get-WmiObject -Class win32_OperatingSystem``	Obtenir des informations sur le système d'exploitation

``dir c:\ /a ``	Afficher tous les fichiers et répertoires dans le répertoire racine c:\

``tree <directory>``	Affichage graphique de la structure de répertoire d'un chemin

``tree c:\ /f | more`` Parcourez les résultats de la tree commande page par page

``icacls <directory> ``	Afficher les autorisations définies sur un répertoire

``icacls c:\users /grant joe:f``	Accorder à un utilisateur des autorisations complètes sur un répertoire

``icacls c:\users /remove joe `` Supprimer les autorisations d'un utilisateur sur un répertoire

`Get-Service`	PowerShellcmdlet pour afficher les services en cours d'exécution

``help <command>``	Afficher le menu d'aide pour une commande spécifique

``get-alias``	Liste PowerShell alias

``New-Alias -Name "Show-Files" Get-ChildItem``	Créer un nouveau PowerShell alias

``Get-Module | select Name,ExportedCommands | fl``	Voir importé PowerShell modules et leurs commandes associées

``Get-ExecutionPolicy -List``	Voir le PowerShell politique d'exécution

``Set-ExecutionPolicy Bypass -Scope Process``	Définissez le PowerShell stratégie d'exécution à contourner 
pour la session en cours
``wmic os list brief``	Obtenez des informations sur le système d'exploitation avec wmic

``Invoke-WmiMethod``	Appeler des méthodes de WMI objets

``whoami /user``	Voir le SID des utilisateurs actuels

``reg query <key>``	Afficher des informations sur une clé de registre

``Get-MpComputerStatus``	Vérifiez qui Defender les paramètres de protection sont activés

``sconfig``	Charger le menu Configuration du serveur dans Windows Server Core

### Les comptes de Service :




