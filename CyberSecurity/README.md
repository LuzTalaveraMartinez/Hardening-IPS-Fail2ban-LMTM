# 🛡️ NIDS-Snort-IPS-Python-LMTM

Este proyecto implementa un **Sistema de Detección de Intrusos de Red (NIDS)** basado en Snort, integrado con un módulo de **Respuesta Activa (IPS)** desarrollado en Python para el laboratorio **LMTM**.

## 📝 Descripción Técnica
El sistema identifica patrones de ataque en tiempo real y actúa para mitigar amenazas de red mediante el análisis de logs y la ejecución de respuestas automatizadas.

> **Nota de Colaboración:** Este laboratorio ha sido desarrollado con el apoyo de Inteligencia Artificial como guía técnica, integrando conocimientos de seguridad defensiva y automatización.

## 🛠️ Tecnologías Utilizadas
*   **Motor de Red:** Snort 2.9.15.1
*   **Lenguaje:** Python 3.x
*   **Entorno:** Ubuntu Linux (Laboratorio LMTM)

## 🔍 Reglas de Detección (Custom Rules)
*   **ICMP (Ping):** Monitoreo de reconocimiento básico.
*   **TCP SYN Scan:** Detección de escaneos de puertos agresivos.
*   **SSH Brute Force:** Identificación de intentos de conexión masivos.

## ⚙️ Funcionamiento del IPS
El script `monitor_ataques.py` realiza un seguimiento de los logs de Snort. Al detectar una firma crítica, identifica la IP de origen permitiendo la respuesta automática y el registro de incidentes.

---
**Autor:** Luz María Talavera Martínez  
**Fecha:** 11 de abril de 2026  
**Laboratorio LMTM**
