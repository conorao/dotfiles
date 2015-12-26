# Conor Odell
# .bashrc

# Notes:
# - brew install bash-completion
# - Make sure .bashrc is loaded in your .profile on Mac OSX (and others?)

# Autocompletion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# LS colors 
alias ls='ls -G'
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Postgres shortcuts
alias postgres_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start' 
alias postgres_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# Calculate and parse out the current git branch based on the dir you're in.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Coloured prompt
export PS1="\[$(tput bold)\]\[$(tput setaf 4)\][\[$(tput setaf 7)\]\u\[$(tput setaf 4)\]@\[$(tput setaf 5)\]\h \[$(tput setaf 2)\]\W\[$(tput setaf 4)\]:\[$(tput setaf 3)\]\$(parse_git_branch)\[$(tput setaf 4)\]]\\$ \[$(tput sgr0)\]"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Let's make RVM actually work
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
