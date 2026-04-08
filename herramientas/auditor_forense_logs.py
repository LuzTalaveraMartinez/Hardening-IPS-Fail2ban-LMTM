import re
import os
from collections import Counter
from datetime import datetime

def analizar_logs():
    log_path = "/var/log/auth.log"
    print("\033[1;36m" + "="*50 + "\033[0m")
    print("\033[1;32m      AUDITOR FORENSE DE ACCESOS (PYTHON)\033[0m")
    print(f"      Generado el: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print("\033[1;36m" + "="*50 + "\033[0m")

    if not os.path.exists(log_path):
        print(f"Error: No se encuentra el archivo {log_path}")
        return

    try:
        with open(log_path, "r") as f:
            data = f.read()
            # Buscamos IPs de intentos fallidos con una expresión regular
            ips = re.findall(r"Failed password for .* from ([\d\.]+) port", data)
            
            if not ips:
                print("No se encontraron intentos de acceso fallidos registrados.")
            else:
                conteo = Counter(ips)
                print(f"Total de incidentes detectados: {len(ips)}")
                print("-" * 50)
                print(f"{'DIRECCIÓN IP':<25} | {'INTENTOS':<10}")
                print("-" * 50)
                for ip, veces in conteo.most_common():
                    print(f"{ip:<25} | {veces:<10}")
                print("-" * 50)
                print("\033[1;33mRECOMENDACIÓN:\033[0m Revisar bloqueos activos en monitor_tiempo_real.sh")
    except PermissionError:
        print("ERROR: Permisos insuficientes. Usa: sudo python3 auditor_forense_logs.py")

if __name__ == "__main__":
    analizar_logs()
