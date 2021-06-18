#!/bin/bash

cd `dirname $0`
DOT_DIR=`pwd`
INSTALL_DIR="$HOME"
EXCLUSIONS=(".git" ".DS_Store")

is-excluded() {
  local file=$1
  for exclusion in "${EXCLUSIONS[@]}"
  do
    [[ "$file" == "$exclusion" ]] && return 0
  done
  return 1
}

create-link() {
  local file=$1
  local config_dir=$2
  local from_dir="$DOT_DIR"
  local to_dir="$INSTALL_DIR"

  if [ -n "$config_dir" ]; then
    from_dir="$from_dir/$config_dir"
    to_dir="$to_dir/$config_dir"
    mkdir -p "$to_dir"
  fi

  ln -snfv "$from_dir/$file" "$to_dir/$file"
}

create-dir-links() {
  local back_dir=`pwd`
  local config_dir=$1
  cd "$DOT_DIR/$config_dir"

  for f in *
  do
    if [ -d $f ]; then
      create-dir-links "$config_dir/$f"
    else
      create-link "$f" "$config_dir"
    fi
  done

  cd "$back_dir"
}

for f in .??*
do
  is-excluded $f && continue

  if [ -d $f ]; then
    create-dir-links "$f"
  else
    create-link "$f"
  fi
done
