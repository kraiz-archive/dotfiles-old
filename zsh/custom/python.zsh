alias p='python'
alias pm='python manage.py'
alias pmr='python manage.py runserver 0.0.0.0:8000'
alias pmt='python manage.py test'
alias pms='python manage.py shell'
alias pi='pip install'
alias pf='pip freeze'
alias pfg='pip freeze | grep -i'
alias pcl='pip freeze --local | grep -v "^\-e" | cut -d = -f 1 | xargs -n1 -P10 pip uninstall -y'

if [ -d $HOME/.pyenv ]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
