@echo OFF

@echo [LDU] ==================================================
@echo [LDU] --- ldu-angu2cli-buildr ---
@echo [LDU] ==================================================
@echo|set /p="[LDU]  INFO: initialization"

cd ..
@echo|set /p="."

@SET PATH="%PATH%"
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
@SET NG_TARGET=production
@SET NG_ENVIRONMENT=%1
IF ["%NG_ENVIRONMENT%"]==[""] (
@SET NG_ENVIRONMENT=prod
)
@echo|set /p="."

@echo OK
@echo [LDU]  INFO: update...

call npm prune
call npm install
call npm update

@echo [LDU]  INFO: lint...

call "%NG%" lint --fix

@echo [LDU]  INFO: build...
@echo [LDU]  INFO: project: %CD%
@echo [LDU]  INFO: profile: %NG_ENVIRONMENT%

call "%NG%" build --target=%NG_TARGET% --environment=%NG_ENVIRONMENT% --build-optimizer
call pause
