@echo off
setlocal

if "%CATALINA_HOME%"=="" (
  echo Error: CATALINA_HOME is not set.
  echo Example: set CATALINA_HOME=C:\apache-tomcat-9.0.xx
  exit /b 1
)

if not exist "%CATALINA_HOME%\lib\servlet-api.jar" (
  echo Error: servlet-api.jar not found in %CATALINA_HOME%\lib
  echo Use Tomcat 9.x for javax.servlet projects.
  exit /b 1
)

set "ROOT_DIR=%~dp0"
set "PROJECT_DIR=%ROOT_DIR%ServletProject"

if not exist "%PROJECT_DIR%\WebContent\WEB-INF\classes" mkdir "%PROJECT_DIR%\WebContent\WEB-INF\classes"

javac -cp "%CATALINA_HOME%\lib\servlet-api.jar" -d "%PROJECT_DIR%\WebContent\WEB-INF\classes" "%PROJECT_DIR%\src\SessionServlet.java"
if errorlevel 1 exit /b 1

pushd "%PROJECT_DIR%"
jar cvf ServletProject.war -C WebContent . >nul
if errorlevel 1 (
  popd
  exit /b 1
)
popd

copy /Y "%PROJECT_DIR%\ServletProject.war" "%CATALINA_HOME%\webapps\" >nul
if errorlevel 1 exit /b 1

call "%CATALINA_HOME%\bin\startup.bat"

echo Deployed successfully.
echo Open: http://localhost:8080/ServletProject/index.html
endlocal
