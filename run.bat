@echo off
setlocal

SET DOCKER_USER=akilesalreadytaken
SET DOCKER_IMAGE=analog-tools
SET DOCKER_TAG=0.4
SET CONTAINER_NAME=chipathon-tools

SET CALL=call
:parse
    IF /I ""%1""==""""       GOTO run
    IF /I ""%1""==""--help"" GOTO documentation
    IF /I ""%1""==""-h""     GOTO documentation
    IF /I ""%1""==""--dry""  ( SET "CALL=echo" )
    IF /I ""%1""==""-s""     ( SET "CALL=echo" )
    IF /I ""%1""==""--path"" ( SET "DESIGNS=%~2" && SHIFT )
    IF /I ""%1""==""-p""     ( SET "DESIGNS=%~2" && SHIFT )
    IF /I ""%1""==""--clean"" ( GOTO clean_container )
    IF /I ""%1""==""-k""      ( GOTO clean_container )
    SHIFT
    GOTO parse


:documentation
    echo Usage: run.bat %~nx0 [-h^|--help] [-s^|--dry-run] [-p^|--path PATH] [-k^|--clean]
    GOTO end


:run
    :: Set fixed variables
    ::::::::::::::::::::::
    IF NOT DEFINED DESIGNS         SET DESIGNS=%CD%
    CALL :NORMALIZEPATH %DESIGNS%

    IF NOT DEFINED DOCKER_USER     SET DOCKER_USER=akilesalreadytaken
    IF NOT DEFINED DOCKER_IMAGE    SET DOCKER_IMAGE=ic-tools
    IF NOT DEFINED DOCKER_TAG      SET DOCKER_TAG=0.2

    IF NOT DEFINED CONTAINER_USER  SET CONTAINER_USER=1000
    IF NOT DEFINED CONTAINER_GROUP SET CONTAINER_GROUP=1000

    IF NOT DEFINED CONTAINER_NAME  SET CONTAINER_NAME=analog-tools

    IF NOT DEFINED JUPYTER_PORT    SET JUPYTER_PORT=8888

    :: Validate variables
    :::::::::::::::::::::
    IF %CONTAINER_USER% NEQ 0 IF %CONTAINER_USER% LSS 1000 (
        echo WARNING: Selected User ID %CONTAINER_USER% is below 1000. This ID might interfere with User-IDs inside the container and cause undefined behaviour!
    )
    IF %CONTAINER_GROUP% NEQ 0 IF %CONTAINER_GROUP% LSS 1000 (
        echo WARNING: Selected Group ID %CONTAINER_GROUP% is below 1000. This ID might interfere with Group-IDs inside the container and cause undefined behaviour!
    )

    :: Get variables from WSL
    :::::::::::::::::::::::::
    SET WSL_GET_DISPLAY=wsl --exec bash --norc -c "echo $DISPLAY"
    FOR /F "USEBACKQ" %%i IN (`%WSL_GET_DISPLAY%`) DO ( SET "DISPLAY=%%i" )

    SET WSL_GET_WAYLAND_DISPLAY=wsl --exec bash --norc -c "echo $WAYLAND_DISPLAY"
    FOR /F "USEBACKQ" %%i IN (`%WSL_GET_WAYLAND_DISPLAY%`) DO ( SET "WAYLAND_DISPLAY=%%i" )

    :: Validate container existence, reuse
    ::::::::::::::::::::::::::::::::::::::
    docker container inspect %CONTAINER_NAME% 2>&1 | find "Status" | find /i "running"
    IF NOT ERRORLEVEL 1 (
        ECHO Container %CONTAINER_NAME% is running!
        ECHO   Stop with "docker stop %CONTAINER_NAME%"
        ECHO   Remove with "docker rm %CONTAINER_NAME%" if required.
        GOTO attach_shell
    )
    docker container inspect %CONTAINER_NAME% 2>&1 | find "Status" | find /i "exited"
    IF NOT ERRORLEVEL 1 (
        ECHO Container %CONTAINER_NAME% exists.
        ECHO   Restart with "docker start %CONTAINER_NAME%"
        ECHO   Or remove with "docker rm %CONTAINER_NAME%" if required.
        GOTO restart_shell
    )

    echo Container does not exist, creating %CONTAINER_NAME% ...

    :: Set environment, variables and run the container
    ::::::::::::::::::::::::::::::::::::::::::::::::::::
    echo Check requirements
    %CALL% wsl --install Ubuntu --no-launch
    %CALL% wsl --update

    SET PARAMS=%PARAMS% -d
    :: SET PARAMS=%PARAMS% --rm
    SET PARAMS=%PARAMS% --user %CONTAINER_USER%:%CONTAINER_GROUP%
    SET PARAMS=%PARAMS% --name %CONTAINER_NAME%
    SET PARAMS=%PARAMS% --security-opt seccomp=unconfined
    SET PARAMS=%PARAMS% -p "%JUPYTER_PORT%":8888
    SET PARAMS=%PARAMS% -v "%DESIGNS%":/home/designer/shared
    SET PARAMS=%PARAMS% -v \\wsl.localhost\Ubuntu\mnt\wslg:/tmp
    SET PARAMS=%PARAMS% -e DESIGNS=/home/designer/shared
    SET PARAMS=%PARAMS% -e DISPLAY=%DISPLAY%
    SET PARAMS=%PARAMS% -e WAYLAND_DISPLAY=%WAYLAND_DISPLAY%
    SET PARAMS=%PARAMS% -e XDG_RUNTIME_DIR=/mnt/wslg

    SET IMAGE=%DOCKER_USER%/%DOCKER_IMAGE%
    IF DEFINED DOCKER_TAG  SET IMAGE=%IMAGE%:%DOCKER_TAG%

    SET COMMAND=jupyter-lab --no-browser
    SET COMMAND=vncserver -select-de xfce
    SET COMMAND=sleep infinity

    @echo on
    %CALL% docker run %PARAMS% %IMAGE% %COMMAND%
    @echo off

    GOTO attach_shell


:attach_shell
    %CALL% docker exec -it %CONTAINER_NAME% bash
    GOTO end


:restart_shell
    %CALL% docker start %CONTAINER_NAME%
    GOTO attach_shell
    GOTO end


:clean_container
    %CALL% docker stop %CONTAINER_NAME%
    %CALL% docker rm %CONTAINER_NAME%
    GOTO end


:end
    endlocal


:normalizepath
    SET DESIGNS=%~f1
    EXIT /B


:: Get DISPLAY from WSL
::wsl --exec bash --norc -c 'echo $DISPLAY'

:: Get current path of batsh script
::SET BATCH_PATH=%~dpnx0