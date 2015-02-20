alias p='python'
alias pm='python manage.py'
alias pmr='python manage.py runserver 0.0.0.0:8000'
alias pmt='python manage.py test'
alias pms='python manage.py shell'
alias pi='pip install'
alias pf='pip freeze'
alias pfg='pip freeze | grep -i'

if [ -d $HOME/.pyenv ]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
