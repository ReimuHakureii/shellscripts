#!/usr/bin/env bash
# user_manager.sh : Gère la création d'utilisateur sous Linux
# Utilisation : ./user_manager.sh <nom_utilisateur> [groupe] [mot_de_passe]

USERNAME="$1"
GROUP="${2:-juju}"
PASSWORD="${3:-123}"

# Vérifie que le nom d'utilisateur est fourni
if [ -z "$USERNAME" ]; then
  echo "Usage: $0 <nom_utilisateur> [groupe] [mot_de_passe]"
  exit 1
fi

# Crée l'utilisateur s'il n'existe pas
if id "$USERNAME" &>/dev/null; then
  echo "L'utilisateur '$USERNAME' existe déjà."
else
  sudo useradd -m -s /bin/bash "$USERNAME"
  echo "$USERNAME:$PASSWORD" | sudo chpasswd
  echo "Utilisateur '$USERNAME' créé."
fi

# Ajoute l'utilisateur au groupe
if getent group "$GROUP" &>/dev/null; then
  sudo usermod -aG "$GROUP" "$USERNAME"
else
  sudo groupadd "$GROUP"
  sudo usermod -aG "$GROUP" "$USERNAME"
fi

echo "L'utilisateur '$USERNAME' est maintenant dans le groupe '$GROUP'."