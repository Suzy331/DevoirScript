#!/bin/bash

USER="colossusmark14"
SERVER="192.168.56.3"
PASSWORD="colossusmark"  

SOURCE="/home/emttyconcept/Bureau/Savings"
DESTINATION="/home/mes_sauvegardes"
DATE=$(date +"%Y-%m-%d")
ARCHIVE_NAME="sauvegarde_full_$DATE.tar.gz"
ARCHIVE_PATH="$DESTINATION/$ARCHIVE_NAME"


if [ ! -d "$SOURCE" ]; then
    echo "Erreur : Le répertoire source $SOURCE n'existe pas."
    exit 1
fi


echo "Création de l'archive tar..."
tar -czf "$SOURCE/$ARCHIVE_NAME" -C "$SOURCE" .


if [ $? -ne 0 ]; then
    echo "Erreur lors de la création de l'archive tar."
    exit 1
fi

echo "Transfert de l'archive vers le serveur distant..."
sshpass -p "$PASSWORD" scp "$SOURCE/$ARCHIVE_NAME" "$USER@$SERVER:$DESTINATION/"

if [ $? -eq 0 ]; then
    echo "Sauvegarde complète réalisée : $USER@$SERVER:$DESTINATION/$ARCHIVE_NAME"
else
    echo "Erreur lors du transfert de la sauvegarde."
    exit 1
fi

rm "$SOURCE/$ARCHIVE_NAME"
