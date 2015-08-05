set PROJECT_NAME=WIND

REM set your path to WIND project
set WIND_PROJECT_PATH=D:\_work\dreamcloud\%PROJECT_NAME%

call mklink /D %ATG_ROOT%\WIND %WIND_PROJECT_PATH%
pause