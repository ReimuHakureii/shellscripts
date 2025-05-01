#!/usr/bin/env bash
# log_analyzer.sh : Analyse d'un fichier .log pour ERROR et WARNING
# Utilisation : ./log_analyzer.sh [fichier.log]

LOG_FILE="${1:-./infos.log}"

# Vérifie l'existence du fichier log
if [ ! -f "$LOG_FILE" ]; then
  echo "Fichier introuvable : $LOG_FILE"
  exit 1
fi

# Compte les erreurs et avertissements
ERROR_COUNT=$(grep -c 'ERROR' "$LOG_FILE")
WARN_COUNT=$(grep -c 'WARNING' "$LOG_FILE")

echo "Nombre de lignes contenant 'ERROR' : $ERROR_COUNT"
echo "Nombre de lignes contenant 'WARNING' : $WARN_COUNT"