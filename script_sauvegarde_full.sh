#!/bin/bash

SOURCE="/home/emttyconcept/Bureau/Savings"
DESTINATION="colossusmark14@192.168.56.3:/home/mes_sauvegardes"
DATE=$(date +"%Y-%m-%d")

mkdir -p "$DESTINATION"

tar -czf "/tmp/sauvegarde_full_$DATE.tar.gz" "$SOURCE"
scp "/tmp/sauvegarde_full_$DATE.tar.gz" "$DESTINATION"
rm "/tmp/sauvegarde_full_$DATE.tar.gz"

echo "Sauvegarde complète réalisée : $DESTINATION/sauvegarde_full_$DATE.tar.gz"
