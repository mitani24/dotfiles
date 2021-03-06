function run-task() {
  print -P "%F{cyan}đ $1%f"
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

# ghq įŽĄįãŽãĒãã¸ããĒãæ¤į´ĸããĻã¨ããŖãŋã§éã
function open-ghq-repository() {
  anyframe-source-ghq-repository \
    | anyframe-selector-auto \
    | anyframe-action-execute $EDITOR
}

# ghq ã§ãĒãã¸ããĒãäŊæãã¨ããŖãŋã§éã
function create-ghq-repository() {
  ghq create $argv &&
  $EDITOR `ghq list --full-path -e $argv[1]`
}

# gh ã§ PR ãæ¤į´ĸããĻ web ã§éã
function gh-pr-view() {
  gh pr list $argv \
    | anyframe-selector-auto \
    | awk '{print $1}' \
    | anyframe-action-execute gh pr view --web
}
