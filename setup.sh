#!/bin/bash

link () {
  echo "$PROMPT This utility will symlink all dotfiles in this directory to your home directory."
  echo "$PROMPT Proceed? (y/n)"
  read resp
  if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
    for file in $( ls -A | grep -vE '\.exclude*|\.git$|\.gitignore|.*.md' ) ; do
      ln -sfv "$PWD/$file" "$HOME"
    done
    echo "$PROMPT Symlinking complete"
  else
    echo "$PROMPT Symlinking cancelled by user"
    return 1
  fi

  echo "$PROMPT Setting global .gitignore"
  git config --global core.excludesfile "$PWD/.gitignore"
  echo "$PROMPT Global .gitignore set successfully."

  echo "$PROMPT Done."
}

link
