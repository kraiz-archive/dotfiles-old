if [[ `hostname` == W4DEUMSY9002036 || `hostname` == W4DEUMSY9000018 ]]; then
    export http_proxy="http://proxy.mms-dresden.de:8080"
    export https_proxy=$http_proxy
    export ftp_proxy=$http_proxy
    
    export VBOX_USER_HOME='C:/Develop/VMs'
    export VAGRANT_HOME='C:/Develop/VMs/.vagrant.d'
    export CHECKOUT_ROOT='C:/Develop/code'

    alias poedit="/cygdrive/c/Program\ Files\ \(x86\)/Poedit/Poedit.exe"
    
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

    alias msr="while true; do msm runserver 8000; sleep 0.25; done"
    alias msc="msm runcelery worker -BQ celery -l info --autoreload --autoscale=6,3"
    alias wsr="while true; do wsm runserver 8100; sleep 0.2; done"
    alias wsc="wsm runcelery worker -BQ celery,highprio -l info --autoreload --autoscale=8,4"
    alias wsir="while true; do wsim runserver 8200; sleep 0.2; done"
    
    alias msp="/usr/local/*/mediasuite/bin/pip"
    alias wsp="/usr/local/*/webcastsuite/bin/pip"
    alias wsip="/usr/local/*/wsi/bin/pip"
    alias sv="/usr/local/*/supervisor/bin/supervisorctl"

    if [[ -x /opt/python/bin/python ]]; then
        export PATH=/opt/python/bin:$PATH
    fi
    if [[ -x ~/virtualenv/bin/pyrun ]]; then
        export PATH=~/virtualenv/bin:$PATH
    fi
    export STAGE=vagrant
    cd /vagrant
fi
