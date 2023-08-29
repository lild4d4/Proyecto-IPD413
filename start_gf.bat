@echo off

SETLOCAL

:: jupyter | vnc | xserver | none
SET DEFAULT_SCRIPT=jupyter

:: GF | SKYA | SKYB
SET DEFAULT_PDK=GF

IF "%1"=="jupyter" ( SET "SCRIPTNAME=jupyter" ) ELSE ^
IF "%1"=="vnc"     ( SET "SCRIPTNAME=vnc"     ) ELSE ^
IF "%1"=="x"       ( SET "SCRIPTNAME=xserver" ) ELSE ^
IF "%1"=="none"    ( SET "SCRIPTNAME=none"    ) ELSE ^
IF "%1"==""        ( SET "SCRIPTNAME=%DEFAULT_SCRIPT%"    ) ELSE ^
echo The script doesnt exist; CALL :help



IF "%2"=="gf"    ( SET "DOCKER_EXTRA_PARAMS=-e USING=GF"   ) ELSE ^
IF "%2"=="sky-a" ( SET "DOCKER_EXTRA_PARAMS=-e USING=SKYA" ) ELSE ^
IF "%2"=="sky-b" ( SET "DOCKER_EXTRA_PARAMS=-e USING=SKYB" ) ELSE ^
IF "%2"==""      ( SET "DOCKER_EXTRA_PARAMS=-e USING=%DEFAULT_PDK%"   ) ELSE ^
echo The pdk doesnt exist; CALL :help

echo Running start_%SCRIPTNAME%.bat

::SET CONTAINER_NAME=analog-tools_%SCRIPTNAME%
::SET DOCKER_EXTRA_PARAMS=%DOCKER_EXTRA_PARAMS% -e DISPLAY=host.docker.internal:0

::@REM sudo docker build -t xclock -f Dockerfile.xclock .
::@REM sudo docker run -it 
::@REM   -v /tmp/.X11-unix:/tmp/.X11-unix
::@REM   -v /mnt/wslg:/mnt/wslg
::@REM   -e DISPLAY=$DISPLAY
::@REM   -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY
::@REM   -e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR
::@REM   -e PULSE_SERVER=$PULSE_SERVER xclock

SET WSL_PATH=\\wsl.localhost\Ubuntu\mnt\wslg

SET DOCKER_EXTRA_PARAMS=%DOCKER_EXTRA_PARAMS% -v %WSL_PATH%:/tmp
SET DOCKER_EXTRA_PARAMS=%DOCKER_EXTRA_PARAMS% -e DISPLAY=:0

::SET DOCKER_USER=akilesalreadytaken
::SET DOCKER_IMAGE=analog-tools
::SET DOCKER_TAG=0.3
SET DOCKER_TAG=2023.08

SET DESIGNS=%CD%

.\.scripts\start_%SCRIPTNAME%.bat

exit

:help
  echo Help:
  echo .\start.bat ^<script^> [pdk]
  echo   script: Specific functionality to be enabled. {x ^| vnc ^| jupyter}
  echo   pdk: One of the available. {gf ^| sky-a ^| sky-b}
EXIT /B 0
