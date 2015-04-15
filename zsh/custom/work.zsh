if [[ `hostname` == W4DEUMSY9002036 || `hostname` == W4DEUMSY9000018 ]]; then
    export http_proxy="http://proxy.mms-dresden.de:8080"
    export https_proxy=$http_proxy
    export ftp_proxy=$http_proxy
    
    export VBOX_USER_HOME='C:/Develop/VMs'
    export VAGRANT_HOME='C:/Develop/VMs/.vagrant.d'

    alias poedit="/cygdrive/c/Program\ Files\ \(x86\)/Poedit/Poedit.exe"

    vms() {
        tmux send-keys 'vagrant ssh app -- -t "cd /usr/local/*suite*; mediasuite/bin/manage runserver 8000" ";" exec /bin/bash' C-m
        tmux split-window -c "$PWD"
        tmux send-keys 'vagrant ssh app -- -t "cd /usr/local/*suite*; mediasuite/bin/manage runcelery -Bv2 worker" ";" exec /bin/bash' C-m
        tmux split-window -c "$PWD"
        tmux send-keys 'vagrant ssh app -- -t "cd /var/local/*suite*; tail -f \$(find mediasuite/ -name *.log)" ";" exec /bin/bash' C-m
    }
    vws() {
        tmux send-keys 'vagrant ssh app -- -t "cd /usr/local/*suite*; webcastsuite/bin/manage runserver 8100" ";" exec /bin/bash' C-m
        tmux split-window -c "$PWD"
        tmux send-keys 'vagrant ssh app -- -t "cd /usr/local/*suite*; webcastsuite/bin/manage runcelery -Bv2 worker" ";" exec /bin/bash' C-m
        tmux split-window -c "$PWD"
        tmux send-keys 'vagrant ssh app -- -t "cd /var/local/*suite*; tail -f \$(find webcastsuite/ -name *.log)" ";" exec /bin/bash' C-m
    }
    vwsi() {
        tmux send-keys 'vagrant ssh dmz -- -t "cd /usr/local/*suite*; wsi/bin/manage runserver 8200" ";" exec /bin/bash' C-m
        tmux split-window -c "$PWD"
        tmux send-keys 'vagrant ssh dmz -- -t "cd /var/local/*suite*; tail -f \$(find wsi/ -name *.log)" ";" exec /bin/bash' C-m
    }
    
    rup() {
        for DIR in $(find . -mindepth 1 -maxdepth 1 -type d); do
            cd $DIR
            echo "Updating $DIR ..."
            if [[ -d '.git' ]]; then
                git pull
            elif [[ -d '.svn' ]]; then
                svn up
            fi
            cd ..
        done
    }
fi

if [[ "`id -nu`" == "vagrant" ]]; then
    alias msm="/usr/local/*/mediasuite/bin/manage"
    alias wsm="/usr/local/*/webcastsuite/bin/manage"
    alias wsim="/usr/local/*/wsi/bin/manage"
    
    alias msr="msm runserver 8000"
    alias msc="msm runcelery worker -BQ celery -l info --autoreload"
    alias wsr="wsm runserver 8100"
    alias msc="wsm runcelery worker -BQ celery,highprio -l info --autoreload"
    alias wsir="wsim runserver 8200"

    if [[ -x /opt/python/bin/python ]]; then
        export PATH=/opt/python/bin:$PATH
    fi
    if [[ -x ~/virtualenv/bin/pyrun ]]; then
        export PATH=~/virtualenv/bin:$PATH
    fi
    export STAGE=vagrant
    cd /vagrant
fi
