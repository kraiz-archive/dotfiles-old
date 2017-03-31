#!/usr/zsh


tmuxjive() {
  tmux split-window -d -t 0 -v
  tmux split-window -d -t 0 -h
  tmux split-window -d -t 2 -v
  tmux split-window -d -t 2 -v
  tmux split-window -d -t 1 -v

  tmux send-keys -t 1 "htop" enter

  tmux send-keys -t 2 "cd ~/code/$1-site 2>/dev/null|| cd ~/code/$1/$1-site" enter
  tmux send-keys -t 2 "j $1 bar" enter

  tmux send-keys -t 3 "cd ~/code/$1-site/themes/src/main/themes/$1-theme/styles" enter
  tmux send-keys -t 3 "npm start" enter

  tmux send-keys -t 4 "cd ~/code/$1-site 2>/dev/null|| cd ~/code/$1/$1-site" enter
  tmux send-keys -t 4 "j $1 eae" enter

  tmux send-keys -t 5 "cd ~/code/$1-site 2>/dev/null|| cd ~/code/$1/$1-site" enter
  tmux send-keys -t 5 "j $1 search" enter

  tmux send-keys -t 6 "cd ~/code/$1-site 2>/dev/null|| cd ~/code/$1/$1-site" enter
  tmux send-keys -t 6 "j $1 log" enter

  tmux rename-window "$1-run"
}


tmuxteco() {
  tmux split-window -d -t 0 -v
  tmux split-window -d -t 0 -h
  tmux split-window -d -t 2 -v
  tmux split-window -d -t 2 -v
  tmux split-window -d -t 1 -v

  tmux send-keys -t 1 "htop" enter

  tmux send-keys -t 2 "cd ~/code/j4e/plugin-parent/teco-extension-plugin && mvn-color clean package && cd ~/code/j4e/teco-site/web && mvn-color -Pint cargo:start | grcat conf.log4j" enter

  tmux send-keys -t 3 "cd ~/code/j4e/teco-site/themes/src/main/themes/dev-theme/src" enter
  tmux send-keys -t 3 "gulp" enter

  tmux send-keys -t 4 "cd ~/code/j4e/teco-site/run-services" enter
  tmux send-keys -t 4 "mvn-color -P eae exec:java | grcat conf.log4j" enter

  tmux send-keys -t 5 "cd ~/code/j4e/teco-site/run-services" enter
  tmux send-keys -t 5 "mvn-color -P search exec:java | grcat conf.log4j" enter

  tmux send-keys -t 6 "tail -f ~/code/j4e/teco-site/target/jiveHome/logs/sbs.log  | grcat conf.log4j" enter

  tmux rename-window "teco-run"
}


tmuxthc() {
  tmux split-window -d -t 0 -v -p 20
  tmux split-window -d -t 2 -h -p 75

  tmux send-keys -t 1 "cd ~/code/lisupp" enter
  tmux send-keys -t 1 "vim -c NERDTreeToggle" enter

  tmux send-keys -t 2 "cd ~/code/lisupp" enter
  tmux send-keys -t 2 "git status" enter

  tmux send-keys -t 3 "cd ~/code/lisupp/design/scss" enter
  tmux send-keys -t 3 "./sass.sh" enter

  tmux rename-window "thc"
}


tmuxkraiz() {
  tmux split-window -d -t 0 -v -p 20
  tmux split-window -d -t 2 -h

  tmux send-keys -t 1 "pyenv activate kraiz-de" enter
  tmux send-keys -t 1 "cd code/kraiz-de" enter
  tmux send-keys -t 1 "vim -c NERDTreeToggle" enter

  tmux send-keys -t 2 "pyenv activate kraiz-de" enter
  tmux send-keys -t 2 "cd code/kraiz-de" enter
  tmux send-keys -t 2 "git status" enter

  tmux send-keys -t 3 "pyenv activate kraiz-de" enter
  tmux send-keys -t 3 "cd code/kraiz-de" enter
  tmux send-keys -t 3 "make run" enter

  tmux rename-window "kraiz-de"
}
