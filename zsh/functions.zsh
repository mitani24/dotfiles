function run-task() {
  print -P "%F{cyan}👉 $1%f"
  eval $1
}

function upgrade-brew() {
  run-task "brew upgrade"
}

function upgrade-zinit() {
  run-task "zinit self-update" &&
  run-task "zinit update"
}

function update-anyenv() {
  run-task "anyenv update"
}

function upgrade-yarn-global-packages() {
  run-task "yarn global upgrade"
}

function upgrade-npm-global-packages() {
  run-task "npm update -g"
}

function update-gibo() {
  run-task "gibo update"
}

function update-all() {
  upgrade-brew &&
  upgrade-zinit &&
  update-anyenv &&
  update-gibo &&
  upgrade-yarn-global-packages &&
  upgrade-npm-global-packages
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
