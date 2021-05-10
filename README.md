# Config Files Repo

## Install 

install this stuff... 

  - zsh
  - oh-my-zsh
  - neovim (nvim)
    - ruby, python2, python3
    - install vim-plug
      - `sh -c 'curl -fLo "${$HOME/.config}"/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
      - `echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after \nlet &packpath = &runtimepath \nsource ~/Code/vim-and-bash-config/.vimrc" > $HOME/.config/nvim/init.vim`

## Connect to dotfiles

save this repo to some directory then make symbolic links in the /home/<username>.... 

  - `ln -s [path-to-this-repo]/.bashrc ~/.bashrc`
  - `ln -s [path-to-this-repo]/.zshrc ~/.zshrc`
  - etc.. 

check paths

  - `export ZSH="/Users/coopermayne/.oh-my-zsh"`
  - check for others: `rg -g '!/.git' --hidden 'export PATH'`
