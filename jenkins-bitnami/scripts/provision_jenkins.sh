#Latest Release
jenkins_url="${jenkins_url:-http://mirrors.jenkins-ci.org/war/latest/jenkins.war}"

#LTS Jenkins URL
#jenkins_url="${jenkins_url:-http://mirrors.jenkins-ci.org/war-stable/latest/jenkins.war}"
JENKINS_HOME="${JENKINS_HOME:-my_jenkins_home}"
JENKINS_WEB="${JENKINS_WEB:-http://localhost:8080/}"
JENKINS_CLI="${JENKINS_CLI:-java -jar ./jenkins-cli.jar -s ${JENKINS_WEB} -noKeyAuth}"
JENKINS_START="${JENKINS_START:-java -jar jenkins.war}"

#remove trailing slash
JENKINS_WEB="${JENKINS_WEB%/}"
CURL="${CURL:-curl}"

function url_ready() {
  url="$1"
  echo -n "Waiting for ${url} to become available."
  while [ ! "200" = "$(curl -sLiI -w "%{http_code}\\n" -o /dev/null ${url})" ]; do
    echo -n '.'
    sleep 1
  done
  echo 'ready.'
}