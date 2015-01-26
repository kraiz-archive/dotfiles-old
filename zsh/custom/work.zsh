if [[ `hostname` == W4DEUMSY9002036 || `hostname` == W4DEUMSY9000018 ]]; then
    export http_proxy="http://proxy.mms-dresden.de:8080"
    export https_proxy=$http_proxy
    export ftp_proxy=$http_proxy
    
    export VBOX_USER_HOME='C:/Users/lakr/.VirtualBox'
    export VAGRANT_HOME='C:/Users/lakr/.vagrant.d'

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
fi

if [[ "`id -nu`" == "vagrant" && -x ~/virtualenv/bin/pyrun ]]; then
    export PATH=~/virtualenv/bin:$PATH
    export STAGE=vagrant
    cd /vagrant
fi
