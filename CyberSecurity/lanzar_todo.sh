#!/bin/bash
# Ir a la carpeta de trabajo
cd ~/CyberSecurity

echo "--- 🛡️ INICIANDO SISTEMA DE DEFENSA ---"

# 1. Iniciar Snort en segundo plano y guardar el PID
sudo snort -c /etc/snort/snort.conf -i lo -A fast -L alert -D
echo "[+] Snort vigilando en segundo plano..."

# 2. Iniciar tu monitor de Python
echo "[+] Iniciando monitor de alertas..."
sudo python3 monitor_ataques.py
