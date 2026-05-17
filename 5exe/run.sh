#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
LIB_DIR="$ROOT_DIR/WEB-INF/lib"
CLASS_DIR="$ROOT_DIR/WEB-INF/classes"
SQLITE_JAR="$LIB_DIR/sqlite-jdbc-3.46.1.3.jar"
SQLITE_URL="https://repo1.maven.org/maven2/org/xerial/sqlite-jdbc/3.46.1.3/sqlite-jdbc-3.46.1.3.jar"

if [[ -z "${CATALINA_HOME:-}" ]]; then
  echo "Error: CATALINA_HOME is not set."
  echo "Example: export CATALINA_HOME=/path/to/apache-tomcat-9"
  exit 1
fi

if [[ ! -f "$CATALINA_HOME/lib/servlet-api.jar" ]]; then
  echo "Error: servlet-api.jar not found in $CATALINA_HOME/lib"
  echo "Use Tomcat 9.x for javax.servlet projects."
  exit 1
fi

mkdir -p "$LIB_DIR"

if [[ ! -f "$SQLITE_JAR" ]]; then
  echo "Downloading SQLite JDBC driver..."
  curl -fsSL "$SQLITE_URL" -o "$SQLITE_JAR"
fi

javac -cp "$CATALINA_HOME/lib/servlet-api.jar:$LIB_DIR/*" \
  -d "$CLASS_DIR" \
  "$CLASS_DIR/com/studentapp/"*.java

(
  cd "$ROOT_DIR"
  jar cvf ex5.war index.jsp WEB-INF >/dev/null
)

cp "$ROOT_DIR/ex5.war" "$CATALINA_HOME/webapps/"
"$CATALINA_HOME/bin/startup.sh"

echo "Deployed successfully."
echo "Open: http://localhost:8080/ex5/StudentServlet?action=list"
