set PROJECT_NAME=WIND

#set your path to WIND project
set WIND_PROJECT_PATH=D:\_work\cognity\%PROJECT_NAME%

call mklink /D %ATG_ROOT%\WIND %WIND_PROJECT_PATH%
pause