#!/bin/bash


DIFF_BACKUP_DIR="/home/emttyconcept/Bureau/tree"
FULL_BACKUP_DIR="/home/emttyconcept/Bureau/tree"

find "$DIFF_BACKUP_DIR" -type f -name "*.tar.gz" -mtime +7 -exec rm {} \;

find "$FULL_BACKUP_DIR" -type f -name "*.tar.gz" -mtime +28 -exec rm {} \;

find "$FULL_BACKUP_DIR" -type f -name "*.tar.gz" -mtime +183 -exec rm {} \;

echo "Nettoyage des sauvegardes effectué."