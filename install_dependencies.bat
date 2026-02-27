@echo off
title ClonerTelegram Dependencies - Instalación
color 0B
REM 0B = fondo negro, texto azul celeste

:menu
cls
echo =======================
echo   CLONER DEPENDENCIES
echo =======================
echo.
echo 1. Instalar Visual C++ Redistributables
echo 2. Instalar Visual Studio Build Tools
echo 3. Instalar Dependencias de Python
echo 4. Salir

echo.
set /p choice=Seleccione una opción [1-4]: 

if "%choice%"=="1" goto install_vcredist
if "%choice%"=="2" goto install_buildtools
if "%choice%"=="3" goto install_python
if "%choice%"=="4" exit
echo Opción no válida. Presione cualquier tecla para volver al menú...
pause >nul
goto menu

:install_vcredist
cls
echo =========================================
echo  INSTALANDO VISUAL C++ REDISTRIBUTABLES
echo =========================================
cd /d "%~dp0dependencies"

for %%f in (vcredist_x64*.exe) do (
    echo Instalando %%f...
    start /wait "" "%%f" /install /quiet /norestart
)

echo.
echo Todos los Redistributables han sido instalados.
pause
goto menu

:install_buildtools
cls
echo =======================================
echo  INSTALANDO VISUAL STUDIO BUILD TOOLS
echo =======================================
cd /d "%~dp0dependencies"

if exist "vs_BuildTools.exe" (
    echo Instalando Build Tools...
    start /wait "" "vs_BuildTools.exe" --quiet --wait --norestart --nocache --installPath "%ProgramFiles(x86)%\Microsoft Visual Studio\2019\BuildTools" --add Microsoft.VisualStudio.Workload.VCTools
    echo.
    echo Build Tools instalados correctamente.
) else (
    echo vs_BuildTools.exe no se encontró en la carpeta dependencies.
)
pause
goto menu

:install_python
cls
echo ===================================
echo  INSTALANDO DEPENDENCIAS DE PYTHON
echo ===================================
echo Actualizando pip...
pip install --upgrade pip

echo Instalando requirements.txt...
pip install -r requirements.txt

echo.
echo Dependencias de Python instaladas correctamente.
pause
goto menu

:install_all
call :install_vcredist
call :install_buildtools
call :install_python
goto menu