@echo OFF

@echo [LDU] ==================================================
@echo [LDU] --- ldu-angu2cli-packr ---
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
@SET NG_DIST=%1
IF ["%NG_DIST%"]==[""] (
@SET NG_DIST=%CD%\_dist
)
@echo|set /p="."

IF EXIST "%NG_DIST%" call rmdir /s /q "%NG_DIST%"
call mkdir "%NG_DIST%"
@echo|set /p="."

@SET NGC=%CD%/node_modules/.bin/ngc.cmd
@echo|set /p="."

@echo OK
@echo [LDU]  INFO: update...

call npm prune
call npm install
call npm update

@echo [LDU]  INFO: lint...

call "%NG%" lint --fix

@echo [LDU]  INFO: pack...
@echo [LDU]  INFO: project: %CD%

call "%NGC%"
call cd "%NG_DIST%"
call dir
call pause
