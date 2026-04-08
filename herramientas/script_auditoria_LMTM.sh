#!/bin/bash
# Script de Auditoría de Seguridad - Luz Maria Talavera Martinez
FECHA=$(date +'%d/%m/%Y %H:%M')
ID_CARPETA=$(date +'%Y%m%d_%H%M')
DIRECTORIO="Reporte_Auditoria_$ID_CARPETA"
mkdir $DIRECTORIO

echo "--------------------------------------------------"
echo "  AUDITORÍA DE SEGURIDAD - SISTEMAS UBUNTU 22.04  "
echo "  Auditora: Luz Maria Talavera Martinez                 "
echo "  Fecha: $FECHA                                   "
echo "--------------------------------------------------"

echo "[1/3] Ejecutando escaneo profundo con Nmap..."
# Escaneamos todos los puertos (-p-) y guardamos versiones
nmap -sV -p- localhost > $DIRECTORIO/escaneo_puertos.txt

echo "[2/3] Verificando protección IPS Fail2ban..."
sudo fail2ban-client status sshd > $DIRECTORIO/estado_fail2ban.txt

echo "[3/3] Generando informe final estructurado..."
{
  echo "# Informe de Auditoría de Infraestructura"
  echo "## Datos Generales"
  echo "- **Auditora:** Luz Maria Talavera Martinez"
  echo "- **Fecha de ejecución:** $FECHA"
  echo "- **Sistema auditado:** Ubuntu 22.04 LTS"
  echo ""
  echo "## Resultados Técnicos"
  echo "### 1. Análisis de Puertos (Hardening)"
  echo "Se realizó un escaneo de los 65,535 puertos TCP."
  echo "- **Puertos detectados abiertos:** $(grep 'open' $DIRECTORIO/escaneo_puertos.txt | wc -l)"
  echo ""
  echo "### 2. Estado del IPS (Fail2ban)"
  echo "Se verificó la cárcel (jail) de SSH:"
  if grep -q "Status for the jail: sshd" $DIRECTORIO/estado_fail2ban.txt; then
    echo "- **Estado:** Operativo y Protegido"
  else
    echo "- **Estado:** Error de configuración"
  fi
} > $DIRECTORIO/README.md

echo ""
echo "--- PROCESO FINALIZADO CON ÉXITO ---"
echo "Los archivos se encuentran en la carpeta: $DIRECTORIO"

