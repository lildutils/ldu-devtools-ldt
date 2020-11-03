@echo OFF

@SETLOCAL

@SET executableName=npm.cmd
@SET executablePath=%CD%\.npm
@SET isFound=


:main()
    GOTO processArgs()
    :end_processArgs
    GOTO check()
    :end_check
    IF NOT DEFINED isFound GOTO searchPortable()
    :end_searchPortable
    EXIT /B 0

:processArgs()
    FOR %%A IN (%*) DO (
        IF ["%%A"]==["--npm_cmd"] @SET executableName=%%A
        IF ["%%A"]==["--npm_portable_path"] @SET executablePath=%%A
    )
    GOTO end_processArgs

:check()
    FOR %%X IN (%executableName%) DO (
        IF NOT DEFINED isFound @SET isFound=%%~$PATH:X
    )
    GOTO end_check

:searchPortable()
    IF NOT EXIST "%executablePath%" (
        EXIT /B 1
    )
    GOTO end_searchPortable
