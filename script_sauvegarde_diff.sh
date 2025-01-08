#!/bin/bash

USER="colossusmark14"
SERVER="192.168.56.3"
PASSWORD="colossusmark"  

SOURCE="/home/emttyconcept/Bureau/Savings"
DESTINATION="/home/mes_sauvegardes"
DATE=$(date +"%Y-%m-%d")
ARCHIVE_NAME="sauvegarde_diff_$DATE.tar.gz"
PREVIOUS_SNAPSHOT="/home/emttyconcept/Bureau/sauvegarde_full_2025-01-08.tar.gz"
ARCHIVE_PATH="$DESTINATION/$ARCHIVE_NAME"

# Vérification si l'archive précédente existe
if [ ! -f "$PREVIOUS_SNAPSHOT" ]; then
    echo "Erreur : L'archive précédente $PREVIOUS_SNAPSHOT n'existe pas."
    exit 1
fi

# Créer la sauvegarde différentielle
echo "Création de l'archive tar..."
tar -czf "$DESTINATION/$ARCHIVE_NAME" -C "$SOURCE" --newer "$PREVIOUS_SNAPSHOT" .


if [ $? -ne 0 ]; then
    echo "Erreur lors de la création de l'archive tar."
    exit 1
fi

# Transférer l'archive sur le serveur distant
echo "Transfert de l'archive vers le serveur distant..."
sshpass -p "$PASSWORD" scp "$DESTINATION/$ARCHIVE_NAME" "$USER@$SERVER:$DESTINATION/"

if [ $? -eq 0 ]; then
    echo "Sauvegarde différentielle réalisée : $USER@$SERVER:$DESTINATION/$ARCHIVE_NAME"
else
    echo "Erreur lors du transfert de la sauvegarde."
    exit 1
fi
