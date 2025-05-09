# 🛠️ Network Diagnostic Tool

**Network Diagnostic Tool** es una herramienta automatizada desarrollada en script CMD que permite ejecutar pruebas de red comunes para distintas campañas de una empresa de forma rápida y organizada. Su objetivo es reducir los tiempos de diagnóstico en eventos críticos y estandarizar la recolección de información técnica.

## 📌 Objetivo

Desarrollar e implementar una herramienta de diagnóstico automatizado para reducir los tiempos de respuesta durante eventos críticos en múltiples campañas, facilitando la generación de registros técnicos de red.

---

## 📁 Contenido del Repositorio

- `Network_Diagnostic_Tool.cmd`: script principal listo para ejecutar.
- `README.md`: este documento.
- `/docs/guia_de_uso.pdf` _(opcional)_: versión en PDF con instrucciones.
- `/logs/ejemplos/`: logs de ejemplo generados por la herramienta.

---

## ⚙️ Requisitos del sistema

- Windows 10 o superior
- Acceso a CMD (no requiere permisos de administrador)
- Conexión a red

---

## 🚀 Uso de la herramienta

1. **Ejecutar el script**

   - Haz doble clic sobre `Network_Diagnostic_Tool.cmd`.

2. **Seleccionar campaña**

   - Elige una campaña del menú (por número).
     ![git placeholder](/images/tool_menu_1.png)

3. **Elegir destino**

   - Selecciona el sitio o herramienta que deseas diagnosticar.
     ![git placeholder](/images/tool_menu_2.png)

4. **Ejecutar diagnóstico**

   - El script ejecutará automáticamente los siguientes comandos:
     - `ipconfig /all`
     - `ping [url]`
     - `tracert -h 15 [url]`
     - `nslookup [url]`

5. **Resultados**
   - Los resultados se guardarán automáticamente en un archivo `.txt` en el escritorio.
   - Se mostrará la ruta exacta del archivo y se abrirá en el bloc de notas.

---

## 📂 Ejemplo de ubicación del log

- **_C:\Users\tecon\Desktop\logs_app1_2025-05-09.txt_**

![git placeholder](/images/tool_patch.png)
