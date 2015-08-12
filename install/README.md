1. Set environment variables:
	JAVA_HOME=@YOUR PATH TO JDK@
	ATG_ROOT=@YOUR PATH TO ATG INSTALL DIR@
	ATGJRE=%JAVA_HOME%\bin\java
	DYNAMO_HOME=D:\_work\devlibs\ATG\ATG11.1\home\
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
5. Create schemas in DB for Production, Publishing, Agent, Switching A, Switching B.
6. Run cim.bat in command line
   Oracle Commerce Core Commerce 
   Oracle Commerce REST 
   Oracle Commerce Site Administration 
   Content Administration
   Oracle Commerce Service Center & 
   Oracle Commerce Platform with Endeca Integration
   Choose products like a in the list above and complete steps with create schemas and importing data.
7. Create directory D:\Oracle\Middleware\user_projects\domains\base_domain\ATG-data
8. Copy from /install/servers directory to D:\Oracle\Middleware\user_projects\domains\base_domain\ATG-data
9. Copy D:\_work\devlibs\ATG\ATG11.1\DAS\lib\protocol.jar to D:\Oracle\Middleware\user_projects\domains\base_domain\lib
10. Configure weblogic server
    Create datasources and add D:\Oracle\Middleware\user_projects\domains\base_domain\lib\protocol.jar
    to Server Start -> Classpath area.
    Add arguments for each server:
	
	Production:
	-Xms1024m -Xmx2048m -Djava.rmi.server.hostname=localhost -Datg.dynamo.data-dir=D:\Oracle\Middleware\user_projects\domains\base_domain\ATG-data -Datg.dynamo.server.name=atg-production -Ddisable.atg.dynamo.log=true -Dweblogic.Stdout=D:\Oracle\Middleware\user_projects\domains\base_domain\ATG-data\atg-production\logs\atg-production.out
	
	Publishing:
	-Xms1024m -Xmx2048m -Djava.rmi.server.hostname=localhost -Datg.dynamo.data-dir=D:\Oracle\Middleware\user_projects\domains\base_domain\ATG-data -Datg.dynamo.server.name=atg-publishing -Ddisable.atg.dynamo.log=true -Dweblogic.Stdout=D:\Oracle\Middleware\user_projects\domains\base_domain\ATG-data\atg-publishing\logs\atg-publishing.out
     
	Agent:	 
	-Xms1024m -Xmx2048m -Djava.rmi.server.hostname=localhost -Datg.dynamo.data-dir=D:\Oracle\Middleware\user_projects\domains\base_domain\ATG-data -Datg.dynamo.server.name=atg-agent -Ddisable.atg.dynamo.log=true -Dweblogic.Stdout=D:\Oracle\Middleware\user_projects\domains\base_domain\ATG-data\atg-agent\logs\atg-agent.out

11. Install and configure Endeca environment.
12. Create Endeca application from wind-store-template located in WIND.Storefront module

	D:\Oracle\Endeca\ToolsAndFrameworks\11.1.0\deployment_template\bin>deploy.bat --app ..\..\reference\wind-store-template\deploy.xml


