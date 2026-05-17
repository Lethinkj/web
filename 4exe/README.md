# 4exe - Windows Run Guide

This folder is independent from `ex4`.

## Prerequisites
- JDK installed (Java 8/11 recommended)
- Apache Tomcat 9.x extracted (required for `javax.servlet`)
- `javac` and `java` available in Command Prompt

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
cd 4exe
run.bat
```

## Open in Browser
`http://localhost:8080/ServletProject/index.html`

## What `run.bat` Does
- Compiles `SessionServlet.java`
- Creates `ServletProject.war`
- Copies WAR to `%CATALINA_HOME%\webapps`
- Starts Tomcat

## Common Errors
- `CATALINA_HOME is not set`: run the `set CATALINA_HOME=...` command again.
- `javac is not recognized`: install JDK and add `bin` to PATH.
- `servlet-api.jar not found`: verify Tomcat 9 is installed correctly.
