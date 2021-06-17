alias ls="exa"
alias ll="ls -l"
alias chrome='open -a "Google Chrome"'
alias dc="docker-compose"
alias ds="docker-sync"
alias j="z"
alias ghq-create="create-ghq-repository"
alias todo="todoist"
alias todo-work='todoist list --filter="#work"'
alias todo-home='todoist list --filter="#home"'
alias todo-personal='todoist list --filter="#personal"'

zle -N open-ghq-repository
bindkey '^t' open-ghq-repository
bindkey '^g' anyframe-widget-cd-ghq-repository
