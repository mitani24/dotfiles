alias ls="eza"
alias grep="rg"
alias ll="ls -l"
alias chrome='open -a "Google Chrome"'
alias dc="docker compose"
alias ds="docker-sync"
alias j="z"
alias ghq-create="create-ghq-repository"
alias todo="todoist"
alias todo-work='todoist list --filter="#work"'
alias todo-home='todoist list --filter="#home"'
alias todo-personal='todoist list --filter="#personal"'
alias co="anyframe-widget-checkout-git-branch"
alias y="yarn"
alias yw="yarn workspace"
alias relogin="exec $SHELL -l"
alias pn="pnpm"

# Cateras
alias cgen="yw bff codegen:local && yw frontend codegen:local"
alias cgens="yw bff-setup codegen:local && yw frontend-setup codegen:local"
alias clog="dc logs -f"
alias cupf="dc up -d frontend swagger_ui_api good_job s3mock && clog"
alias cupfm="dc up -d frontend swagger_ui_api good_job s3mock mock-backend && clog"
alias cups="dc up -d frontend-setup swagger_ui_setup good_job s3mock && clog"
alias cupsm="dc up -d frontend-setup swagger_ui_setup good_job s3mock mock-backend-setup && clog"
alias cupa="dc up -d && clog"
alias cinit="y bundle && y migrate:reset && y seed"
alias cdepdev="git push --force origin HEAD:deploy/dev"
alias ctoken='auth0 test token "0PZDDaUulV5cknOh1nqykJucQ1mjgAJB" -a https://api.jobaria-dev.cloud/api/ --force -s "profile" --json | jq -r ".access_token"'

# Tools
alias difit="npx difit --port 5000"
alias ccu="npx ccusage"
alias ccv="PORT=5001 npx @kimuson/claude-code-viewer"

zle -N open-ghq-repository
bindkey '^t' open-ghq-repository
bindkey '^g' anyframe-widget-cd-ghq-repository
