@ECHO off

:main
	SETLOCAL ENABLEDELAYEDEXPANSION

	:init
		TITLE LDutils Developer Tools

	:load
		@REM Loading version: VERSION
		SET prv_ldtVersionFile=%~dp0VERSION
		IF EXIST "%prv_ldtVersionFile%" FOR /F "delims=" %%X IN (%prv_ldtVersionFile%) DO SET LDT_CMD_VERSION=%%X
		@REM Loading environment: conf\.ldt-cmd.env
		SET prv_ldtEnvironmentFile=%~dp0conf\%~n0.env
		IF EXIST "%prv_ldtEnvironmentFile%" FOR /F "delims=" %%X IN (%prv_ldtEnvironmentFile%) DO SET %%X
		@REM Loading configurations: conf\.ldt-cmd.ini
		SET prv_ldtConfigurationFile=%~dp0conf\%~n0.ini
		IF EXIST "%prv_ldtConfigurationFile%" FOR /F "delims=" %%X IN (%prv_ldtConfigurationFile%) DO SET %%X
		@REM Loading workspace configurations: .ldtconfig, .ldtcmd
		SET prv_ldtWorkspaceConfigFile=%CD%\.ldtconfig
		IF EXIST "%prv_ldtWorkspaceConfigFile%" FOR /F "delims=" %%X IN (%prv_ldtWorkspaceConfigFile%) DO SET %%X
		SET prv_ldtWorkspaceCommandFile=%CD%\.ldtcmd
		IF EXIST "%prv_ldtWorkspaceCommandFile%" FOR /F "delims=" %%X IN (%prv_ldtWorkspaceCommandFile%) DO %%X

	:config
		IF ["%LDT_MODE%"]==["ANGULAR"] (
			@CALL %LOGGER% LOG_DEBUG "LDT run in ANGULAR mode"
			@CALL %LOGGER% LOG_DEBUG "...enable: Git %GIT_VERSION%"
			IF ["%GIT_ENABLED%"]==["true"] SET PATH=%PATH%;%GIT_PATH%
			@CALL %LOGGER% LOG_DEBUG "...enable: NodeJS %NODE_VERSION%"
			IF ["%NODE_ENABLED%"]==["true"] SET PATH=%PATH%;%NODE_PATH%
		)
		IF ["%LDT_MODE%"]==["ELECTRON"] (
			@CALL %LOGGER% LOG_DEBUG "LDT run in ELECTRON mode"
			@CALL %LOGGER% LOG_DEBUG "...enable: Git %GIT_VERSION%"
			IF ["%GIT_ENABLED%"]==["true"] SET PATH=%PATH%;%GIT_PATH%
			@CALL %LOGGER% LOG_DEBUG "...enable: NodeJS %NODE_VERSION%"
			IF ["%NODE_ENABLED%"]==["true"] SET PATH=%PATH%;%NODE_PATH%
			@CALL %LOGGER% LOG_DEBUG "...enable: Python %PYTHON_VERSION%"
			IF ["%PYTHON_ENABLED%"]==["true"] SET PATH=%PATH%;%PYTHON_PATH%
		)
		IF ["%LDT_MODE%"]==["LDuGULP"] (
			@CALL %LOGGER% LOG_DEBUG "LDT run in LDuGULP mode"
			@CALL %LOGGER% LOG_DEBUG "...enable: Git %GIT_VERSION%"
			IF ["%GIT_ENABLED%"]==["true"] SET PATH=%PATH%;%GIT_PATH%
			@CALL %LOGGER% LOG_DEBUG "...enable: nginx %NGINX_VERSION%"
			IF ["%NGINX_ENABLED%"]==["true"] SET PATH=%PATH%;%NGINX_HOME%
			@CALL %LOGGER% LOG_DEBUG "...enable: NodeJS %NODE_VERSION%"
			IF ["%NODE_ENABLED%"]==["true"] SET PATH=%PATH%;%NODE_PATH%
			@CALL %LOGGER% LOG_DEBUG "...enable: PHP %PHP_VERSION%"
			IF ["%PHP_ENABLED%"]==["true"] SET PATH=%PATH%;%PHP_HOME%
		)
		IF ["%LDT_MODE%"]==["SPRINGBOOT"] (
			@CALL %LOGGER% LOG_DEBUG "LDT run in SPRINGBOOT mode"
			@CALL %LOGGER% LOG_DEBUG "...enable: Git %GIT_VERSION%"
			IF ["%GIT_ENABLED%"]==["true"] SET PATH=%PATH%;%GIT_PATH%
			@CALL %LOGGER% LOG_DEBUG "...enable: Gradle %GRADLE_VERSION%"
			IF ["%GRADLE_ENABLED%"]==["true"] SET PATH=%PATH%;%GRADLE_PATH%
			@CALL %LOGGER% LOG_DEBUG "...enable: Jasypt %JASYPT_VERSION%"
			IF ["%JASYPT_ENABLED%"]==["true"] SET PATH=%PATH%;%JASYPT_HOME%
			@CALL %LOGGER% LOG_DEBUG "...enable: Java %JAVA_VERSION%"
			IF ["%JAVA_ENABLED%"]==["true"] SET PATH=%PATH%;%JAVA_PATH%
			IF ["%JAVA_ENABLED%"]==["true"] SET JAVA_HOME=%JAVA_HOME%
			@CALL %LOGGER% LOG_DEBUG "...enable: Maven %MAVEN_VERSION%"
			IF ["%MAVEN_ENABLED%"]==["true"] SET PATH=%PATH%;%MAVEN_PATH%
		)
		IF ["%LDT_MODE%"]==["FULL"] (
			@CALL %LOGGER% LOG_DEBUG "LDT run in DEFAULT mode"
			@CALL %LOGGER% LOG_DEBUG "...enable: LDT %LDT_VERSION%"
			SET PATH=%PATH%;%LDT_PATH%
			@CALL %LOGGER% LOG_DEBUG "...enable: Git %GIT_VERSION%"
			IF ["%GIT_ENABLED%"]==["true"] SET PATH=%PATH%;%GIT_PATH%
			@CALL %LOGGER% LOG_DEBUG "...enable: Gradle %GRADLE_VERSION%"
			IF ["%GRADLE_ENABLED%"]==["true"] SET PATH=%PATH%;%GRADLE_PATH%
			@CALL %LOGGER% LOG_DEBUG "...enable: Jasypt %JASYPT_VERSION%"
			IF ["%JASYPT_ENABLED%"]==["true"] SET PATH=%PATH%;%JASYPT_HOME%
			@CALL %LOGGER% LOG_DEBUG "...enable: Java %JAVA_VERSION%"
			IF ["%JAVA_ENABLED%"]==["true"] SET PATH=%PATH%;%JAVA_PATH%
			IF ["%JAVA_ENABLED%"]==["true"] SET JAVA_HOME=%JAVA_HOME%
			@CALL %LOGGER% LOG_DEBUG "...enable: Maven %MAVEN_VERSION%"
			IF ["%MAVEN_ENABLED%"]==["true"] SET PATH=%PATH%;%MAVEN_PATH%
			@CALL %LOGGER% LOG_DEBUG "...enable: MongoDB %MONGODB_VERSION%"
			IF ["%MONGODB_ENABLED%"]==["true"] SET PATH=%PATH%;%MONGODB_HOME%
			@CALL %LOGGER% LOG_DEBUG "...enable: MySQL %MYSQLDB_VERSION%"
			IF ["%MYSQLDB_ENABLED%"]==["true"] SET PATH=%PATH%;%MYSQLDB_HOME%
			@CALL %LOGGER% LOG_DEBUG "...enable: nginx %NGINX_VERSION%"
			IF ["%NGINX_ENABLED%"]==["true"] SET PATH=%PATH%;%NGINX_HOME%
			@CALL %LOGGER% LOG_DEBUG "...enable: NodeJS %NODE_VERSION%"
			IF ["%NODE_ENABLED%"]==["true"] SET PATH=%PATH%;%NODE_PATH%
			@CALL %LOGGER% LOG_DEBUG "...enable: PHP %PHP_VERSION%"
			IF ["%PHP_ENABLED%"]==["true"] SET PATH=%PATH%;%PHP_HOME%
			@CALL %LOGGER% LOG_DEBUG "...enable: PostgreSQL %PSQLDB_VERSION%"
			IF ["%PSQLDB_ENABLED%"]==["true"] SET PATH=%PATH%;%PSQLDB_HOME%
			@CALL %LOGGER% LOG_DEBUG "...enable: Python %PYTHON_VERSION%"
			IF ["%PYTHON_ENABLED%"]==["true"] SET PATH=%PATH%;%PYTHON_PATH%
			@CALL %LOGGER% LOG_DEBUG "...enable: Tomcat %TOMCAT_VERSION%"
			IF ["%TOMCAT_ENABLED%"]==["true"] SET PATH=%PATH%;%TOMCAT_HOME%
			@CALL %LOGGER% LOG_DEBUG "...enable: XAMPP %XAMPP_VERSION%"
			IF ["%XAMPP_ENABLED%"]==["true"] SET PATH=%PATH%;%XAMPP_HOME%
		)

	:run
		IF ["%LDT_LOGGER_ENABLED%"]==["true"] @CALL TIMEOUT /T 3 > nul
		IF ["%LDT_HEADER_ENABLED%"]==["true"] START /WAIT /B cmd.exe /K "CLS && ECHO LDutils Developer Tools [Version: %LDT_VERSION%] && ECHO (c) 2018. LilDutils"
		IF ["%LDT_HEADER_ENABLED%"]==["false"] START /WAIT /B cmd.exe
		IF ["%LDT_HEADER_ENABLED%"]==[""] START /WAIT /B cmd.exe

	:return
		ENDLOCAL
