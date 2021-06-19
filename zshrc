### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit light zdharma/history-search-multi-word
zinit load mollifier/anyframe

zinit ice wait"0" lucid atload'
    zstyle ":notify:*" command-complete-timeout 15
    zstyle ":notify:*" success-title "Command finished (in #{time_elapsed} seconds)"
    zstyle ":notify:*" error-title "Command failed (in #{time_elapsed} seconds)"
    zstyle ":notify:*" success-sound "CardAccepted"
    zstyle ":notify:*" error-sound "CardDenied"
    zstyle ":notify:*" always-notify-on-failure no'
zinit load marzocchi/zsh-notify

# import fragment files
ZSH_HOME="${HOME}/.zsh"
source ${ZSH_HOME}/env.zsh
source ${ZSH_HOME}/pure.zsh
source ${ZSH_HOME}/anyenv.zsh
source ${ZSH_HOME}/direnv.zsh
source ${ZSH_HOME}/gh-completion.zsh
source ${ZSH_HOME}/z.zsh
source ${ZSH_HOME}/todoist.zsh
source ${ZSH_HOME}/functions.zsh
source ${ZSH_HOME}/alias.zsh
