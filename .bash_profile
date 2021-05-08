# ---------------------
# History
# ---------------------
 
# Larger bash history (allow 32ÃÂ³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE

# -----------------------
# FZF key bindings
# ------------------------

#Use vi keymapping in bash, allowing you manipulate text on the command line as you would in vi.
#bind -m vi TODO
 
bind "\C-v" nvim\n
bind "\C-n" cd ~/Dropbox/Notebook\nvim -c :FZF\n

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


recent() {
  find ~/Dropbox/Notebook -type f -name "*.md" -mtime -$1 -exec vim "{}" +
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
