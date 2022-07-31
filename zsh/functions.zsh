function run-task() {
  print -P "%F{cyan}👉 $1%f"
  eval $1
}

function update-brew() {
  if type brew > /dev/null 2>&1; then
    run-task "brew update"
    run-task "brew upgrade"
  fi
}

function update-zinit() {
  if type zinit > /dev/null 2>&1; then
    run-task "zinit self-update" &&
    run-task "zinit update"
  fi
}

function update-anyenv() {
  if type anyenv > /dev/null 2>&1; then
    run-task "anyenv update"
  fi
}

function update-yarn-global-packages() {
  if type yarn > /dev/null 2>&1; then
    run-task "yarn global upgrade"
  fi
}

function update-npm-global-packages() {
  if type npm > /dev/null 2>&1; then
    run-task "npm update -g"
  fi
}

function update-gibo() {
  if type gibo > /dev/null 2>&1; then
    run-task "gibo update"
  fi
}

function update-all() {
  update-brew &&
  update-zinit &&
  update-anyenv &&
  update-gibo &&
  update-yarn-global-packages &&
  update-npm-global-packages
}

# ghq 管理のリポジトリを検索してエディタで開く
function open-ghq-repository() {
  anyframe-source-ghq-repository \
    | anyframe-selector-auto \
    | anyframe-action-execute $EDITOR
}

# ghq でリポジトリを作成しエディタで開く
function create-ghq-repository() {
  ghq create $argv &&
  $EDITOR `ghq list --full-path -e $argv[1]`
}

# gh で PR を検索して web で開く
function gh-pr-view() {
  gh pr list $argv \
    | anyframe-selector-auto \
    | awk '{print $1}' \
    | anyframe-action-execute gh pr view --web
}
