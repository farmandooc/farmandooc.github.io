@echo off
echo Iniciando servidor HTTP local con Node.js...
echo.
echo La galeria estara disponible en:
echo http://localhost:3000
echo.
echo Presiona Ctrl+C para detener el servidor
echo.
cd /d "%~dp0"
npx http-server -p 3000