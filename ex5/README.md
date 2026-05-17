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

## How to Run

### 1. Download SQLite JDBC Driver
```bash
cd /home/nobu/Documents/Lab6/web/ex5/WEB-INF/lib/
# Download sqlite-jdbc JAR (e.g., from Maven Central)
wget https://github.com/xerial/sqlite-jdbc/releases/download/3.36.0/sqlite-jdbc-3.36.0.jar
# Or find your Tomcat's lib folder and add it there
```

### 2. Compile Java Classes
```bash
cd /home/nobu/Documents/Lab6/web/ex5/WEB-INF/classes/

# Get servlet-api (replace $CATALINA_HOME with your Tomcat path)
export CATALINA_HOME=/usr/local/tomcat

# Compile all Java files
javac -cp "$CATALINA_HOME/lib/servlet-api.jar" *.java
```

### 3. Package as WAR
```bash
cd /home/nobu/Documents/Lab6/web/ex5/
jar cvf ex5.war *
```

### 4. Deploy to Tomcat
```bash
cp ex5.war $CATALINA_HOME/webapps/

# Start Tomcat
$CATALINA_HOME/bin/startup.sh

# Wait 10 seconds, then open browser:
# http://localhost:8080/ex5/
```

### Quick Alternative (Using Python SimpleHTTPServer + JSP)
Not recommended for production, but for testing:
```bash
cd /home/nobu/Documents/Lab6/web/ex5/
python3 -m http.server 8000
# Open http://localhost:8000/index.jsp
```
(Note: This won't run Java/Servlet; JSP won't execute. You NEED Tomcat for full functionality.)

## File Structure
```
ex5/
├── index.jsp                    (Presentation - Student UI)
├── WEB-INF/
│   ├── classes/
│   │   ├── Student.java         (Model - Data structure)
│   │   ├── StudentDAO.java      (Data Access Layer - DB operations)
│   │   └── StudentServlet.java  (Business Logic - Controller)
│   ├── lib/
│   │   └── sqlite-jdbc-3.36.0.jar
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
- **Servlet not found**: Check web.xml or @WebServlet annotation mapping
- **Database file not found**: Run from Tomcat's working directory; uses relative path
- **SQLite driver not found**: Ensure sqlite-jdbc JAR is in WEB-INF/lib/
- **JSP not rendering**: Make sure you're running in Tomcat, not a static server

Good luck with your exams! 🚀
