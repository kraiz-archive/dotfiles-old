
update-debian() {
  sudo aptitude install -y \
    htop iotop tmux git silversearcher-ag \
    build-essential \
    libpq-dev libbz2-dev libsqlite3-dev libncurses5-dev libssl-dev libffi-dev \
    python python-dev python-virtualenv \
    python3 python3-dev python3-virtualenv

  # python version manager and latest python version
  if ! type "pyenv" > /dev/null; then
    curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
    pyenv install -s 3.5.2
    pyenv global 3.5.2
  fi

  # python tool installer
  if ! type "pipsi" > /dev/null; then
    curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python
  fi

  # this helps any further pipsi installs (up2date pip, setuptools, wheel)
  pipsi install virtualenv

  # python based tools
  pipsi install cheat
  pipsi install pgcli
  pipsi install --python `pyenv which python3` bpython
}
