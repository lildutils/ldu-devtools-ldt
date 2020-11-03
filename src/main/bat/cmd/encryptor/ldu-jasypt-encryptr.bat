@echo OFF

@echo [LDU] ==================================================
@echo [LDU] --- ldu-jasypt-encryptr ---
@echo [LDU] ==================================================
@echo|set /p="[LDU]  INFO: initialization"

cd ..
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

@SET JASYPT_INPUT=%1
if ["%JASYPT_INPUT%"]==[""] (
IF NOT DEFINED IS_FAILED @SET IS_FAILED=true
@SET MISSING_INPUT=input is required
)
@echo|set /p="."

@SET JASYPT_PASSWORD=%2
if ["%JASYPT_PASSWORD%"]==[""] (
IF NOT DEFINED IS_FAILED @SET IS_FAILED=true
@SET MISSING_PASSWORD=password is required
)

@SET JASYPT_JAR=%CD%\.jasypt\jasypt-1.9.2.jar
IF NOT EXIST "%JASYPT_JAR%" (
IF NOT DEFINED IS_FAILED @SET IS_FAILED=true
@SET MISSING_JASYPT="Jasypt.jar" not found
)
@echo|set /p="."

IF DEFINED IS_FAILED (
@echo FAILED
@echo [LDU] --------------------------------------------------
IF DEFINED MISSING_JAVA @echo [LDU] ERROR: %MISSING_JAVA%
IF DEFINED MISSING_JAVA_HOME @echo [LDU] ERROR: %MISSING_JAVA_HOME%
IF DEFINED MISSING_INPUT @echo [LDU] ERROR: %MISSING_INPUT%
IF DEFINED MISSING_PASSWORD @echo [LDU] ERROR: %MISSING_PASSWORD%
IF DEFINED MISSING_JASYPT @echo [LDU] ERROR: %MISSING_JASYPT%
@echo [LDU] 
call pause
call exit
)
@echo|set /p="."

@SET JASYPT_ALGORITHM=%3
if ["%JASYPT_ALGORITHM%"]==[""] (
@SET JASYPT_ALGORITHM=PBEWithMD5AndDES
)
@echo|set /p="."

@SET JASYPT_CLASS=%4
if ["%JASYPT_CLASS%"]==[""] (
@SET JASYPT_CLASS=org.jasypt.intf.cli.JasyptPBEStringEncryptionCLI
)
@echo|set /p="."

@echo OK
@echo [LDU]  INFO: encryption...

call java -classpath "%JASYPT_JAR%" %JASYPT_CLASS% input=%JASYPT_INPUT% password=%JASYPT_PASSWORD% algorithm=%JASYPT_ALGORITHM%
call pause
