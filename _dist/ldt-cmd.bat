@ECHO off

SETLOCAL

TITLE LDutils Developer Tools

IF EXIST "%~dp0VERSION" FOR /F "delims=" %%X IN (%~dp0VERSION) DO SET LDT_VERSION=%%X
IF EXIST "%~dp0%~n0.ini" FOR /F "delims=" %%X IN (%~dp0%~n0.ini) DO SET %%X
IF EXIST "%CD%\.ldtconfig" FOR /F "delims=" %%X IN (%CD%\.ldtconfig) DO SET %%X

IF ["%GIT_ENABLED%"]==["true"] SET PATH=%PATH%;%GIT_PATH%
IF ["%GRADLE_ENABLED%"]==["true"] SET PATH=%PATH%;%GRADLE_PATH%
IF ["%JAVA_ENABLED%"]==["true"] SET PATH=%PATH%;%JAVA_PATH%
IF ["%JAVA_ENABLED%"]==["true"] SET JAVA_HOME=%JAVA_HOME%
IF ["%MAVEN_ENABLED%"]==["true"] SET PATH=%PATH%;%MAVEN_PATH%
IF ["%NODE_ENABLED%"]==["true"] SET PATH=%PATH%;%NODE_PATH%

START /WAIT /B cmd.exe /K "CLS && ECHO LDutils Developer Tools [Version: %LDT_VERSION%] && ECHO (c) %date:~0,4% LilDutils"

ENDLOCAL
