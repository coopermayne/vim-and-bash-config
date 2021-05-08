# Config Files Repo

## Install 

install this stuff... 

  - zsh
  - oh-my-zsh
  - neovim (nvim)
    - ruby, python2, python3

## Connect to dotfiles

save this repo to some directory then make symbolic links in the /home/<username>.... 

  - ln -s [path-to-this-repo]/.vimrc ~/.vimrc
  - ln -s [path-to-this-repo]/.bashrc ~/.bashrc
  - ln -s [path-to-this-repo]/.zshrc ~/.zshrc
  - etc.. 

check paths

  - export ZSH="/Users/coopermayne/.oh-my-zsh"
  - check for others: `rg -g '!/.git' --hidden 'export PATH'`
