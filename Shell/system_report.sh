#!/usr/bin/env bash
# system_report.sh : Génère un rapport système quotidien

DEST_DIR="$HOME/system_reports"
DATE_STR=$(date +"%Y%m%d_%H%M%S")
REPORT_FILE="$DEST_DIR/report_${DATE_STR}.txt"

# Crée le dossier de rapport s'il n'existe pas
mkdir -p "$DEST_DIR"

# Génère et enregistre le rapport
{
  echo "##### Rapport système : $(date) #####"
  echo "Utilisateur courant : $(whoami)"
  echo
  echo "-- Espace disque --"
  df -h
  echo
  echo "-- Charge CPU --"
  uptime
} > "$REPORT_FILE"

# Vérifie le succès de l'opération
if [ $? -eq 0 ]; then
  echo "Rapport généré : $REPORT_FILE"
else
  echo "Erreur lors de la génération du rapport."
  exit 1
fi