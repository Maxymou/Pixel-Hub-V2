#!/bin/bash

# Couleurs pour les messages
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Fonction pour afficher les messages
print_message() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERREUR]${NC} $1"
}

# Vérification des privilèges root
if [ "$EUID" -ne 0 ]; then 
    print_error "Ce script doit être exécuté en tant que root (sudo)"
    exit 1
fi

# Copie du fichier test1.html
print_message "Installation de la page de test..."
cp test1.html /var/www/html/
check_command "Installation de la page de test réussie" "Échec de l'installation de la page de test"

# Vérification des permissions
chown www-data:www-data /var/www/html/test1.html
chmod 644 /var/www/html/test1.html

print_message "Installation terminée avec succès!"
print_message "Vous pouvez accéder à la page de test à l'adresse: http://votre_ip/test1.html" 