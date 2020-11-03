@ECHO off

:main
    SETLOCAL ENABLEDELAYEDEXPANSION
    SET confirmMklink=N
    SET confirmJavaHome=N

        CLS
        TITLE LDutils Developer Tools - SETUP
        SET /P confirmMklink="1) Do you want to set a different library folder? (y/N): "
        SET /P confirmJavaHome="2) Do you want to setup JAVA_HOME into PATH? (y/N): "
        ECHO.
        ECHO --------------------------------------
        ECHO | SET /P="INF: setup starting"
        REM TIMEOUT /T 1 /NOBREAK > nul
        ECHO | SET /P="."
        REM TIMEOUT /T 1 /NOBREAK > nul
        ECHO | SET /P="."
        TIMEOUT /T 1 /NOBREAK > nul
        ECHO .
        IF ["%confirmMklink%"]==["y"] (
            ECHO INF: please give the external library path
            ECHO | SET /P="lib --> "
            SET /P libraryPath=
        )
        IF ["%confirmJavaHome%"]==["y"] (
            ECHO INF: please choose a java version
            ECHO 1^) jdk1.8.0_201
            ECHO 2^) jre1.8.0_201
            ECHO | SET /P="choice: "
            SET /P selectedJavaVersion=
        )
        ECHO | SET /P="INF: processing"
        REM TIMEOUT /T 1 /NOBREAK > nul
        ECHO | SET /P="."
        TIMEOUT /T 1 /NOBREAK > nul
        ECHO | SET /P="."
        REM TIMEOUT /T 1 /NOBREAK > nul
        ECHO .
        IF ["%confirmMklink%"]==["y"] MKLINK /J "%CD%\lib" "%libraryPath%\"
        IF ["%selectedJavaVersion%"]==["1"] SET selectedJavaVersion=jdk1.8.0_201
        IF ["%selectedJavaVersion%"]==["2"] SET selectedJavaVersion=jre1.8.0_201
        IF ["%confirmJavaHome%"]==["y"] (
            SETX PATH %CD%\lib\java\%selectedJavaVersion%\bin\
            ECHO prv_javaUseItPortable=false >> %~dp0conf\ldt-cmd.ini
        )
        ECHO INF: setup finished
        ECHO --------------------------------------

    :return
        TIMEOUT /T 3 /NOBREAK > nul
        ENDLOCAL
        CALL CMD /K "DEL /F /Q %CD%\%~n0.bat && EXIT"
        EXIT
