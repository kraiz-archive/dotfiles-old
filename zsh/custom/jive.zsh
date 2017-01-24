
function j() {
  PATH=~/tools/oracle_instantcient_11_2:$PATH
  project=$1
  cmd=$2
  if [[ -d ~/code/$1-site ]]; then
    site=~/code/$1-site
  elif [[ -d ~/code/$1/$1-site ]]; then
    site=~/code/$1/$1-site
  fi

  function _build() {
    cd $1
    \cp -rf $1/target/jiveHome/crypto /tmp/
    mvn-color clean package $@[3,-1]
    \cp -rf /tmp/crypto $1/target/jiveHome/
  }

  function _run() {
    cd $1/web
    mvn-color -Pint cargo:start | grcat conf.log4j
  }


  case $cmd in
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
      mvn-color -Psearch exec:java | grcat conf.log4j
      ;;

    "eae")
      cd $site/run-services
      mvn-color -Peae exec:java | grcat conf.log4j
      ;;

    "log")
      while true; do
        if [[ -f $site/target/jiveHome/logs/sbs.log ]]; then
          sbs_pid=`ps aux | grep -v grep | grep cargo:start | awk '{print $2}'`
          grc tail -f --pid=$sbs_pid $site/target/jiveHome/logs/sbs.log 2>/dev/null
          eval printf %.1s '-{1..'"${COLUMNS:-$(tput cols)}"\}; echo
        fi
        sleep 5
      done
      ;;

  esac
}
