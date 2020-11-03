@echo OFF

@echo [LDU] ==================================================
@echo [LDU] --- ldu-angu2cli-servr ---
@echo [LDU] ==================================================
@echo|set /p="[LDU]  INFO: initialization"

cd ..
@echo|set /p="."

@SET PATH="%PATH%"
@echo|set /p="."

@SET GIT_PATH=%CD%\.git-p
IF NOT EXIST "%GIT_PATH%" (
IF NOT DEFINED IS_FAILED @SET IS_FAILED=true
@SET MISSING_GIT="git" not found
) ELSE (
@SET PATH=%PATH%;"%GIT_PATH%\bin"
)
@echo|set /p="."

@SET NPM_PATH=%CD%\.npm
IF NOT EXIST "%NPM_PATH%" (
IF NOT DEFINED IS_FAILED @SET IS_FAILED=true
@SET MISSING_NPM="npm" not found
) ELSE (
@SET PATH=%PATH%;"%NPM_PATH%"
)
@echo|set /p="."

IF DEFINED IS_FAILED (
@echo FAILED
@echo [LDU] --------------------------------------------------
IF DEFINED MISSING_GIT @echo [LDU] ERROR: %MISSING_GIT%
IF DEFINED MISSING_NPM @echo [LDU] ERROR: %MISSING_NPM%
@echo [LDU] 
call pause
call exit
)
@echo|set /p="."

@SET NG=%CD%\node_modules\.bin\ng.cmd
@echo|set /p="."

@SET NG_ENVIRONMENT=%1
IF ["%NG_ENVIRONMENT%"]==[""] (
@SET NG_ENVIRONMENT=dev
)
@echo|set /p="."

@SET NG_HOST=%2
IF ["%NG_HOST%"]==[""] (
@SET NG_HOST=localhost
)
@echo|set /p="."

@SET NG_PORT=%3
IF ["%NG_PORT%"]==[""] (
@SET NG_PORT=4200
)
@echo|set /p="."

@echo OK
@echo [LDU]  INFO: update...

call npm prune
call npm install
call npm update

@echo [LDU]  INFO: serve...
@echo [LDU]  INFO: project: %CD%
@echo [LDU]  INFO: profile: %NG_ENVIRONMENT%

call "%NG%" serve --configuration=%NG_ENVIRONMENT% --host %NG_HOST% --port %NG_PORT% --open
