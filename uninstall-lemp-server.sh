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

print_warning() {
    echo -e "${YELLOW}[ATTENTION]${NC} $1"
}

# Vérification des privilèges root
if [ "$EUID" -ne 0 ]; then 
    print_error "Ce script doit être exécuté en tant que root (sudo)"
    exit 1
fi

# Demande de confirmation
print_warning "Ce script va supprimer Nginx, PHP-FPM, MariaDB et tous les fichiers associés."
print_warning "Êtes-vous sûr de vouloir continuer? (o/n)"
read -r response
if [[ ! "$response" =~ ^[Oo]$ ]]; then
    print_message "Désinstallation annulée."
    exit 0
fi

# Arrêt des services
print_message "Arrêt des services..."
systemctl stop nginx php-fpm mariadb

# Suppression des paquets
print_message "Suppression des paquets..."
apt-get remove -y nginx nginx-common nginx-full php-fpm php-mysql php-mbstring php-xml php-json mariadb-server mariadb-client
apt-get autoremove -y
apt-get clean

# Suppression des fichiers de configuration
print_message "Suppression des fichiers de configuration..."
rm -rf /etc/nginx
rm -rf /etc/php
rm -rf /etc/mysql
rm -rf /var/lib/mysql
rm -rf /var/www/html/*

# Suppression des fichiers de logs
print_message "Suppression des fichiers de logs..."
rm -rf /var/log/nginx
rm -rf /var/log/php-fpm
rm -rf /var/log/mysql

print_message "Désinstallation terminée avec succès!" 