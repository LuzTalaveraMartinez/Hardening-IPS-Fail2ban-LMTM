# 🛡️ NIDS-Snort-IPS-Python-LMTM

## 👤 Información del Autor
*   **Autor:** Luz María Talavera Martínez
*   **Fecha:** 11 de abril de 2026
*   **Proyecto:** Laboratorio LMTM - Seguridad Defensiva (NIDS/IPS)

## 📝 Descripción
Implementación de un **Sistema de Detección de Intrusos de Red (NIDS)** basado en Snort, integrado con un módulo de **Respuesta Activa (IPS)** desarrollado en Python. Este laboratorio se enfoca en la identificación de patrones de ataque en el tráfico de red y la automatización de alertas.

> **Nota de Mentoría y Co-Creación:** Este proyecto ha sido desarrollado con el apoyo de Inteligencia Artificial como guía técnica, aplicando metodologías de seguridad defensiva y automatización para la optimización de incidentes.

## 🛠️ Tecnologías Utilizadas
*   **Motor de Red:** Snort 2.9.15.1
*   **Lenguaje:** Python 3.x
*   **Entorno:** Ubuntu Linux (Laboratorio LMTM)
*   **Herramientas de Auditoría:** Nmap (SYN Stealth Scan)

## 🔍 Reglas de Snort Implementadas (config/local.rules)
Se han diseñado firmas personalizadas para detectar vectores de ataque comunes:
1.  **ICMP Detection:** Monitoreo de reconocimiento básico (Ping).
2.  **TCP SYN Scan:** Detección de escaneos de puertos agresivos mediante umbrales (`threshold`).
3.  **SSH Monitoring:** Identificación de intentos de conexión al puerto 22.

## ⚙️ Funcionamiento del IPS (scripts/monitor_ataques.py)
El script realiza un monitoreo en tiempo real del archivo de alertas de Snort. Al detectar una firma crítica, extrae la IP atacante y registra el evento, permitiendo la mitigación inmediata del tráfico malicioso.

## 📂 Estructura del Repositorio
*   `/scripts`: Lógica del monitor IPS en Python.
*   `/config`: Reglas personalizadas (`local.rules`).
*   `/docs`: Evidencias y capturas del funcionamiento.
