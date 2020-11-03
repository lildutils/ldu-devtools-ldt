@echo OFF

@echo [LDU] ==================================================
@echo [LDU] --- ldu-mysqld-connectr ---
@echo [LDU] ==================================================
@echo|set /p="[LDU]  INFO: initialization"

cd ..
@echo|set /p="."

IF ["%1"]==[""] (
IF NOT DEFINED IS_FAILED @SET IS_FAILED=true
@SET MISSING_COMMAND=no command given
) ELSE (
IF ["%1"]==["--setup"] (
@SET IS_SETUP=true
) ELSE (
IF ["%1"]==["--connect"] (
@SET IS_CONNECT=true
) ELSE (
IF NOT DEFINED IS_FAILED @SET IS_FAILED=true
@SET WRONG_COMMAND=invalid command given
)))
@echo|set /p="."

@SET MYSQLD_APP_DIR=%CD%\.mysqld
IF NOT EXIST "%MYSQLD_APP_DIR%" (
IF NOT DEFINED IS_FAILED @SET IS_FAILED=true
@SET MISSING_MYSQLD="mysqld" not found
)
@echo|set /p="."

IF DEFINED IS_FAILED (
@echo FAILED
@echo [LDU] --------------------------------------------------
IF DEFINED MISSING_COMMAND @echo [LDU] ERROR: %MISSING_COMMAND%
IF DEFINED WRONG_COMMAND @echo [LDU] ERROR: %WRONG_COMMAND%
IF DEFINED MISSING_MYSQLD @echo [LDU] ERROR: %MISSING_MYSQLD%
@echo [LDU] 
call pause
call exit
)
@echo|set /p="."

@SET MYSQLD_DATA_DIR=%CD%\_data
@echo|set /p="."

@SET MYSQLD_SETTINGS=%MYSQLD_APP_DIR%\conf\my.ini
@echo|set /p="."

@SET MYSQLD=%MYSQLD_APP_DIR%\bin\mysqld.exe
@SET MYSQLD_PORT=%2
IF ["%MYSQLD_PORT%"]==[""] (
@SET MYSQLD_PORT=3306
)
@echo|set /p="."

@echo OK
IF DEFINED IS_SETUP (
@echo [LDU]  INFO: setup...

IF EXIST "%MYSQLD_DATA_DIR%" call rmdir /q /s "%MYSQLD_DATA_DIR%"
call mkdir "%MYSQLD_DATA_DIR%"

call "%MYSQLD%" --defaults-file="%MYSQLD_SETTINGS%" --initialize-insecure --datadir="%MYSQLD_DATA_DIR%" --console --log_syslog=0
call pause
)
IF DEFINED IS_CONNECT (
@echo [LDU]  INFO: connect...

call "%MYSQLD%" --defaults-file="%MYSQLD_SETTINGS%" --datadir="%MYSQLD_DATA_DIR%" --port=%MYSQLD_PORT% --console --log_syslog=0
)
