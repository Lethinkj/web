# 4th Experiment - Servlet Form Submission with Session Handling

## Aim
Create a Java Servlet application that:
- accepts HTML form submission
- stores user data in session
- displays session information back to the user

## Project Structure
```text
ServletProject/
├── WebContent/
│   ├── index.html
│   └── WEB-INF/
│       ├── web.xml
│       └── classes/          (generated during compile)
└── src/
    └── SessionServlet.java
```

## URL Mapping
- Form submits to: `/SessionServlet`
- Servlet mapping in `web.xml`: `/SessionServlet`

## How to Run (Tomcat 9.x)
Use Tomcat 9 because this project uses `javax.servlet.*`.

### Linux/macOS
1. Compile servlet class into `WEB-INF/classes`
```bash
cd ex4/ServletProject
export CATALINA_HOME=/path/to/apache-tomcat-9
mkdir -p WebContent/WEB-INF/classes
javac -cp "$CATALINA_HOME/lib/servlet-api.jar" -d WebContent/WEB-INF/classes src/SessionServlet.java
```

2. Package as WAR
```bash
jar cvf ServletProject.war -C WebContent .
```

3. Deploy and start Tomcat
```bash
cp ServletProject.war "$CATALINA_HOME/webapps/"
"$CATALINA_HOME/bin/startup.sh"
```

4. Open in browser
```text
http://localhost:8080/ServletProject/index.html
```

### Windows (CMD)
1. Compile servlet class into `WEB-INF\classes`
```bat
cd ex4\ServletProject
set CATALINA_HOME=C:\apache-tomcat-9.0.xx
if not exist WebContent\WEB-INF\classes mkdir WebContent\WEB-INF\classes
javac -cp "%CATALINA_HOME%\lib\servlet-api.jar" -d WebContent\WEB-INF\classes src\SessionServlet.java
```

2. Package as WAR
```bat
jar cvf ServletProject.war -C WebContent .
```

3. Deploy and start Tomcat
```bat
copy ServletProject.war "%CATALINA_HOME%\webapps\"
"%CATALINA_HOME%\bin\startup.bat"
```

4. Open in browser
```text
http://localhost:8080/ServletProject/index.html
```

## Expected Output
After entering a name and submitting:
- `Form Submitted Successfully`
- `Welcome <name>`
- `Session ID : <id>`

## Common Issues
- `HttpServlet not found`: `servlet-api.jar` classpath is missing during compile.
- `404 /SessionServlet`: check servlet mapping in `WEB-INF/web.xml`.
- Blank page/no servlet response: ensure class compiled to `WebContent/WEB-INF/classes`.
- Tomcat 10/11 incompatibility: project uses `javax.servlet.*` (Tomcat 9 recommended).
