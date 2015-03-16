alias vs='vagrant ssh'
alias vu='vagrant up'
alias vr='vagrant reload'
alias vh='vagrant halt'
alias vd='vagrant destroy'
alias vst='vagrant status'

function vus() {
    vagrant up $1
    vagrant ssh $1
}

function vrs() {
    vagrant reload $1
    vagrant ssh $1
}

function vdi() {
    vagrant ssh -c "curl -L https://raw.githubusercontent.com/kraiz/dotfiles/master/install | sh"  $1
    vagrant ssh -c "sudo chsh -s /bin/zsh vagrant" $1
    
    vagrant ssh -c "sudo tee /etc/yum.repos.d/wandisco-svn.repo <<EOF
[WandiscoSVN]
name=Wandisco SVN Repo
baseurl=http://opensource.wandisco.com/centos/6/svn-1.8/RPMS/\$basearch/
enabled=1
gpgcheck=0
EOF
" > /dev/null
}

function vddi() {
    vagrant destroy -f $1
    vagrant up $1
    vdi $1
    vagrant ssh $1
}
