import time
import os
import glob # Para buscar archivos con patrones

# Busca el archivo de alertas más reciente
def obtener_log_mas_reciente():
    archivos = glob.glob("/var/log/snort/alert*")
    if not archivos:
        return "/var/log/snort/alert"
    return max(archivos, key=os.path.getmtime)

LOG_FILE = obtener_log_mas_reciente()
REPORTE = "reporte_amenazas.txt"

print(f"--- 🛡️ Vigilancia Activa: Monitoreando {LOG_FILE} ---")

