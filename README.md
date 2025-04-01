# Script d'Installation LEMP pour Raspberry Pi

Ce projet fournit des scripts d'automatisation pour installer et désinstaller un environnement LEMP (Linux, Nginx, MariaDB, PHP) sur un Raspberry Pi exécutant Raspberry Pi OS Lite 64 bits.

## Prérequis

- Raspberry Pi avec Raspberry Pi OS Lite 64 bits
- Connexion Internet active
- Accès root (sudo)

## Installation

Pour installer le serveur LEMP, exécutez l'une des commandes suivantes :

```bash
# Via curl
curl -s https://raw.githubusercontent.com/votre-username/votre-repo/main/install-lemp-server.sh | sudo bash

# Ou via wget
wget -qO- https://raw.githubusercontent.com/votre-username/votre-repo/main/install-lemp-server.sh | sudo bash
```

## Désinstallation

Pour désinstaller le serveur LEMP, exécutez :

```bash
# Via curl
curl -s https://raw.githubusercontent.com/votre-username/votre-repo/main/uninstall-lemp-server.sh | sudo bash

# Ou via wget
wget -qO- https://raw.githubusercontent.com/votre-username/votre-repo/main/uninstall-lemp-server.sh | sudo bash
```

## Composants Installés

- **Nginx** : Serveur web haute performance
- **PHP-FPM** : Processeur FastCGI pour PHP
  - php-mysql : Support MySQL/MariaDB
  - php-mbstring : Support des chaînes multibytes
  - php-xml : Support XML
  - php-json : Support JSON
- **MariaDB** : Système de gestion de base de données

## Vérification de l'Installation

1. Accédez à la page de test PHP :
   ```
   http://votre_ip/info.php
   ```
   Vous devriez voir la page d'information PHP.

2. Vérifiez que les services sont en cours d'exécution :
   ```bash
   sudo systemctl status nginx
   sudo systemctl status php-fpm
   sudo systemctl status mariadb
   ```

3. Testez la connexion à MariaDB :
   ```bash
   mysql -u root -p
   ```
   Utilisez le mot de passe défini lors de l'installation (par défaut : root_password)

## Notes de Sécurité

- Le mot de passe par défaut de MariaDB est `root_password`. Il est fortement recommandé de le modifier après l'installation.
- Assurez-vous de configurer un pare-feu et de sécuriser votre serveur avant de le mettre en production.
- N'oubliez pas de mettre à jour régulièrement votre système et les composants installés.

## Support

Pour toute question ou problème, veuillez ouvrir une issue sur GitHub. 