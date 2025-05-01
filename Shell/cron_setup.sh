#!/usr/bin/env bash
# cron_setup.sh : Planifie l'exécution de system_report.sh tous les jours à 18h

CRON_JOB="0 18 * * * $HOME/system_reports/system_report.sh" # définit la tâche cron à ajouter et l'heure d'exécution

# Ajoute la tâche cron si elle n'existe pas déjà
(crontab -l 2>/dev/null | grep -qF "$CRON_JOB") || ( # vérifie si la tâche existe déjà
  (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab - # ajoute la tâche si elle n'existe pas
  echo "Tâche cron ajoutée."
)

# Affiche la liste des tâches cron
crontab -l