@echo OFF

@SETLOCAL

@SET executableName=git.exe
@SET executablePath=%CD%\.git-p
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
        IF ["%%A"]==["--git_exe"] @SET executableName=%%A
        IF ["%%A"]==["--git_portable_path"] @SET executablePath=%%A
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
