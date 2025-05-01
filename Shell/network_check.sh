#!/usr/bin/env bash
# network_check.sh : Vérifie la connectivité réseau

# Vérifie l'accès à Internet via ping
if ping -c 2 google.com &>/dev/null; then
  echo "Internet accessible."
else
  echo "Internet inaccessible."
fi

# Affiche l'adresse IP locale
echo "Adresse IP locale : $(hostname -I | cut -d' ' -f1)"

# Liste les interfaces réseau actives
echo "Interfaces actives :"
ip -brief link show | awk '$2 == "UP" {print $1}'