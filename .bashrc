# # Adds colors to LS
# export CLICOLOR=1
# # http://geoff.greer.fm/lscolors/
# export LSCOLORS=bxexcxdxbxegedabagacad
# # prompt colors
# BLACK="\[\e[0;30m\]"
# RED="\033[1;31m"
# ORANGE="\033[1;33m"
# GREEN="\033[1;32m"
# PURPLE="\033[1;35m"
# WHITE="\033[1;37m"
# YELLOW="\[\e[0;33m\]"
# CYAN="\[\e[0;36m\]"
# BLUE="\[\e[0;34m\]"
# BOLD=""
# RESET="\033[m"
 
# # -----------------
# # Git status in the prompt
# # -----------------
 
# # Long git to show + ? !
# is_git_repo() {
#   $(git rev-parse --is-inside-work-tree &> /dev/null)
# }
# is_git_dir() {
#   $(git rev-parse --is-inside-git-dir 2> /dev/null)
# }
# get_git_branch() {
#   local branch_name
#   # Get the short symbolic ref
#   branch_name=$(git symbolic-ref --quiet --short HEAD 2> /dev/null) ||
#     # If HEAD isn't a symbolic ref, get the short SHA
#   branch_name=$(git rev-parse --short HEAD 2> /dev/null) ||
#     # Otherwise, just give up
#   branch_name="(unknown)"
#   printf $branch_name
# }

# # ---------------------
# # Git status information
# # ---------------------
# prompt_git() {
#   local git_info git_state uc us ut st
#   if ! is_git_repo || is_git_dir; then
#     return 1
#   fi
#   git_info=$(get_git_branch)
#   # Check for uncommitted changes in the index
#   if ! $(git diff --quiet --ignore-submodules --cached); then
#     uc="+"
#   fi
#   # Check for unstaged changes
#   if ! $(git diff-files --quiet --ignore-submodules --); then
#     us="!"
#   fi
#   # Check for untracked files
#   if [ -n "$(git ls-files --others --exclude-standard)" ]; then
#     ut="${RED}?"
#   fi
#   # Check for stashed files
#   if $(git rev-parse --verify refs/stash &>/dev/null); then
#     st="$"
#   fi
#   git_state=$uc$us$ut$st
#   # Combine the branch name and state information
#   if [[ $git_state ]]; then
#     git_info="$git_info${RESET}[$git_state${RESET}]"
#   fi
#   printf "${WHITE} on ${style_branch}${git_info}"
# }

# #----------------------
# # style the prompt
# # ---------------------
# style_user="\[${RESET}${WHITE}\]"
# style_path="\[${RESET}${CYAN}\]"
# style_chars="\[${RESET}${WHITE}\]"
# style_branch="${RED}"
 
# # ---------------------
# # Build the prompt
# # ---------------------
# # Example with committed changes: username ~/documents/GA/wdi on master[+]
# PS1=""
# PS1+="${style_user}\u" # Username
# PS1+="${style_path} \w" # Working directory
# PS1+="\$(prompt_git)" # Git details
# PS1+="\n" # Newline
# PS1+="${style_chars}\$ \[${RESET}\]" # $ (and reset color)

function parse_git_dirty {
[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=3000
HISTFILESIZE=5000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
# We have color support; assume it's compliant with Ecma-48
# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
# a case would tend to support setf rather than setaf.)
color_prompt=yes
    else
color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ [\033[0m\]$(parse_git_branch)\$ '
#PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ $(parse_git_branch) \n$ '

else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='[\D{%H:%M} \w ]$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -t'

# Add an "alert" alias for long running commands. Use like so:
# sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

alias c=clear
alias h=history
alias editbash="vim ~/.bashrc"
if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
export TERM=xterm-256color
fi

TERM=xterm-256color


alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ack='ack-grep'

export RBENV_ROOT="${HOME}/.rbenv"
if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi

bind 'set completion-ignore-case on'
#bind 'set show-all-if-ambiguous on'
bind 'TAB: menu-complete'

alias rm="rm -i"

#cd ~/GA_WDI/

PATH=/opt/extras.ubuntu.com/uberwriter/bin/:$PATH


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PG_USERNAME="postgres"
export PG_PASSWORD="home3232"

export TEMPLATE="-d postgresql -m https://gist.github.com/coopermayne/7041175/raw/913c38ca6b1bea484ed4c09868111e4c59e56768/template.rb"
