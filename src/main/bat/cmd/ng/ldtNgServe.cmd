@ECHO off

SETLOCAL


:main()
	:init()
		FOR /F "delims=" %%X IN (%~dp0ldt.conf) DO SET %%X
		SET PATH=%NODE%

	:serve()
		IF ["%1"]==["aot"] (
			CALL "%CD%\node_modules\.bin\ng.cmd" serve --configuration=dev-lild --aot=true
		) ELSE (
			CALL "%CD%\node_modules\.bin\ng.cmd" serve --configuration=dev-lild
		)

	:return
		ENDLOCAL
