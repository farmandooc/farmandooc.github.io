@echo off
echo Ejecutando script de actualizacion...
set fechaHora=%date:~6,4%-%date:~3,2%-%date:~0,2% %time:~0,8%
echo Fecha y hora: %fechaHora%

REM Renombrar archivo de imagen para generar cambios
set /a contador=%random% %% 1000
if exist "Use_normal copy1.jpg" (
    ren "Use_normal copy1.jpg" "Use_normal copy%contador%.jpg"
    echo Archivo renombrado a: Use_normal copy%contador%.jpg
)

git add .
git commit -m "Auto update - %fechaHora%"
git push -u origin master
echo Script completado