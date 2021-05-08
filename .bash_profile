# ---------------------
# History
# ---------------------
 
# Larger bash history (allow 32ÃÂ³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE

# -----------------------
# Alias
# ------------------------

alias bashe="vim ~/.zshrc"
alias bashs="source ~/.zshrc"

# -----------------------
# Functions
# ------------------------

acp ()
{
  git add -A;git commit -m "$1";git push origin master
}

# -----------------------
# Source nd Export
# ------------------------

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/Users/coopermayne/Downloads:$PATH"


source "$HOME/.bashrc"
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
