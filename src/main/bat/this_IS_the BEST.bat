@ECHO off


:main
	SETLOCAL

	:init
		TITLE LDutils Developer Tools

	:load
		REM Loading version: VERSION
		SET prv_ldtVersionFile=%~dp0VERSION
		IF EXIST "%prv_ldtVersionFile%" FOR /F "delims=" %%X IN (%prv_ldtVersionFile%) DO SET LDT_VERSION=%%X
		REM Loading environment: .ldt-cmd.env
		SET prv_ldtEnvironmentFile=%~dp0%~n0.env
		IF EXIST "%prv_ldtEnvironmentFile%" FOR /F "delims=" %%X IN (%prv_ldtEnvironmentFile%) DO SET %%X
		REM Loading default configurations: .ldt-cmd.ini
		SET prv_ldtConfigFile=%~dp0%~n0.ini
		IF EXIST "%prv_ldtConfigFile%" FOR /F "delims=" %%X IN (%prv_ldtConfigFile%) DO SET %%X
		REM Loading project configurations: .ldtconfig
		SET prv_ldtCustomConfigFile=%CD%\.ldtconfig
		IF EXIST "%prv_ldtCustomConfigFile%" FOR /F "delims=" %%X IN (%prv_ldtCustomConfigFile%) DO SET %%X

	:config
		IF ["%GIT_ENABLED%"]==["true"] SET PATH=%PATH%;%GIT_PATH%
		IF ["%GRADLE_ENABLED%"]==["true"] SET PATH=%PATH%;%GRADLE_PATH%
		IF ["%JAVA_ENABLED%"]==["true"] SET PATH=%PATH%;%JAVA_PATH%
		IF ["%JAVA_ENABLED%"]==["true"] SET JAVA_HOME=%JAVA_HOME%
		IF ["%MAVEN_ENABLED%"]==["true"] SET PATH=%PATH%;%MAVEN_PATH%
		IF ["%NODE_ENABLED%"]==["true"] SET PATH=%PATH%;%NODE_PATH%

	:run
		START /WAIT /B cmd.exe /K "CLS && ECHO ECHO LDutils Developer Tools [Version: %LDT_VERSION%] && ECHO (c) %date:~0,4% LilDutils"

	:return
		ENDLOCAL
