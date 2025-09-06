@echo off
setlocal enabledelayedexpansion

echo Generando lista de archivos...

REM Crear archivo temporal con lista de archivos
echo const files = [ > temp_files.js

REM Agregar cada archivo a la lista (excluyendo archivos temporales y el propio HTML)
for %%f in (*) do (
    if /i not "%%f"=="temp_files.js" (
        if /i not "%%f"=="generate_file_list.cmd" (
            if /i not "%%f"==".git" (
                echo             '%%f', >> temp_files.js
            )
        )
    )
)

echo         ]; >> temp_files.js

REM Leer el HTML actual hasta la línea de files
powershell -Command "(Get-Content 'index.html' | Select-Object -First 79) -join \"`n\" | Out-File -Encoding UTF8 'temp_index.html'"

REM Agregar la nueva lista de archivos
type temp_files.js >> temp_index.html

REM Agregar el resto del HTML desde la línea 82
powershell -Command "(Get-Content 'index.html' | Select-Object -Skip 81) -join \"`n\" | Out-File -Append -Encoding UTF8 'temp_index.html'"

REM Reemplazar el archivo original
move temp_index.html index.html

REM Limpiar archivos temporales
del temp_files.js

echo Lista de archivos actualizada en index.html