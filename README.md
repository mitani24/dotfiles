# dotfiles

## Preparation

1. [HomeBrew](https://brew.sh/index_ja) をインストール
2. `brew install rcm`

## Installation

リポジトリをクローンします。\
リポジトリは `$HOME/.dotfiles` に展開されます。

```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/mitani24/dotfiles/main/install.sh)"
```

## Creating symlinks

`.dotfiles/rcrc` を設定としてシンボリックリンクを作成します。

```sh
env RCRC=$HOME/.dotfiles/rcrc rcup
```

## Setup

必要なファイルをインストールします。

```sh
dotfiles/setup.sh
```

## Installation HomeBrew packages

`~/.Brewfile` に基づいて HomeBrew パッケージをインストールします。

```sh
brew bundle --global
```
