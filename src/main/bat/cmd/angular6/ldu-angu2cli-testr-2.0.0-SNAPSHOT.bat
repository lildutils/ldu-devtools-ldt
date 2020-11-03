@echo OFF

@echo [LDU] ==================================================
@echo [LDU] --- ldu-angu2cli-testr ---
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

IF ["%1"]==[""] (
IF NOT DEFINED IS_FAILED @SET IS_FAILED=true
@SET MISSING_COMMAND=no command given
) ELSE (
IF ["%1"]==["--unit"] (
@SET IS_UNIT=true
) ELSE (
IF ["%1"]==["--e2e"] (
@SET IS_END_TO_END=true
) ELSE (
IF NOT DEFINED IS_FAILED @SET IS_FAILED=true
@SET WRONG_COMMAND=invalid command given
)))
@echo|set /p="."

@SET NG_PROJECT=%2
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
IF DEFINED MISSING_COMMAND @echo [LDU] ERROR: %MISSING_COMMAND%
IF DEFINED WRONG_COMMAND @echo [LDU] ERROR: %WRONG_COMMAND%
IF DEFINED MISSING_PROJECT @echo [LDU] ERROR: %MISSING_PROJECT%
@echo [LDU] 
call pause
call exit
)
@echo|set /p="."

@SET NG=%CD%\node_modules\.bin\ng.cmd
@echo|set /p="."

@echo OK
@echo [LDU]  INFO: update...

call npm prune
call npm install
call npm update

@echo [LDU]  INFO: lint...

call "%NG%" lint %NG_PROJECT% %NG_PROJECT%-e2e --fix

IF DEFINED IS_UNIT (
@echo [LDU]  INFO: unit tests...
@echo [LDU]  INFO: project: %NG_PROJECT%

call "%NG%" test %NG_PROJECT%
)
IF DEFINED IS_END_TO_END (
@echo [LDU]  INFO: e2e tests...
@echo [LDU]  INFO: project: %NG_PROJECT%-e2e

call "%NG%" e2e %NG_PROJECT%-e2e
)
call pause
