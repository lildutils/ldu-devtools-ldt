@echo OFF

@echo [LDU] =======================================================
@echo [LDU] --- ldu-php-connectr ---
@echo [LDU] =======================================================
@echo|set /p="[LDU]  INFO: initialization"

cd ..
@echo|set /p="."

@SET PHP_APP_DIR=%CD%\.php
IF NOT EXIST "%PHP_APP_DIR%" (
IF NOT DEFINED IS_FAILED @SET IS_FAILED=true
@SET MISSING_PHP="PHP server" not found
)
@echo|set /p="."

IF DEFINED IS_FAILED (
@echo FAILED
@echo [LDU] --------------------------------------------------
IF DEFINED MISSING_PHP @echo [LDU] ERROR: %MISSING_PHP%
@echo [LDU] 
call pause
call exit
)
@echo|set /p="."

@SET PHP_WWW_ROOT=%CD%\_dist
IF NOT EXIST "%PHP_WWW_ROOT%" (
call mkdir "%PHP_WWW_ROOT%"
)
@echo|set /p="."

@SET PHP_SETTINGS=%PHP_APP_DIR%\conf\php.ini
@echo|set /p="."

@SET PHP_HOST=%1
if ["%PHP_HOST%"]==[""] (
@SET PHP_HOST=localhost
)
@echo|set /p="."

@SET PHP_PORT=%2
if ["%PHP_PORT%"]==[""] (
@SET PHP_PORT=8080
)
@echo|set /p="."

@echo OK
@echo [LDU]  INFO: connect...

call "%PHP_APP_DIR%\php.exe" -S %PHP_HOST%:%PHP_PORT% -c "%PHP_SETTINGS%" -t "%PHP_WWW_ROOT%"
