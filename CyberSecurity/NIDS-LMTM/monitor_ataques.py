import time
import os
import glob
import subprocess

def obtener_log_mas_reciente():
    archivos = glob.glob("/var/log/snort/alert*")
    return max(archivos, key=os.path.getmtime) if archivos else "/var/log/snort/alert"

LOG_FILE = obtener_log_mas_reciente()
REPORTE = "reporte_amenazas.txt"
ips_bloqueadas = set()

print(f"--- 🛡️ IPS ACTIVO: Vigilando y Bloqueando en {LOG_FILE} ---")

with open(LOG_FILE, "r", encoding="utf-8", errors="replace") as f:
    f.seek(0, 2)
    while True:
        line = f.readline()
        if not line:
            time.sleep(0.5)
            continue

        # Si la línea tiene los corchetes [**], es una alerta de Snort
        if "[**]" in line:
            try:
                # El formato de Snort es: ... [**] [ID] MENSAJE [**] [Priority: X] {PROTO} IP_ORIGEN:PUERTO -> IP_DEST:PUERTO
                # Leemos la siguiente línea que es donde suele estar la IP
                next_line = f.readline()
                if "->" in next_line:
                    ip_atacante = next_line.split()[0].split(":")[0]

                    if ip_atacante not in ips_bloqueadas and ip_atacante != "127.0.0.1":
                        print(f"🚫 BLOQUEANDO INTRUSO: {ip_atacante}")
                        subprocess.run(["sudo", "iptables", "-I", "INPUT", "1", "-s", ip_atacante, "-j", "DROP"])
                        ips_bloqueadas.add(ip_atacante)
                        with open(REPORTE, "a") as r:
                            r.write(f"[{time.strftime('%H:%M:%S')}] IP BLOQUEADA: {ip_atacante}\n")
            except:
                pass

