@echo OFF

@echo [LDU] ==================================================
@echo [LDU] --- ldu-angu2cli-buildr ---
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

@SET NG_PROJECT=%1
IF ["%NG_PROJECT%"]==[""] (
IF NOT DEFINED IS_FAILED @SET IS_FAILED=true
@SET MISSING_PROJECT=project name is required
)
@echo|set /p="."

IF DEFINED IS_FAILED (
@echo FAILED
@echo [LDU] --------------------------------------------------
IF DEFINED MISSING_GIT @echo [LDU] ERROR: %MISSING_GIT%
IF DEFINED MISSING_NPM @echo [LDU] ERROR: %MISSING_NPM%
IF DEFINED MISSING_PROJECT @echo [LDU] ERROR: %MISSING_PROJECT%
@echo [LDU] 
call pause
call exit
)
@echo|set /p="."

@SET NG=%CD%\node_modules\.bin\ng.cmd
@echo|set /p="."

@SET NG_ENVIRONMENT=%2
IF ["%NG_ENVIRONMENT%"]==[""] (
@SET NG_ENVIRONMENT=prod
)
@echo|set /p="."

@SET DIST_PATH=%CD%\%3
IF ["%DIST_PATH%"]==["%CD%\"] (
@SET DIST_PATH=%CD%\_dist
)
@echo|set /p="."

@echo OK
@echo [LDU]  INFO: update...

call npm prune
call npm install
call npm update

@echo [LDU]  INFO: lint...

call "%NG%" lint %NG_PROJECT% %NG_PROJECT%-e2e --fix

@echo [LDU]  INFO: build...
@echo [LDU]  INFO: project: %CD%
@echo [LDU]  INFO: profile: %NG_ENVIRONMENT%

call "%NG%" build %NG_PROJECT% --configuration=%NG_ENVIRONMENT% --build-optimizer

@echo [LDU]  INFO: zipping...

@SET BUILD_PATH=%CD%\_build
IF EXIST "%BUILD_PATH%" call rmdir /q /s "%BUILD_PATH%"
call mkdir "%BUILD_PATH%"

cd "%DIST_PATH%"

call npm pack
call copy "%CD%\*.tgz" "%BUILD_PATH%"
call del /f "%CD%\*.tgz"

call pause
