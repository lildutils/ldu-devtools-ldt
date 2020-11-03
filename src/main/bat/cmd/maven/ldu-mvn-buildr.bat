@echo OFF

@echo [LDU] ==================================================
@echo [LDU] --- ldu-mvn-buildr ---
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

@SET MVN_PATH=%CD%\.mvn
IF NOT EXIST "%MVN_PATH%" (
IF NOT DEFINED IS_FAILED @SET IS_FAILED=true
@SET MISSING_MAVEN="mvn" not found
) ELSE (
@SET PATH=%PATH%;"%MVN_PATH%\bin"
)
@echo|set /p="."

for /f "tokens=3" %%A in ('java -version 2^>^&1') do @SET JAVA_VERSION=%%~A
if ["%JAVA_VERSION%"]==["not"] (
IF NOT DEFINED IS_FAILED @SET IS_FAILED=true
@SET MISSING_JAVA="java" not found
)
@echo|set /p="."

IF NOT DEFINED JAVA_HOME (
IF NOT DEFINED IS_FAILED @SET IS_FAILED=true
@SET MISSING_JAVA_HOME="JAVA_HOME" environment variable is not set
)
@echo|set /p="."

IF DEFINED IS_FAILED (
@echo FAILED
@echo [LDU] --------------------------------------------------
IF DEFINED MISSING_GIT @echo [LDU] ERROR: %MISSING_GIT%
IF DEFINED MISSING_MAVEN @echo [LDU] ERROR: %MISSING_MAVEN%
IF DEFINED MISSING_JAVA @echo [LDU] ERROR: %MISSING_JAVA%
IF DEFINED MISSING_JAVA_HOME @echo [LDU] ERROR: %MISSING_JAVA_HOME%
@echo [LDU] 
call pause
call exit
)
@echo|set /p="."

@SET MVN_PROFILE=%1
IF ["%MVN_PROFILE%"]==[""] (
@SET MVN_PROFILE=prod
)
@echo|set /p="."

@SET MVN_REPOSITORY=%2
IF ["%MVN_REPOSITORY%"]==[""] (
@SET MVN_REPOSITORY=%CD%/.m2/repository
)
@echo|set /p="."

@echo OK
@echo [LDU]  INFO: build...

call mvn -Dmaven.repo.local="%MVN_REPOSITORY%" -DcreateChecksum=true -P%MVN_PROFILE% clean install
call pause
