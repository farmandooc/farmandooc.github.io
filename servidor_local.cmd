@echo off
echo Iniciando servidor HTTP local...
echo.
echo La galeria estara disponible en:
echo http://localhost:8000
echo.
echo Presiona Ctrl+C para detener el servidor
echo.
cd /d "%~dp0"
python -m http.server 8000