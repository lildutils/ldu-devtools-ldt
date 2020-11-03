
		:_printAbout
			ECHO ----------
			ECHO About
			ECHO.
			ECHO     LDT version: %LDT_VERSION%
			IF ["%prv_isUseProtableGit%"]==["true"] (
				ECHO     Git available versions: %prv_gitVersions%
				ECHO     Git version: %prv_gitCurrentVersion%
			)
			IF ["%prv_isUseProtableJasypt%"]==["true"] (
				ECHO     Jasypt available versions: %prv_jasyptVersions%
				ECHO     Jasypt version: %prv_jasyptCurrentVersion%
			)
			IF ["%prv_isUseProtableMaven%"]==["true"] (
				ECHO     Maven available versions: %prv_mavenVersions%
				ECHO     Maven version: %prv_mavenCurrentVersion%
			)
			IF ["%prv_isUseProtableMongod%"]==["true"]  (
				ECHO     MongoDB Server available versions: %prv_mongodVersions%
				ECHO     MongoDB Server version: %prv_mongodCurrentVersion%
			)
			IF ["%prv_isUseProtableMysqld%"]==["true"]  (
				ECHO     MySQL Server available versions: %prv_mysqldVersions%
				ECHO     MySQL Server version: %prv_mysqldCurrentVersion%
			)
			IF ["%prv_isUseProtableNodejs%"]==["true"] (
				ECHO     NodeJS available versions: %prv_nodejsVersions%
				ECHO     NodeJS version: %prv_nodejsCurrentVersion%
			)
			IF ["%prv_isUseProtablePhpd%"]==["true"] (
				ECHO     PHP Server available versions: %prv_phpdVersions%
				ECHO     PHP Server version: %prv_phpdCurrentVersion%
			)
			IF ["%prv_isUseProtablePsqld%"]==["true"] (
				ECHO     PostgreSQL Server available versions: %prv_psqldVersions%
				ECHO     PostgreSQL Server version: %prv_psqldCurrentVersion%
			)
			IF ["%prv_isUseProtableXampp%"]==["true"] (
				ECHO     XAMPP available versions: %prv_xamppVersions%
				ECHO     XAMPP version: %prv_xamppCurrentVersion%
			)
			GOTO _awaitCommand
