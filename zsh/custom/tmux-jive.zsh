#!/usr/zsh


tmuxjive() {
  tmux split-window -d -t 0 -v
  tmux split-window -d -t 0 -h
  tmux split-window -d -t 2 -v
  tmux split-window -d -t 2 -v
  tmux split-window -d -t 1 -v

  tmux send-keys -t 1 "htop" enter

  tmux send-keys -t 2 "cd code/$1-site" enter
  tmux send-keys -t 2 "j $1 bar" enter

  tmux send-keys -t 3 "cd code/$1-site/themes/src/main/themes/$1-theme/styles" enter
  tmux send-keys -t 3 "npm start" enter

  tmux send-keys -t 4 "cd code/$1-site" enter
  tmux send-keys -t 4 "j $1 eae" enter

  tmux send-keys -t 5 "cd code/$1-site" enter
  tmux send-keys -t 5 "j $1 search" enter

  tmux send-keys -t 6 "cd code/$1-site" enter
  tmux send-keys -t 6 "j $1 log" enter

  tmux rename-window "$1-run"
}


