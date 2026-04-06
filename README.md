# 🛡️ Sistema de Prevención de Intrusos (IPS) y Hardening en Infraestructura Linux

Este proyecto documenta la implementación de un entorno de defensa activa sobre **Ubuntu 24.04 LTS**, enfocado en la mitigación de ataques de fuerza bruta y la automatización del monitoreo de seguridad mediante scripts personalizados.

## 🛠️ Herramientas Desarrolladas

### 1. Monitor de Seguridad en Tiempo Real (`monitor_tiempo_real.sh`)
Script en **Bash** para auditoría rápida:
- Reporta estadísticas de bloqueos activos en Fail2ban y estado del puerto 2222.

### 2. Analista Forense de Logs (`auditor_forense_logs.py`)
Script en **Python** para análisis estadístico:
- Procesa `/var/log/auth.log` mediante **Regex** para identificar patrones de ataque y ranking de IPs.

## 📊 Análisis de Resultados y Mitigación

### 1. Fase de Detección (Auditoría de Logs)
Se analizó el comportamiento del servicio SSH ante un intento de acceso no autorizado registrado en `/var/log/auth.log`:


| Evento | Descripción Técnica |
| :--- | :--- |
| **Origen** | Host externo (Windows) - IP: `192.168.1.XXX` |
| **Puerto Objetivo** | 2222 (Hardening activo) |
| **Patrón Detectado** | 3 intentos fallidos en < 60s |

### 2. Fase de Respuesta Automática (IPS)
Tras alcanzar el umbral de `maxretry = 3`, **Fail2ban** ejecutó el bloqueo dinámico.

**Evidencia del Monitor:**
```text
Currently banned: 1  |  Total banned: 1
Banned IP list: 192.168.1.XXX

---
### 🤖 Metodología y Mentoría
Este laboratorio fue desarrollado bajo un esquema de **aprendizaje guiado**, utilizando **Inteligencia Artificial** como mentor técnico para la arquitectura del entorno, la lógica de los scripts en Bash/Python y la documentación técnica profesional. Este enfoque permitió acelerar la comprensión de conceptos de **Ciberseguridad Defensiva** y mejores prácticas en **DevOps**.


