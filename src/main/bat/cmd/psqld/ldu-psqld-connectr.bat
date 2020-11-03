@echo OFF

@echo [LDU] =======================================================
@echo [LDU] --- ldu-psqld-connectr ---
@echo [LDU] =======================================================
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

@SET PSQLD_APP_DIR=%CD%\.psqld
IF NOT EXIST "%PSQLD_APP_DIR%" (
IF NOT DEFINED IS_FAILED @SET IS_FAILED=true
@SET MISSING_PSQLD="psqld" not found
)
@echo|set /p="."

IF DEFINED IS_FAILED (
@echo FAILED
@echo [LDU] --------------------------------------------------
IF DEFINED MISSING_COMMAND @echo [LDU] ERROR: %MISSING_COMMAND%
IF DEFINED WRONG_COMMAND @echo [LDU] ERROR: %WRONG_COMMAND%
IF DEFINED MISSING_PSQLD @echo [LDU] ERROR: %MISSING_PSQLD%
@echo [LDU] 
call pause
call exit
)
@echo|set /p="."

@SET PSQLD_DATA_DIR=%CD%\_data
@echo|set /p="."

@SET PSQLD_I=%PSQLD_APP_DIR%\bin\initdb.exe
@SET PSQLD=%PSQLD_APP_DIR%\bin\pg_ctl.exe
@echo|set /p="."

@echo OK
IF DEFINED IS_SETUP (
@echo [LDU]  INFO: setup...

IF EXIST "%PSQLD_DATA_DIR%" call rmdir /q /s "%PSQLD_DATA_DIR%"
call mkdir "%PSQLD_DATA_DIR%"

call "%PSQLD_I%" -D "%PSQLD_DATA_DIR%" -U postgres -W

@echo [LDU]  INFO: for changing the port number:
@echo [LDU]  INFO:   %PSQLD_DATA_DIR%/postgresql.conf#port=xxxx
call pause
)
IF DEFINED IS_CONNECT (
@echo [LDU]  INFO: connect...

call "%PSQLD%" -D "%PSQLD_DATA_DIR%" start
)
