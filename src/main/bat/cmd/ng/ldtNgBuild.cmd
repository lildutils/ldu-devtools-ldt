@ECHO off

SETLOCAL


:main()
	:init()
		FOR /F "delims=" %%X IN (%~dp0ldt.conf) DO SET %%X
		SET PATH=%NODE%

	:serve()
		CALL "%CD%\node_modules\.bin\ng.cmd" build --prod

	:return
		ENDLOCAL
