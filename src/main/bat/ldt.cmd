@ECHO off

:main
	SET LDT_COMMAND=ldt
	SET LDT_COMMAND_PRINT_USAGE=usage
	SET LDT_COMMAND_PRINT_VERSIONS=versions
	SET LDT_COMMAND_PRINT_VERSIONS_SHORT=-v-all
	SET LDT_COMMAND_PRINT_VERSION=version
	SET LDT_COMMAND_PRINT_VERSION_SHORT=-v
	SET LDT_COMMAND_LOAD_CUSTOM_CONFIGS=load
	SET LDT_COMMAND_OPEN_NEW_TERMINAL=new
	SET LDT_COMMAND_OPEN_NEW_TERMINAL_SHORT=-n
	SET LDT_COMMAND_OPEN_GIT_TERMINAL=git
	SET LDT_COMMAND_OPEN_NODE_TERMINAL=node
	SET LDT_COMMAND_START_APACHE=apache-start

	IF ["%_COMMAND_INPUT:~0,7%"]==["ldt new"] GOTO _openNewTerminal
	IF ["%_COMMAND_INPUT:~0,6%"]==["ldt -n"] GOTO _openNewTerminal
	IF ["%LDT_COMMAND_INPUT:~0,9%"]==["%LDT_COMMAND% %LDT_COMMAND_PRINT_USAGE%"] GOTO _printUsage
	IF ["%LDT_COMMAND_INPUT:~0,12%"]==["%LDT_COMMAND% %LDT_COMMAND_PRINT_VERSIONS%"] GOTO _printAbout
	IF ["%LDT_COMMAND_INPUT:~0,10%"]==["%LDT_COMMAND% %LDT_COMMAND_PRINT_VERSIONS_SHORT%"] GOTO _printAbout
	IF ["%LDT_COMMAND_INPUT:~0,11%"]==["%LDT_COMMAND% %LDT_COMMAND_PRINT_VERSION%"] GOTO _printVersion
	IF ["%LDT_COMMAND_INPUT:~0,6%"]==["%LDT_COMMAND% %LDT_COMMAND_PRINT_VERSION_SHORT%"] GOTO _printVersion
	IF ["%LDT_COMMAND_INPUT:~0,8%"]==["%LDT_COMMAND% %LDT_COMMAND_LOAD_CUSTOM_CONFIGS%"] GOTO _loadCustomConfig
	IF ["%LDT_COMMAND_INPUT:~0,7%"]==["%LDT_COMMAND% %LDT_COMMAND_OPEN_NEW_TERMINAL%"] GOTO _openNewTerminal
	IF ["%LDT_COMMAND_INPUT:~0,6%"]==["%LDT_COMMAND% %LDT_COMMAND_OPEN_NEW_TERMINAL_SHORT%"] GOTO _openNewTerminal
	IF ["%LDT_COMMAND_INPUT:~0,7%"]==["%LDT_COMMAND% %LDT_COMMAND_OPEN_GIT_TERMINAL%"] GOTO _openGitTerminal
	IF ["%LDT_COMMAND_INPUT:~0,8%"]==["%LDT_COMMAND% %LDT_COMMAND_OPEN_NODE_TERMINAL%"] GOTO _openNodeTerminal
	IF ["%LDT_COMMAND_INPUT:~0,16%"]==["%LDT_COMMAND% %LDT_COMMAND_START_APACHE%"] GOTO _startApache
	IF ["%_COMMAND_INPUT:~0,3%"]==["git"] GOTO _openGitTerminal
	IF ["%LDT_COMMAND_INPUT:~0,2%"]==["%LDT_NATIVE_CD_00%"] GOTO _changeDir
	IF ["%LDT_COMMAND_INPUT:~0,2%"]==["%LDT_NATIVE_CD_01%"] GOTO _changeDir
	IF ["%LDT_COMMAND_INPUT:~0,2%"]==["%LDT_NATIVE_CD_10%"] GOTO _changeDir
	IF ["%LDT_COMMAND_INPUT:~0,2%"]==["%LDT_NATIVE_CD_11%"] GOTO _changeDir
	IF ["%1"]==["ng-build"] GOTO _ldtNgBuild
	IF ["%1"]==["ng-serve"] GOTO _ldtNgServe
	IF ["%1"]==["npm-update"] GOTO _ldtNpmUpdate
	GOTO _unknownCommand

	:_openGitTerminal
		SET _GIT_TERMINAL_PARAMS=%_COMMAND_INPUT:git =!!%
		IF ["%prv_isUseProtableGit%"]==["true"] (
			START %LDT_GIT_PATH%\..\git-cmd.exe
		) ELSE (
			ECHO INF: You should use the installed 'git-cmd'
		)
		GOTO _awaitCommand

	:_openNodeTerminal
		IF ["%prv_isUseProtableNodejs%"]==["true"] (
			START %LDT_NODEJS_PATH%\node.exe
		) ELSE (
			ECHO INF: You should use the installed 'node'
		)
		GOTO _awaitCommand

	:_startApache
		IF ["%prv_isUseProtableXampp%"]==["true"] (
			START %LDT_XAMPP_PATH%\apache_start.bat	)
		) ELSE (
			ECHO INF: You should use the installed 'xampp'
		)
		GOTO _awaitCommand

	:_ldtNgBuild
		ECHO INF: ...Coming soon...
		GOTO return

	:_ldtNgServe
		ECHO INF: ...Coming soon...
		GOTO return

	:_ldtNpmUpdate
		ECHO INF: ...Coming soon...
		GOTO return

	:_unknownCommand
		ECHO ERR: Unknown command given... please type "ldt usage" to see the usage
		GOTO return

	:return
