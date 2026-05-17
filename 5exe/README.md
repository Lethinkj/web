# 5exe - Windows Run Guide

This folder is independent from `ex5`.

## Prerequisites
- JDK installed (Java 8/11 recommended)
- Apache Tomcat 9.x extracted (required for `javax.servlet`)
- `javac` and `java` available in Command Prompt
- Internet for first run (script downloads SQLite JDBC jar automatically)

## Run on Windows (CMD)
1. Open **Command Prompt**.
2. Go to your project:
```bat
cd C:\path\to\web
```
3. Set Tomcat path:
```bat
set CATALINA_HOME=C:\apache-tomcat-9.0.xx
```
4. Run the experiment:
```bat
cd 5exe
run.bat
```

## Open in Browser
`http://localhost:8080/ex5/StudentServlet?action=list`

## What `run.bat` Does
- Downloads `sqlite-jdbc-3.46.1.3.jar` on first run
- Compiles Java classes in `WEB-INF\classes\com\studentapp`
- Creates `ex5.war`
- Copies WAR to `%CATALINA_HOME%\webapps`
- Starts Tomcat

## Common Errors
- `CATALINA_HOME is not set`: run the `set CATALINA_HOME=...` command again.
- `javac is not recognized`: install JDK and add `bin` to PATH.
- JDBC jar download failed: download manually and place in `5exe\WEB-INF\lib\`.
