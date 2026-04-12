# ============================================================
# MÓDULO: ANALISTA INTELIGENTE DE SEGURIDAD (PYTHON)
# DESARROLLADO POR: Luz Maria Talavera Martinez
# OBJETIVO: Procesar los reportes generados por el script de Bash.
#           Identifica patrones de ataque y puertos críticos.
# ============================================================

import os

def analizar_seguridad():
    # Usamos ruta relativa para que funcione en cualquier instalación
    directorio_actual = os.path.dirname(os.path.abspath(__file__))
    ruta_reports = os.path.join(directorio_actual, "../reports/")

    try:
        # Verificar si existe la carpeta de reportes
        if not os.path.exists(ruta_reports):
            print(f"❌ Error: No existe el directorio {ruta_reports}")
            return

        # Listar archivos de auditoría y ordenar por fecha
        archivos = [f for f in os.listdir(ruta_reports) if f.startswith("auditoria_")]

        if not archivos:
            print("❌ Estado: No hay reportes pendientes de análisis en " + ruta_reports)
            return

        ultimo_reporte = sorted(archivos)[-1]
        ruta_completa = os.path.join(ruta_reports, ultimo_reporte)

        print(f"\n🔍 INICIANDO ANÁLISIS FORENSE LMTM: {ultimo_reporte}")
        print(f"👤 Auditor: Luz Maria Talavera Martinez")
        print("-" * 55)

        alertas = 0
        with open(ruta_completa, "r") as f:
            for linea in f:
                # Buscar puertos críticos abiertos
                if "/tcp" in linea and "open" in linea:
                    print(f"⚠️  RIESGO: Servicio activo detectado -> {linea.strip()}")
                    alertas += 1
                # Buscar registros de bloqueos
                if "Ban" in linea or "Banned" in linea:
                    print(f"🚫 DEFENSA: Registro de IP Bloqueada -> {linea.strip()}")
                    alertas += 1

        if alertas == 0:
            print("✅ RESULTADO: No se encontraron amenazas críticas en este reporte.")
        else:
            print(f"\nRESUMEN: Se detectaron {alertas} puntos de interés para hardening.")
        print("-" * 55)

    except Exception as e:
        print(f"❌ Error crítico durante el análisis: {e}")

if __name__ == "__main__":
    analizar_seguridad()

