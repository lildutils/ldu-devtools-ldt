@echo OFF

@echo [LDU] ==================================================
@echo [LDU] --- ldu-mongod-connectr ---
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

@SET MONGOD_APP_DIR=%CD%\.mongod
IF NOT EXIST "%MONGOD_APP_DIR%" (
IF NOT DEFINED IS_FAILED @SET IS_FAILED=true
@SET MISSING_MONGOD="mongod" not found
)
@echo|set /p="."

IF DEFINED IS_FAILED (
@echo FAILED
@echo [LDU] --------------------------------------------------
IF DEFINED MISSING_COMMAND @echo [LDU] ERROR: %MISSING_COMMAND%
IF DEFINED WRONG_COMMAND @echo [LDU] ERROR: %WRONG_COMMAND%
IF DEFINED MISSING_MONGOD @echo [LDU] ERROR: %MISSING_MONGOD%
@echo [LDU] 
call pause
call exit
)
@echo|set /p="."

@SET MONGOD_DATA_DIR=%CD%\_data
@echo|set /p="."

@SET MONGOD=%MONGOD_APP_DIR%\bin\mongod.exe
@SET MONGOD_PORT=%2
IF ["%MONGOD_PORT%"]==[""]  (
@SET MONGOD_PORT=27017
)
@echo|set /p="."

@echo OK
IF DEFINED IS_SETUP (
@echo [LDU]  INFO: setup...

IF EXIST "%MONGOD_DATA_DIR%" call rmdir /q /s "%MONGOD_DATA_DIR%"
call mkdir "%MONGOD_DATA_DIR%"

call "%MONGOD%" --port %MONGOD_PORT% --dbpath "%MONGOD_DATA_DIR%"
call pause
)
IF DEFINED IS_CONNECT (
@echo [LDU]  INFO: connect...

call "%MONGOD%" --port %MONGOD_PORT% --auth --dbpath "%MONGOD_DATA_DIR%"
)
