1. Set environment variables:
	JAVA_HOME=@YOUR PATH TO JDK@
	ATG_ROOT=@YOUR PATH TO ATG INSTALL DIR@
	ATGJRE=%JAVA_HOME%\bin\java
	DYNAMO_HOME=%ATG_ROOT%\home\
	PATH=...%ATG_ROOT%\home\bin
2. Create symbolic link:
   Change variable value WIND_PROJECT_PATH=@YOU_PATH_TO_PROJECT@%PROJECT_NAME% create_project_sym_link.bat 	
   Run as administrator create_project_sym_link.bat
3. Add the classpath variable ATG in Eclipse(Preferences->Java->Build Path->Classpath variables) and point to ATG_ROOT
4. Build script tasks:
	clean
	cleanEars
	:Storefront:build
	generateClassesJars
	generateConfigJars
	generateResourcesJars
	assembleAllEars
5. Create tables manually
	<ATG11dir>/DAS/sql/install/database-vendor
	<ATG11dir>/DPS/sql/install/database-vendor
	<ATG11dir>/DPS/sql/install/database-vendor
	<ATG11dir>/DCS/sql/install/database-vendor

