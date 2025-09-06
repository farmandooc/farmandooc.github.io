@echo off
setlocal enabledelayedexpansion

echo Generando lista de archivos...

REM Crear archivo JS con lista de archivos
echo // Lista de archivos generada automaticamente > files.js
echo const files = [ >> files.js

REM Agregar cada archivo a la lista (excluyendo archivos de sistema y scripts)
for %%f in (*) do (
    if /i not "%%f"=="files.js" (
        if /i not "%%f"=="generate_file_list.cmd" (
            if /i not "%%f"=="update_file_list.js" (
                if /i not "%%f"=="script_update.cmd" (
                    if /i not "%%f"=="servidor_local.cmd" (
                        if /i not "%%f"=="servidor_node.cmd" (
                            echo     '%%f', >> files.js
                        )
                    )
                )
            )
        )
    )
)

echo ]; >> files.js

echo Lista de archivos guardada en files.js