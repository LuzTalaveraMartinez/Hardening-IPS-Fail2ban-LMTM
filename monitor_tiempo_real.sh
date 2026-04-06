#!/bin/bash
# Script de Monitoreo de Seguridad Activa - Proyecto Hardening LMTM
# Autor: Luz Talavera Martínez

clear
echo -e "\e[1;34m================================================\e[0m"
echo -e "\e[1;32m   ESTADO DE SEGURIDAD DEL SERVIDOR (REAL-TIME)\e[0m"
echo -e "\e[1;34m================================================\e[0m"
echo "Fecha actual: $(date)"
echo "------------------------------------------------"

echo -e "\e[1;33m1. Servicio SSH (Puerto 2222):\e[0m"
# Verificamos si el puerto 2222 está activo
sudo ss -tunlp | grep 2222 || echo "ALERTA: SSH no detectado en el puerto 2222"

echo -e "\e[1;33m\n2. Estado de Fail2ban:\e[0m"
# Resumen de bloqueos actuales
sudo fail2ban-client status sshd | grep -E "Currently banned|Total banned"

echo -e "\e[1;33m\n3. Últimas 3 IPs enviadas a la cárcel:\e[0m"
# Buscamos en el log de fail2ban los últimos baneos
sudo grep "Ban " /var/log/fail2ban.log | tail -n 3 || echo "No hay bloqueos recientes."

echo -e "\e[1;34m================================================\e[0m"
