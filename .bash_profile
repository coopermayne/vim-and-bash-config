export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/foreman-0.83.0/bin:$PATH"

export NVM_DIR="/Users/cooper/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# for rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#disable C-s
stty -ixon

# ---------------------
# Tab improvements
# ---------------------
 
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind 'TAB: menu-complete'
 
# ---------------------
# History
# ---------------------
 
# Larger bash history (allow 32ÃÂ³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
 
# ---------------------
# Path
# ---------------------
 
# Home brew directories
PATH="/usr/local/bin:$PATH"
# Make sure we're pointing to the Postgres App's psql
export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"
 
# ---------------------
# Vim
# ---------------------
 
# Make vim our editor of choice
export EDITOR='vim'
 
# -----------------------
# Alias
# ------------------------

alias tfa='source ~/Code/tensorflow/bin/activate'
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias lbt='ls -t'
# prompt before deleting!
alias rm="rm -i"
alias c=clear
alias h=history
 
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'


function cs () {
cd "$@" && ls
      }

# ---------------------
# Colors
# ---------------------
 
# Adds colors to LS
export CLICOLOR=1
# http://geoff.greer.fm/lscolors/
export LSCOLORS=bxexcxdxbxegedabagacad
# prompt colors
BLACK="\[\e[0;30m\]"
RED="\033[1;31m"
ORANGE="\033[1;33m"
GREEN="\033[1;32m"
PURPLE="\033[1;35m"
WHITE="\033[1;37m"
YELLOW="\[\e[0;33m\]"
CYAN="\[\e[0;36m\]"
BLUE="\[\e[0;34m\]"
BOLD=""
RESET="\033[m"
 
# -----------------
# Git status in the prompt
# -----------------
 
# Long git to show + ? !
is_git_repo() {
$(git rev-parse --is-inside-work-tree &> /dev/null)
}
is_git_dir() {
$(git rev-parse --is-inside-git-dir 2> /dev/null)
}
get_git_branch() {
local branch_name
# Get the short symbolic ref
branch_name=$(git symbolic-ref --quiet --short HEAD 2> /dev/null) ||
# If HEAD isn't a symbolic ref, get the short SHA
branch_name=$(git rev-parse --short HEAD 2> /dev/null) ||
# Otherwise, just give up
branch_name="(unknown)"
printf $branch_name
}
 
# ---------------------
# Git status information
# ---------------------
prompt_git() {
local git_info git_state uc us ut st
if ! is_git_repo || is_git_dir; then
return 1
fi
git_info=$(get_git_branch)
# Check for uncommitted changes in the index
if ! $(git diff --quiet --ignore-submodules --cached); then
uc="+"
fi
# Check for unstaged changes
if ! $(git diff-files --quiet --ignore-submodules --); then
us="!"
fi
# Check for untracked files
if [ -n "$(git ls-files --others --exclude-standard)" ]; then
ut="${RED}?"
fi
# Check for stashed files
if $(git rev-parse --verify refs/stash &>/dev/null); then
st="$"
fi
git_state=$uc$us$ut$st
# Combine the branch name and state information
if [[ $git_state ]]; then
git_info="$git_info${RESET}[$git_state${RESET}]"
fi
printf "${WHITE} on ${style_branch}${git_info}"
}
 
#----------------------
# style the prompt
# ---------------------
style_user="\[${RESET}${WHITE}\]"
style_path="\[${RESET}${CYAN}\]"
style_chars="\[${RESET}${WHITE}\]"
style_branch="${RED}"
 
# ---------------------
# Build the prompt
# ---------------------
# Example with committed changes: username ~/documents/GA/wdi on master[+]
PS1=""
PS1+="${style_user}\u" # Username
PS1+="${style_path} \w" # Working directory
PS1+="\$(prompt_git)" # Git details
PS1+="\n" # Newline
PS1+="${style_chars}\$ \[${RESET}\]" # $ (and reset color)
 
#[ -r /Users/coopermayne/.bashrc ] && source /Users/coopermayne/.bashrc

#alias tmux="TERM=screen-256color-bce tmux"

alias server="ruby -rsinatra -e'set :public_folder, \".\"; set :port, 4567'"

alias morph="cd ~/Documents/Morphosis/Code/database/morphAPI/"
alias morphf="cd ~/Documents/Morphosis/Code/database/morph_frontend/"

alias now="cd ~/Code/NOW/back"
alias nowf="cd ~/Code/NOW/front"

alias arthur="cd ~/Dropbox/Server/arthureby"

alias ha="history | ack"
alias be="bundle exec"

alias bashe="vim ~/.bash_profile"
alias bashs="source ~/.bash_profile"
alias bashsave="cd ~/Code/vim-and-bash-config && git add . && git cm 'update' && git push"

acp ()
{
  git add -A;git commit -m "$1";git push origin master
}

transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi 
  tmpfile=$( mktemp -t transferXXX )
  if tty -s
  then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g')
    curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile
  else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile
  fi
  cat $tmpfile
  rm -f $tmpfile
  echo -e "\n"
}
