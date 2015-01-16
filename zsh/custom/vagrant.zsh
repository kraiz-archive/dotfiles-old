alias vs='vagrant ssh'
alias vu='vagrant up'
alias vr='vagrant reload'
alias vh='vagrant halt'
alias vus='vagrant up && vagrant ssh'
alias vrs='vagrant reload && vagrant ssh'
alias vst='vagrant status'

function vdi() {
    vagrant up $1
    vagrant ssh -c "curl -L https://raw.githubusercontent.com/kraiz/dotfiles/master/install | sh"  $1
    vagrant ssh -c "sudo chsh -s /bin/zsh vagrant" $1
}
