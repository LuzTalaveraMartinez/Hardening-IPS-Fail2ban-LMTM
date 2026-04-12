# Auditoría de Red y Hardening IPS (LMTM)

**Desarrollado por:** Luz Maria Talavera Martinez  
**Laboratorio de Seguridad LMTM**  
**Fecha de actualización:** 10 de abril de 2026

---

## 📝 Descripción del Proyecto

Solución integral de seguridad en **Ubuntu 22.04** que combina auditoría proactiva y defensa automatizada contra intrusos. Este proyecto integra herramientas de escaneo de red con sistemas de prevención de intrusos (IPS).

## 🤖 Colaboración y Desarrollo

Este proyecto ha sido desarrollado con el apoyo de **Inteligencia Artificial (IA)**, la cual ha facilitado:
- La estructuración profesional del repositorio.
- La optimización de scripts de automatización (Bash y Python).
- La redacción de la documentación técnica.

## 🛠️ Componentes del Proyecto

- **/scripts/script_auditoria_LMTM.sh**: Script en **Bash** que realiza escaneos de red con **Nmap** para identificar vulnerabilidades.
- **/scripts/monitor_tiempo_real.py**: Script en **Python** que proporciona una vista dinámica y en vivo de las IPs bloqueadas por Fail2Ban.
- **/config**: Espacio para almacenar configuraciones personalizadas de `jail.local`.
- **/reports**: Directorio destinado a los resultados de auditoría generados.

## 🚀 Guía de Uso

1. **Clonar**: `git clone https://github.com/LuzTalaveraMartinez/Auditoria-Nmap-Fail2ban-LMTM`
2. **Instalar Dependencias**: `sudo apt update && sudo apt install nmap fail2ban python3 -y`
3. **Permisos**: `chmod +x scripts/script_auditoria_LMTM.sh`
4. **Ejecución**:
   - **Auditoría (Bash):** `sudo ./scripts/script_auditoria_LMTM.sh`
   - **Monitor (Python):** `sudo python3 scripts/monitor_tiempo_real.py`

## 📊 Objetivos Técnicos

- **Reconocimiento**: Detectar superficies de ataque en el host.
- **Prevención**: Implementar reglas de bloqueo automático ante fuerza bruta.
- **Monitoreo**: Visualización de eventos de seguridad en tiempo real.

---

*© 2026 Luz Maria Talavera Martinez - Todos los derechos reservados.*

