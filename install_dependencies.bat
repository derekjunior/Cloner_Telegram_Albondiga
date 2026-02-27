@echo off
title Instalación Automática - ClonerTelegram
echo ===============================
echo 🔧 Instalando Visual C++ Redistributables
echo ===============================

REM Ir a la carpeta de dependencies
cd /d "%~dp0dependencies"

REM Instalar todos los vcredist_x64*.exe silenciosamente
for %%f in (vcredist_x64*.exe) do (
    echo Instalando %%f...
    start /wait "" "%%f" /install /quiet /norestart
)

echo ✅ Todos los Redistributables instalados.
echo.

REM Instalar dependencias de Python
echo 🔧 Instalando dependencias de Python...
pip install --upgrade pip
pip install -r requirements.txt

echo.
echo ===============================
echo 🎉 Instalación completada
echo ===============================
pause