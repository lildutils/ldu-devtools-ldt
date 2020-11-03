
		:_printUsage
			ECHO ----------
			ECHO Usage
			ECHO     (i) windows natives: cd, dir, exit, etc.
			ECHO     (i) library natives: git, mvn, npm, etc.
			ECHO.
			ECHO     %LDT_COMMAND% ^[^<command^> ^<args^>^]
			ECHO            cd /d ^<drive^>:/path/to/dir       Changes the current directory with drive cahnge
			ECHO            %LDT_COMMAND_PRINT_VERSION%^|%LDT_COMMAND_PRINT_VERSION_SHORT%                       Prints the version of 'ldt'
			ECHO            %LDT_COMMAND_PRINT_VERSIONS%^|%LDT_COMMAND_PRINT_VERSIONS_SHORT%                  Prints the versions of 'ldt' library
			ECHO            %LDT_COMMAND_LOAD_CUSTOM_CONFIGS%                             Loads '.ldtconfig' from current location
			ECHO            %LDT_COMMAND_OPEN_NEW_TERMINAL%^|%LDT_COMMAND_OPEN_NEW_TERMINAL_SHORT%                           Starts a new 'ldt' terminal
			ECHO            %LDT_COMMAND_OPEN_GIT_TERMINAL%                              Starts a new 'git' terminal
			ECHO            %LDT_COMMAND_OPEN_NODE_TERMINAL%                             Starts a new 'node' terminal
			ECHO            %LDT_COMMAND_START_APACHE%                     Starts the 'apache' HTTP server
			ECHO            ng-build                      ...Coming soon...
			ECHO            ng-serve                      ...Coming soon...
			ECHO            npm-update                    ...Coming soon...
			GOTO _awaitCommand
