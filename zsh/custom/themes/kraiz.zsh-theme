# directory info
local current_dir='${PWD/#$HOME/~}'

# git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}[%{$reset_color%}git:%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}x"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}o"

# python version and env info
export VIRTUAL_ENV_DISABLE_PROMPT=1
function virtualenv_prompt_info {
  if [ $VIRTUAL_ENV ]; then
    echo "%{$fg[cyan]%}(%{$fg[white]%}"`basename $VIRTUAL_ENV`"%{$fg[cyan]%})"
  fi
}
local virtualenv_info='$(virtualenv_prompt_info)'

# the actual prompt
PROMPT="
%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$fg[cyan]%}%n \
%{$fg[green]%}@ \
%{$fg[magenta]%}$(hostname): \
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${git_info} \
${virtualenv_info}
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"
