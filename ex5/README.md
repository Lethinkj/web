# Three-Tier JSP & Database Application (Student Management)

## Overview
This is a simple **three-tier web application** perfect for practical exams:
- **Tier 1 (Presentation)**: JSP pages (frontend UI)
- **Tier 2 (Business Logic)**: Servlet + Java classes (StudentServlet, StudentDAO)
- **Tier 3 (Data Access)**: SQLite database (JDBC)

## Features
✅ Add new student  
✅ View all students  
✅ Delete student  
✅ Uses SQLite for easy setup (no separate DB server needed)  
✅ CRUD operations (Create, Read, Delete)  

## How to Run (5th Experiment)

Use **Tomcat 9.x** for this project (`javax.servlet` imports).

### Linux/macOS
1. Add SQLite JDBC driver
```bash
mkdir -p ex5/WEB-INF/lib
curl -L -o ex5/WEB-INF/lib/sqlite-jdbc-3.46.1.3.jar \
  https://repo1.maven.org/maven2/org/xerial/sqlite-jdbc/3.46.1.3/sqlite-jdbc-3.46.1.3.jar
```

2. Compile servlet classes
```bash
cd ex5/WEB-INF/classes
export CATALINA_HOME=/path/to/apache-tomcat-9
javac -cp "$CATALINA_HOME/lib/servlet-api.jar:../lib/*" -d . com/studentapp/*.java
```

3. Package WAR
```bash
cd ../../
jar cvf ex5.war *
```

4. Deploy and start
```bash
cp ex5.war "$CATALINA_HOME/webapps/"
"$CATALINA_HOME/bin/startup.sh"
```

Open:
`http://localhost:8080/ex5/StudentServlet?action=list`

### Windows (CMD) - Added
1. Add SQLite JDBC driver
```bat
cd ex5\WEB-INF
if not exist lib mkdir lib
powershell -Command "Invoke-WebRequest -Uri https://repo1.maven.org/maven2/org/xerial/sqlite-jdbc/3.46.1.3/sqlite-jdbc-3.46.1.3.jar -OutFile lib\sqlite-jdbc-3.46.1.3.jar"
```

2. Compile servlet classes
```bat
cd classes
set CATALINA_HOME=C:\apache-tomcat-9.0.xx
javac -cp "%CATALINA_HOME%\lib\servlet-api.jar;..\lib\*" -d . com\studentapp\*.java
```

3. Package WAR
```bat
cd ..\..
jar cvf ex5.war *
```

4. Deploy and start
```bat
copy ex5.war "%CATALINA_HOME%\webapps\"
"%CATALINA_HOME%\bin\startup.bat"
```

Open:
`http://localhost:8080/ex5/StudentServlet?action=list`

### Quick Alternative (Static Server Only)
```bash
cd ex5
python3 -m http.server 8000
```
This serves only static files. JSP/Servlet will not run without Tomcat.

## File Structure
```
ex5/
├── index.jsp                    (Presentation - Student UI)
├── WEB-INF/
│   ├── classes/
│   │   └── com/studentapp/
│   │       ├── Student.java         (Model - Data structure)
│   │       ├── StudentDAO.java      (Data Access Layer - DB operations)
│   │       └── StudentServlet.java  (Business Logic - Controller)
│   ├── lib/
│   │   └── sqlite-jdbc-3.46.1.3.jar
│   └── web.xml                  (Deployment descriptor)
```

## Database Schema
```sql
CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    course TEXT NOT NULL
);
```

The database is automatically created on first run.

## Exam Tips
- **Explain three tiers**: Presentation (UI) → Business Logic (Processing) → Data Access (Database)
- **Show each file**: Model, DAO, Servlet, JSP
- **Mention CRUD**: Create (Add), Read (View), Update (future), Delete
- **JDBC concepts**: PreparedStatement, Connection, ResultSet
- **Advantages**: Separation of concerns, easy maintenance, scalable

## Common Issues
- **Servlet not found**: Check `WEB-INF/web.xml` mapping (`/StudentServlet`)
- **Tomcat 10/11 errors**: This project uses `javax.servlet.*`; run on Tomcat 9.x
- **Database file not found**: SQLite DB uses relative path (`students.db`) from runtime
- **SQLite driver not found**: Ensure `sqlite-jdbc` JAR is in `WEB-INF/lib/`
- **JSP blank/white page**: Recompile classes and restart Tomcat after code changes

Good luck with your exams! 🚀
