#!/bin/bash

# ============================================================
# MÓDULO: RECOLECTOR DE AUDITORÍA (BASH)
# DESARROLLADO POR: Luz Maria Talavera Martinez
# OBJETIVO: Automatizar escaneo de red y auditoría de seguridad.
# ============================================================

# Configuración de rutas
DIRECTORIO_REPORTS="./reports"
FECHA=$(date +"%Y-%m-%d_%H-%M")
ARCHIVO_REPORTE="$DIRECTORIO_REPORTS/auditoria_$FECHA.txt"

# Crear carpeta de reportes si no existe
mkdir -p $DIRECTORIO_REPORTS

echo "============================================================"
echo "   LABORATORIO DE SEGURIDAD LMTM - AUDITORÍA PROACTIVA"
echo "   Auditora: Luz Maria Talavera Martinez"
echo "============================================================"

# 1. Escaneo de Red con Nmap
echo "[*] Iniciando escaneo de puertos en localhost..."
echo "--- REPORTE DE AUDITORÍA LMTM ($FECHA) ---" > $ARCHIVO_REPORTE
sudo nmap -sV -T4 localhost >> $ARCHIVO_REPORTE

# 2. Verificación de Fail2Ban (Estado del IPS)
echo "[*] Verificando estado de Fail2Ban..."
echo -e "\n--- ESTADO DE FAIL2BAN ---" >> $ARCHIVO_REPORTE
sudo fail2ban-client status >> $ARCHIVO_REPORTE

echo "[+] Auditoría completada con éxito."
echo "[+] Resultado guardado en: $ARCHIVO_REPORTE"
echo "============================================================"
echo "[i] Ahora puedes ejecutar: python3 scripts/monitor_tiempo_real.py"

