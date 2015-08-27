REM environment.bat
REM Modify your DYNAMO_MODULES settings in this file
REM Modify your CLASSPATH, CONFIGPATH, and JAVA_ARGS"
REM settings in the postEnvironment.sh file in your"
REM <ATGCascadedir>/home/localconfig directory."
REM See the VERSION documentation for more information

REM <installed_module>
set DYNAMO_MODULES=%DYNAMO_MODULES%;DSS
REM </installed_module>

set DYNAMO_RMI_PORT=
set DYNAMO_LICENSED_MODULES=
set DYNAMO_CLASSPATH_MODULES=DSS;DSSJ2EEDemo
set CLASSPATH=%CLASSPATH%;%DYNAMO_HOME%\locallib\ojdbc7.jar;