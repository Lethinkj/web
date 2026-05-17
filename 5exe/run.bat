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
set "LIB_DIR=%ROOT_DIR%WEB-INF\lib"
set "CLASS_DIR=%ROOT_DIR%WEB-INF\classes"
set "SQLITE_JAR=%LIB_DIR%\sqlite-jdbc-3.46.1.3.jar"

if not exist "%LIB_DIR%" mkdir "%LIB_DIR%"

if not exist "%SQLITE_JAR%" (
  echo Downloading SQLite JDBC driver...
  powershell -Command "Invoke-WebRequest -Uri https://repo1.maven.org/maven2/org/xerial/sqlite-jdbc/3.46.1.3/sqlite-jdbc-3.46.1.3.jar -OutFile '%SQLITE_JAR%'"
  if errorlevel 1 exit /b 1
)

javac -cp "%CATALINA_HOME%\lib\servlet-api.jar;%LIB_DIR%\*" -d "%CLASS_DIR%" "%CLASS_DIR%\com\studentapp\*.java"
if errorlevel 1 exit /b 1

pushd "%ROOT_DIR%"
jar cvf ex5.war index.jsp WEB-INF >nul
if errorlevel 1 (
  popd
  exit /b 1
)
popd

copy /Y "%ROOT_DIR%ex5.war" "%CATALINA_HOME%\webapps\" >nul
if errorlevel 1 exit /b 1

call "%CATALINA_HOME%\bin\startup.bat"

echo Deployed successfully.
echo Open: http://localhost:8080/ex5/StudentServlet?action=list
endlocal
