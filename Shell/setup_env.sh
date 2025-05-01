#!/usr/bin/env bash
# setup_env.sh : Configuration de l'environnement Linux

# Réglage du fuseau horaire
sudo timedatectl set-timezone America/Toronto

# Installation des paquets de base
sudo apt-get update
sudo apt-get install -y ufw vim git curl build-essential

# Configuration du pare-feu UFW
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

echo "Configuration du pare-feu UFW terminée."

# Ajout d'alias dans le fichier .bashrc
cat << 'EOF' >> "$HOME/.bashrc"
# Aliases personnalisés
alias ll='ls -alF'
alias gs='git status'
EOF

# Recharge le fichier .bashrc
source "$HOME/.bashrc"