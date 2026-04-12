#!/bin/bash

# ============================================================
# MÓDULO: INSTALADOR AUTOMÁTICO (LMTM)
# DESARROLLADO POR: Luz Maria Talavera Martinez
# OBJETIVO: Configurar el entorno de auditoría y hardening.
# ============================================================

# Colores para la terminal
VERDE='\033[0;32m'
NC='\033[0m' # Sin color

echo -e "${VERDE}"
echo "============================================================"
echo "    INSTALADOR DE HERRAMIENTAS DE SEGURIDAD - LMTM"
echo "    Desarrollado por: Luz Maria Talavera Martinez"
echo "============================================================"
echo -e "${NC}"

# 1. Actualizar repositorios
echo "[*] Actualizando índices de paquetes..."
sudo apt update -y

# 2. Instalar dependencias necesarias
echo "[*] Instalando Nmap, Fail2ban y Python3..."
sudo apt install nmap fail2ban python3 -y

# 3. Dar permisos de ejecución a los scripts del proyecto
echo "[*] Configurando permisos de ejecución en /scripts..."
chmod +x scripts/script_auditoria_LMTM.sh
chmod +x scripts/monitor_tiempo_real.py

# 4. Crear carpetas necesarias
echo "[*] Asegurando estructura de directorios..."
mkdir -p reports
mkdir -p config

echo -e "\n${VERDE}[+] INSTALACIÓN COMPLETADA EXITOSAMENTE${NC}"
echo "[i] Auditora: Luz Maria Talavera Martinez"
echo "[i] Ya puedes iniciar la auditoría con: sudo ./scripts/script_auditoria_LMTM.sh"
echo "============================================================"

