#!/bin/bash

link () {
  echo "$PROMPT This utility will symlink the files in this repo to the home directory"
  echo "$PROMPT Proceed? (y/n)"
  read resp
  # TODO - regex here?
  if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
    for file in $( ls -A | grep -vE '\.exclude*|\.git$|\.gitignore|.*.md' ) ; do
      ln -sv "$PWD/$file" "$HOME"
    done
    # TODO: source files here?
    echo "$PROMPT Symlinking complete"
  else
    echo "$PROMPT Symlinking cancelled by user"
    return 1
  fi
}

link
