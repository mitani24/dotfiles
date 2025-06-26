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

# gemini-prompt: 汎用的な gemini CLI プロンプトラッパー関数
# 使用法: gemini-prompt "プロンプトテンプレート" [入力テキスト]
# プロンプトテンプレート内で {{TEXT}} を使用すると入力テキストが挿入される
gemini-prompt() {
  local PROMPT_TEMPLATE="$1"
  shift
  local TEXT_TO_PROCESS

  # テキストの取得: 引数があればそれを使い、なければ標準入力から読み込む
  if (( $# > 0 )); then
    TEXT_TO_PROCESS="$@"
  else
    TEXT_TO_PROCESS=$(cat -)
  fi

  # プロンプトテンプレート内の {{TEXT}} を実際のテキストに置換
  local FINAL_PROMPT="${PROMPT_TEMPLATE//\{\{TEXT\}\}/$TEXT_TO_PROCESS}"

  # gemini を実行
  gemini -p "$FINAL_PROMPT"
}

# revise: テキストを修正する gemini CLI ラッパー関数
# 引数があればそれを修正対象とし、なければ標準入力から読み込む
revise() {
  local PROMPT_TEMPLATE=$(cat <<'EOF'
# 命令

あなたはプロの編集者です。
以下の文章を、より明確で、簡潔で、理解しやすくなるように修正してください。

# 制約条件

- 誤字脱字や文法的な誤りを修正してください。
- 文章の構成や流れを改善してください。
- 元の文章の意図やニュアンスは維持してください。
- 新しい情報を付け加えないでください。
- 修正後の文章だけを出力してください。

# 対象の文章

---
{{TEXT}}
---
EOF
)

  gemini-prompt "$PROMPT_TEMPLATE" "$@"
}

# translate: テキストを自動検出して英語⇔日本語で翻訳する
translate() {
  local PROMPT_TEMPLATE='以下の文章を分析して、日本語なら英語に、英語なら日本語に翻訳してください。翻訳結果のみを出力してください。

{{TEXT}}'

  gemini-prompt "$PROMPT_TEMPLATE" "$@"
}

# summarize: テキストを要約する
summarize() {
  local PROMPT_TEMPLATE='以下の文章を3〜5行で要約してください。重要なポイントを箇条書きで整理してください。

{{TEXT}}'

  gemini-prompt "$PROMPT_TEMPLATE" "$@"
}

# explain: 専門用語や概念を分かりやすく説明する
explain() {
  local PROMPT_TEMPLATE='以下の内容について、初心者にも分かりやすく説明してください。具体例を交えて説明してください。

{{TEXT}}'

  gemini-prompt "$PROMPT_TEMPLATE" "$@"
}

# improve-writing: 文章の品質を向上させる
improve-writing() {
  local PROMPT_TEMPLATE='以下の文章をより読みやすく、論理的で説得力のある文章に改善してください。

{{TEXT}}'

  gemini-prompt "$PROMPT_TEMPLATE" "$@"
}

# generate-commit-message: git diff から コミットメッセージを生成する
generate-commit-message() {
  local GIT_DIFF
  if (( $# > 0 )); then
    GIT_DIFF="$@"
  else
    GIT_DIFF=$(git diff --cached)
  fi

  local PROMPT_TEMPLATE='以下のgit diffから適切なコミットメッセージを生成してください。
Conventional Commits形式（feat:, fix:, docs:, style:, refactor:, test:, chore: など）で作成してください。
簡潔で分かりやすいメッセージにしてください。

```diff
{{TEXT}}
```'

  echo "$GIT_DIFF" | gemini-prompt "$PROMPT_TEMPLATE"
}
