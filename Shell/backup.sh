#!/usr/bin/env bash
# backup.sh : Archive et sauvegarde un dossier donné
# Utilisation : ./backup.sh <répertoire_à_sauvegarder>

# Vérifie si un argument a été fourni
if [ -z "$1" ]; then
  echo "Usage: $0 <répertoire_à_sauvegarder>"
  exit 1
fi

SRC_DIR="$1"
DEST_DIR="$HOME/backups"
DATE_STR=$(date +"%Y%m%d_%H%M%S")
BASE_NAME=$(basename "$SRC_DIR")
ARCHIVE_NAME="${BASE_NAME}_${DATE_STR}.tar.gz"

# Crée le dossier de destination s'il n'existe pas
mkdir -p "$DEST_DIR"

# Crée l'archive compressée
if tar -czf "$DEST_DIR/$ARCHIVE_NAME" -C "$(dirname "$SRC_DIR")" "$BASE_NAME"; then
  echo "Sauvegarde réussie : $DEST_DIR/$ARCHIVE_NAME"
else
  echo "Erreur lors de la création de l'archive."
  exit 2
fi
