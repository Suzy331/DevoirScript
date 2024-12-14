#!/bin/bash

SOURCE="/home/emttyconcept/Bureau/tree"
DESTINATION="/fedoraserver"
DATE=$(date +"%Y-%m-%d")
PREVIOUS_SNAPSHOT="/fedoraserver/sauvegarde_diff_$(date -d "last Sunday" +"%Y-%m-%d").tar.gz"

mkdir -p "$DESTINATION"

tar -czf "$DESTINATION/sauvegarde_diff_$DATE.tar.gz" --newer "$PREVIOUS_SNAPSHOT" "$SOURCE"
echo "Sauvegarde différentielle réalisée : $DESTINATION/sauvegarde_diff_$DATE.tar.gz"
