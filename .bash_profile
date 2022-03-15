# Conor Odell | github.com/conorao

# Notes:
# - brew install bash-completion
# - brew install git bash-completion

# Load private configuration (whatever you don't want checked into Git for example)
source .private

# Autocompletion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Load default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# Aliases
alias ls='ls -G'
alias screen="/usr/local/bin/screen"

# Calculate and parse out the current git branch based on the dir you're in.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Colored prompt
export PS1="\[$(tput bold)\]\[$(tput setaf 4)\][\[$(tput setaf 7)\]\u\[$(tput setaf 4)\]@\[$(tput setaf 5)\]\h \[$(tput setaf 2)\]\W\[$(tput setaf 4)\]:\[$(tput setaf 3)\]\$(parse_git_branch)\[$(tput setaf 4)\]]\\$ \[$(tput sgr0)\]"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# More path manipulation, rbenv
export PATH="/usr/local/sbin:$PATH"
eval "$(rbenv init -)"
export PATH="/usr/local/opt/libxml2/bin:$PATH"

# Silence zsh nag on Catalina
export BASH_SILENCE_DEPRECATION_WARNING=1

# Set default editor
export EDITOR="sublime"
