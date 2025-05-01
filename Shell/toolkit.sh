#!/usr/bin/env bash
# toolkit.sh : Menu pour exécuter les scripts du labo 7

SCRIPTS_DIR="$HOME/lab7"

# Fonction d'affichage du menu principal
menu() {
  echo "\n===== Toolkit Menu ====="
  echo "1) backup"
  echo "2) system_report"
  echo "3) log_analyzer"
  echo "4) user_manager"
  echo "5) service_control"
  echo "6) setup_env"
  echo "7) cron_setup"
  echo "8) network_check"
  echo "9) Quitter"
  read -rp "Votre choix : " CHOIX
}

# Boucle principale du menu
while true; do
  menu
  case "$CHOIX" in
    1) read -rp "Répertoire à sauvegarder : " DIR; bash "$SCRIPTS_DIR/backup.sh" "$DIR";;
    2) bash "$SCRIPTS_DIR/system_report.sh";;
    3) read -rp "Fichier log : " FILE; bash "$SCRIPTS_DIR/log_analyzer.sh" "$FILE";;
    4) read -rp "Nom utilisateur : " USER; bash "$SCRIPTS_DIR/user_manager.sh" "$USER";;
    5) read -rp "Nom du service : " SVC; bash "$SCRIPTS_DIR/service_control.sh" "$SVC";;
    6) bash "$SCRIPTS_DIR/setup_env.sh";;
    7) bash "$SCRIPTS_DIR/cron_setup.sh";;
    8) bash "$SCRIPTS_DIR/network_check.sh";;
    9) echo "Sortie."; break;;
    *) echo "Option invalide.";;
  esac
done