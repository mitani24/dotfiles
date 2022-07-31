fpath+=("$(brew --prefix)/share/zsh/site-functions")

autoload -U promptinit; promptinit

zstyle ':prompt:pure:path' color blue
zstyle ':prompt:pure:prompt:success' color blue
zstyle ':prompt:pure:prompt:error' color red

prompt pure
