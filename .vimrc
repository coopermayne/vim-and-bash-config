" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
"YR messing up the @ binding... maybe this will fix
"Plugin 'vim-scripts/YankRing.vim'
"Plugin 'Rename'
"Plugin 'mileszs/ack.vim'
"Plugin 'rizzatti/dash.vim'
"Plugin 'mattn/webapi-vim'
"Plugin 'mattn/gist-vim'
"Plugin 'repeat.vim'
"Plugin 'loremipsum'
"Plugin 'msanders/snipmate.vim'
"Plugin 'thoughtbot/vim-rspec'
"Plugin 'tpope/vim-rails'
"Plugin 'tpope/vim-endwise'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Townk/vim-autoclose'
"Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-fugitive' "access Git in vim
Plugin 'tpope/vim-surround'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'rizzatti/funcoo.vim'
"Plugin 'kchmck/vim-coffee-script'
Plugin 'croaker/mustang-vim'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="normal"
let g:UltiSnipsSnippetDir="~/Code/vim-and-bash-config/UltiSnips"

" ==============================

colorscheme mustang

set foldmethod=indent

"
set wrap linebreak nolist

let mapleader = ","
"
"grep through directory
set grepprg=ack
nnoremap <C-a> :bp<CR>
nnoremap <C-s> :bn<CR>

"Description A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.
set tags=./tags;
"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
filetype plugin on
filetype indent on

" Enable syntax highlighting
syntax on


"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

set title
set nobackup
set noswapfile

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" highlight the current line
set cursorline

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to continue
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=2
"set tabstop=2


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-J> :nohl<CR><C-J>
"              on this file is still a good idea.
"------------------------------------------------------------
set history=1000
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set ssop-=options
"
"save all buffers....
nnoremap <leader>w :wa<Enter>
"
"speed up scrolling speed...
nnoremap <C-E> 3<C-E>
nnoremap <C-Y> 3<C-Y>
inoremap jj <Esc>
inoremap <C-[> <Esc>
nnoremap <Space> /
"
"edit and source vimrc file
command! Evim :e $MYVIMRC
command! Svim :so $MYVIMRC
"
" Remember info about open buffers on close
set viminfo^=% 
"
"get rid of a buffer... or all buffers....
nnoremap <leader>bd :bdelete<cr>
nnoremap <leader>ba :%bd<CR> 
"

set statusline=\CWD:\ %r%{getcwd()}%h\ \ \ %{fugitive#statusline()} 
set statusline+=%=%f%m%r%h\ %w

"yankring history
nnoremap <leader>p :YRShow<CR>

"split lines
nnoremap <silent> <leader><CR> i<CR><ESC>

"set minimum space between cursor and start or end of displayed lines
set so=4

"search results...
"nnoremap <F6> :cp<cr>
"nnoremap <F8> :cn<cr>

" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :lcd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

"
"
"open file browser in current dir and in vertical split
nnoremap <leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>
nnoremap <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>

nnoremap <leader>q :wq<CR>

"setting relative number or reg number
nnoremap <leader>nr :set relativenumber<CR>
nnoremap <leader>nn :set norelativenumber<CR>

autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

nnoremap <leader>r :!ruby %<CR>

"fuzzy finder -- awesome
set runtimepath^=~/.vim/bundle/ctrlp.vim
"finds the last .git and uses that as root
"
"let g:loaded_ctrlp=0
let g:ctrlp_map = '<c-k>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode=0
command! RecentFiles :CtrlPMRUFiles<CR>

"cut to clipboard
vnoremap <leader>c "+y

nnoremap <C-h> :wincmd h<CR>
nnoremap <C-l> :wincmd l<CR>

"RSpec shortcuts
nnoremap <Leader>f :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>d call RunLastSpec()<CR>
nnoremap <Leader>a :call RunAllSpecs()<CR>

nnoremap <F1> :NERDTreeToggle<CR>

"skip to end of line while in insert mode
inoremap <C-l> <esc>$a
"create new line while in insert mode
inoremap <C-CR> <CR><CR><esc>kS

vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
