#!/bin/bash

SOURCE="/home/emttyconcept/Bureau/tree"
DESTINATION="/fedoraserver"
DATE=$(date +"%Y-%m-%d")

mkdir -p "$DESTINATION"

tar -czf "$DESTINATION/sauvegarde_full_$DATE.tar.gz" "$SOURCE"
echo "Sauvegarde complète réalisée : $DESTINATION/sauvegarde_full_$DATE.tar.gz"