#!/usr/bin/env bash
# service_control.sh : Vérifie et gère un service sous Linux
# Utilisation : ./service_control.sh <nom_du_service>

SERVICE="$1"

# Vérifie que le nom du service est fourni
if [ -z "$SERVICE" ]; then
  echo "Usage: $0 <nom_du_service>"
  exit 1
fi

# Vérifie si le service est actif, sinon l'installe et le démarre
if systemctl is-active --quiet "$SERVICE"; then
  echo "Le service '$SERVICE' est actif."
else
  echo "Installation et démarrage du service '$SERVICE'..."
  sudo apt-get update
  sudo apt-get install -y "$SERVICE"
  sudo systemctl enable "$SERVICE"
  sudo systemctl start "$SERVICE"
  echo "Service '$SERVICE' prêt."
fi