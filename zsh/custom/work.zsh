if [[ `hostname` == W4DEUMSY9002036 ]]; then
    export http_proxy="http://proxy.mms-dresden.de:8080"
    export https_proxy=$http_proxy
    export ftp_proxy=$http_proxy
    
    alias poedit="/cygdrive/c/Program\ Files\ \(x86\)/Poedit/Poedit.exe"
fi
