@echo OFF

@SETLOCAL

@SET ERROR_MESSAGES_GIT_MISSING="git" missing
@SET ERROR_MESSAGES_NPM_MISSING="npm" missing
@SET GIT_CHECKER=lduGitCheckr.bat
@SET GIT_CHECKER_ARGS=
@SET NPM_CHECKER=lduNodejsCheckr.bat
@SET NPM_CHECKER_ARGS=

@SET hasErrors=false
@SET isForce=false


:main()
    GOTO processArgs()
    :end_processArgs
    call %CD%/%GIT_CHECKER% %GIT_CHECKER_ARGS%
    IF %ERRORLEVEL% NEQ 0 (
        IF ["%hasErrors%"]==["false"] @SET hasErrors=true
        @echo %ERROR_MESSAGES_GIT_MISSING%
    )
    call %CD%/%NPM_CHECKER% %NPM_CHECKER_ARGS%
    IF %ERRORLEVEL% NEQ 0 (
        IF ["%hasErrors%"]==["false"] @SET hasErrors=true
        @echo %ERROR_MESSAGES_NPM_MISSING%
    )
    IF ["%hasErrors%"]==["true"] (
        PAUSE
        EXIT /B 1
    )
    GOTO dependencyUpdate()
    :end_dependencyUpdate
    PAUSE
    EXIT /B 0

:processArgs()
    FOR %%A IN (%*) DO (
        IF ["%%A"]==["--force"] @SET isForce=true
    )
    GOTO end_processArgs

:dependencyUpdate()
    call npm prune
    call npm install
    call npm update
    GOTO end_dependencyUpdate
