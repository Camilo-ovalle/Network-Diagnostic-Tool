@echo off
title Network Diagnostic Tool
color 07
setlocal enabledelayedexpansion

:: Obtener fecha actual
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value 2^>nul') do set datetime=%%I
set date=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%

:: Menú Principal
:menu
cls
echo =====================================================
echo                 NETWORK DIAGNOSTIC TOOL
echo =====================================================
echo.
echo   Select the campaign you want to check:
echo.
echo   [1] Campaign 1
echo   [2] Campaign 2
echo   [3] Campaign 3
echo   [4] Campaign 4
echo   [5] Campaign 5
echo   [6] Campaign 6
echo   [7] Campaign 7
echo   [8] Exit
echo.
echo =====================================================
set /p "campaign=  Type campaign number: "

if "%campaign%"=="8" exit

:: Asignar herramientas y enlaces según la campaña seleccionada
set "toolList="
if "%campaign%"=="1" (
    set "toolList=app1 app2 app3 app4"
    set "app1=google.com"
    set "app2=cloudflare.com"
    set "app3=facebook.com"
    set "app4=amazon.com"
)
if "%campaign%"=="2" (
    set "toolList=app1 app2"
    set "app1=microsoft.com"
    set "app2=apple.com"
)
if "%campaign%"=="3" (
    set "toolList=app1 app2"
    set "app1=netflix.com"
    set "app2=youtube.com"
)
if "%campaign%"=="4" (
    set "toolList=app1"
    set "app1=openai.com"
)
if "%campaign%"=="5" (
    set "toolList=app1 app2"
    set "app1=reddit.com"
    set "app2=yahoo.com"
)
if "%campaign%"=="6" (
    set "toolList=app1"
    set "app1=bing.com"
)
if "%campaign%"=="7" (
    set "toolList=app1 app2"
    set "app1=google.com"
    set "app2=airbnb.com"
)

:: Verificar si la selección es válida
if not defined toolList (
    echo.
    echo Invalid selection! Try again...
    timeout /t 2 >nul
    goto menu
)

:: Menú de herramientas
cls
echo =====================================================
echo               SELECT DESTINATION TOOL
echo =====================================================
set count=1
for %%a in (%toolList%) do (
    set "tool!count!=%%a"
    echo   [!count!] %%a
    set /a count+=1
)
echo   [0] Back to Main Menu
echo.
echo =====================================================
set /p "toolSeleccionado=  Type tool number: "

if "%toolSeleccionado%"=="0" goto menu

:: Obtener el nombre de la herramienta seleccionada
set "toolName="
for /L %%i in (1,1,%count%) do (
    if "!toolSeleccionado!"=="%%i" set "toolName=!tool%%i!"
)

:: Validar selección
if not defined toolName (
    echo.
    echo Invalid selection! Try again...
    timeout /t 2 >nul
    goto menu
)

:: Obtener la URL asociada a la herramienta seleccionada
for /f "tokens=2 delims==" %%A in ('set %toolName% 2^>nul') do set "url=%%A"

if not defined url (
    echo.
    echo Error: No URL found for the selected tool.
    timeout /t 2 >nul
    goto menu
)

:: Ruta del log con el nombre de la herramienta
set logPath=%USERPROFILE%\Desktop\logs_%toolName%_%date%.txt

:: Ejecutar pruebas de red
cls
echo =========================================================================
echo                          RUNNING NETWORK DIAGNOSTICS
echo =========================================================================
echo.
echo   Tool: %toolName%
echo   Target: %url%
echo   Saving logs to: %logPath%
echo.
echo =========================================================================
echo Running network tests...
echo.

:: Ejecutar y confirmar finalización de cada prueba
echo Collecting IP configuration...
ipconfig /all >> "%logPath%"
echo Done!

echo Pinging %url%...
ping %url% >> "%logPath%"
echo Done!

echo Tracing route to %url%...
tracert -h 15 %url% >> "%logPath%"
echo Done!

echo Performing NSLookup for %url%...
nslookup %url% >> "%logPath%"
echo green%Done!

:: Mostrar resultados y permitir regresar al menú
echo.
echo =====================================================
echo   Logs saved successfully!
echo   Logs stored at:
echo.
echo   %logPath%
echo.
echo   Press any key to open log file...
pause >nul
notepad "%logPath%"

echo.
echo   Press any key to return to main menu...
pause >nul
goto menu

El mar, 25 feb 2025 a las 15:50, Camilo Ovalle (<Camilo.Ovalle@sutherlandglobal.com>) escribió:
@echo off
 
setlocal enabledelayedexpansion
 
:: Obtener fecha y hora actual
for /f "tokens=2 delims==" %%I in ('"wmic os get localdatetime /value"') do set datetime=%%I
set date=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%_%datetime:~8,2%-%datetime:~10,2%-%datetime:~12,2%
 
 
::Definir Campañas
set "CapitalOne"
set "TMobile"
set "Cedar"
set "HealtFirst"
set "Disney"
set "IRoz"
 
::Mostrar menu
cls
echo Select the campain you want to check:
echo 1. Capital_one
echo 2. T-Mobile
echo 3. Cedar
echo 4. Healt First
echo 5. Disney
echo 6. IRoz
set /p "campain=Type campain number: "
 
::asignar la lista de links
if "%campain%"=="1" set "list=citrix.cloud.capitalone.com citrixwest.cloud.capitalone.com atticus.cloud.capitalone.com zoom.us"
if "%campain%"=="2" set "list=workspace05.t-mobile.com magentaportal.t-mobile.com"
if "%campain%"=="3" set "list=cxone.nicecontact.com max.dev.niceincontact.com"
if "%campain%"=="4" set "list=hthf-gws.sutherlandconnect.com"
if "%campain%"=="5" set "list=cxone.nicecontact.com hulu.lightning.force.com"
if "%campain%"=="6" set "list=iroz.sutherlandglobal.com"
 
::Mostrar menu
cls
echo Select the destination link
set count=1
for %%a in (%list%) do (
    set "link!count!=%%a"
    echo !count!. %%a
    set /a count+=1
)
 
::Pedir la seleccion del link
set /p "linkSeleccionado=Type link number: "
 
::Ejecutar los comandos
set "url="
for /L %%i in (1,1,6) do (
    if "!linkSeleccionado!"=="%%i" set "url=!link%%i!"
)
 
set logPath=%USERPROFILE%\Desktop\logs_%url-%_%date%.txt
 
::Comandos a ejecutar
if defined url (
    echo Please wait while logs are taking for %url%...
    ipconfig /all > "%logPath%" & echo ping to %url% & ping %url% >> "%logPath%" & echo tracert to %url% & tracert -h 15 %url% >> "%logPath%" & nslookup %url% >> "%logPath%"
    echo Logs saved at: "%logPath%"
    notepad "%logPath%"
) else (
    echo Invalid selection
)
 
timeout /t 2 >nul
