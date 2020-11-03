@ECHO off

SETLOCAL


:main()
	:init()
		::FOR /F "delims=" %%X IN (%~dp0ldt.conf) DO SET %%X
		::SET PATH=%NODE%;%GIT%

	:clean()
		IF EXIST "%_PACKAGE_LOCK_JSON%" CALL DEL "%_PACKAGE_LOCK_JSON%"
		CALL npm cache clear %_FORCED%
		CALL npm prune

	:install()
		CALL npm install

	:update()
		CALL npm update

	:audit()
		::CALL "%NPM%" audit
		::CALL "%NPM%" audit fix
		::CALL "%NPM%" audit fix %FORCED%

	:return
		ENDLOCAL
