
function j() {
  project=$1
  cmd=$2
  site=~/code/$1-site

  function _clean() {
    cd $1
    mvn-color clean
  }

  function _build() {
    cd $1
    mvn-color clean package $@[3,-1]
    echo "DELETE FROM jiveproperty WHERE name LIKE '%key.node%';" |
      psql --host=192.168.58.192 \
          --dbname=$(grep ${2}_lakr ~/.m2/settings.xml | grep -Po '(?<=/)[^/]*(?=</)')
  }

  function _run() {
    cd $1/web
    mvn-color -Pint cargo:start
  }


  case $cmd in
    "clean")
      _clean $site
      ;;

    "build")
      _build $site $project
      ;;

    "run")
      _run $site
      ;;

    "bar")
      _build $site $project
      _run $site
      ;;

    "br")
      _build $site $project -pl '!web'
      _run $site
      ;;

    "search")
      cd $site/run-services
      mvn-color -Psearch exec:java -Djava.net.preferIPv4Stack=true
      ;;

    "eae")
      cd $site/run-services
      mvn-color -Peae exec:java
      ;;

    "log")
      while true; do
        tail -f $site/target/jiveHome/logs/sbs.log
        sleep 5
      done
      ;;

  esac
}
