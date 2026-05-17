#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$ROOT_DIR/ServletProject"

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

mkdir -p "$PROJECT_DIR/WebContent/WEB-INF/classes"

javac -cp "$CATALINA_HOME/lib/servlet-api.jar" \
  -d "$PROJECT_DIR/WebContent/WEB-INF/classes" \
  "$PROJECT_DIR/src/SessionServlet.java"

(
  cd "$PROJECT_DIR"
  jar cvf ServletProject.war -C WebContent . >/dev/null
)

cp "$PROJECT_DIR/ServletProject.war" "$CATALINA_HOME/webapps/"
"$CATALINA_HOME/bin/startup.sh"

echo "Deployed successfully."
echo "Open: http://localhost:8080/ServletProject/index.html"
