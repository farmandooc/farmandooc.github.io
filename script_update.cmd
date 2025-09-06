@echo off
echo Ejecutando script de actualizacion...
set fechaHora=%date:~6,4%-%date:~3,2%-%date:~0,2% %time:~0,8%
echo Fecha y hora: %fechaHora%
REM Renombrar archivo de imagen
set /a contador=%random% %% 1000
for %%f in ("Use_normal copy*.jpg") do ren "%%f" "Use_normal copy%contador%.jpg"
git add .
git commit -m "Auto update - %fechaHora%"
git push -u origin master
echo Script completado