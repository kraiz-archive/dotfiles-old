#!/usr/zsh


tmuxjive() {
  tmux split-window -d -t 0 -v
  tmux split-window -d -t 0 -h
  tmux split-window -d -t 2 -v

  tmux send-keys -t 1 "cd code/$1-site" enter
  tmux send-keys -t 1 "j $1 bar" enter

  tmux send-keys -t 2 "htop" enter

  tmux send-keys -t 3 "cd code/$1-site" enter
  tmux send-keys -t 3 "j $1 eae" enter

  tmux send-keys -t 4 "cd code/$1-site" enter
  tmux send-keys -t 4 "j $1 log" enter

  rename-window "$1-run"
}


