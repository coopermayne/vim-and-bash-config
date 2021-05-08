 "Plugins 

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')
"  fuzzy finder - best plugin
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" collection of colorschemes  
Plug 'rafi/awesome-vim-colorschemes'

" snippets 
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"syntax 
Plug 'sheerun/vim-polyglot'
Plug 'godlygeek/tabular'
"Plug 'leafgarland/typescript-vim'
"Plug 'hail2u/vim-css3-syntax'
"Plug 'digitaltoad/vim-pug'
"Plug 'vim-ruby/vim-ruby'
"Plug 'jelera/vim-javascript-syntax'
"Plug 'pangloss/vim-javascript'
"Plug 'scrooloose/syntastic'
"Plug 'mattn/emmet-vim'

"helpers 
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/splitjoin.vim'
"nav 
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
"Plug 'airblade/vim-gitgutter'
Plug 'Lokaltog/vim-easymotion'

"utils 
Plug 'tpope/vim-fugitive'   "access Git in vim
Plug 'tpope/vim-eunuch'     "simple file commands
Plug 'ConradIrwin/vim-bracketed-paste'
"Plug 'nathanaelkane/vim-indent-guides'

call plug#end() "plugins must be above this line

set rtp-=~/.vim/after 
set rtp+=~/.vim/after



" Looks 

colorscheme dogrun
"colorscheme molokai

set wrap linebreak 
set nolist

let mapleader = ","

nnoremap <C-a> :bp<CR>
nnoremap <C-s> :bn<CR>

set tags=./tags;

" Features 
"
set nocompatible
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent on

if has("autocmd")
  filetype plugin indent on
endif

" Enable syntax highlighting
syntax on


"------------------------------------------------------------
" Must have options 
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

set title
set nobackup
set noswapfile

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options 
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Get vim to respect spaces when using gf command
set isfname+=32

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
"set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

"------------------------------------------------------------
" Indentation options 
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
set shiftwidth=2
set tabstop=2


"------------------------------------------------------------
" Random 1 
"
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
set nohlsearch
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
"nnoremap <Tab> za
"
"edit and source vimrc file 
let vimrc_loc = "~/Code/vim-and-bash-config/.vimrc"

command! Evim execute "edit " . vimrc_loc
command! Svim execute "source " . vimrc_loc

" Source the vimrc file after saving it
"if has("autocmd")
  "autocmd bufwritepost .vimrc source $MYVIMRC
"endif
"
" Remember info about open buffers on close 
set viminfo^=% 
"
"get rid of a buffer... or all buffers.... 
nnoremap <leader>bd :bdelete<cr>
nnoremap <leader>ba :%bd<CR> 

"better copy and paste function 
vnoremap <C-c> "+y
"map <C-v> "+p

" format the statusline 
set statusline=\CWD:\ %r%{getcwd()}%h\ \ \ %{fugitive#statusline()} 
set statusline+=%=%f%m%r%h\ %w

"yankring history 
"nnoremap <leader>p :reg<CR>

"split lines 
nnoremap <silent> <leader><CR> i<CR><ESC>

"set minimum space between cursor and start or end of displayed lines 
set so=4

"search results... 
nnoremap <C-N> :cnext<CR> 
nnoremap <C-P> :cprev<CR> 

" Switch CWD to the directory of the open buffer 
nnoremap <leader>cd :lcd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files (You want this!) 
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" DISABLEDautocmd BufNewFile,BufReadPost *.txt set filetype=markdown 
"open file browser in current dir and in vertical split 
"nnoremap <leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>
nnoremap <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>

nnoremap <leader>q :wq<CR>

" nerdtree 
nnoremap <F1> :NERDTreeToggle<CR>

" skip to end of line while in insert mode 
inoremap <C-L> <esc>$a
inoremap <C-A> <esc>^i

" create new line while in insert mode (for favascript functions) 
imap <C-c> <CR><CR><Esc>kS 

" turn hybrid line numbers on 
:set number relativenumber
:set nu rnu

" insert date 
inoremap <leader>d <C-r>=strftime('%D %l:%M%P')<cr>
inoremap <leader>D <C-r>=strftime('%D')<cr>
" spelling 
nnoremap <leader>s :setlocal spell! spelllang=en_us<cr>

" -----------------------------------------------------------------------------
" FZF file nav 
" -----------------------------------------------------------------------------
" b = buffers
nnoremap 'b  :Buffers<cr>
nnoremap 's  :BLine<cr>

" b = buffers
nnoremap 'h  :History<cr>

nnoremap <c-k>  :FZF<cr>

" g = grep (ripgrep) (in current dir)
nnoremap 'g  :Rg<cr>

imap <c-x><c-f> <plug>(fzf-complete-path)

" this will FZF for word under cursor - used for notes with ids when linking
" TODO maybe add another <cr> to the end to open the file
"nnoremap <expr> 'f ':FZF<cr>'.expand('<cword>')

noremap H ^
noremap L g_

" Letters 
"map! <C-v>GA Γ
"map! <C-v>DE Δ
"map! <C-v>TH Θ
"map! <C-v>LA Λ
"map! <C-v>XI Ξ
"map! <C-v>PI Π
"map! <C-v>SI Σ
"map! <C-v>PH Φ
"map! <C-v>PS Ψ
"map! <C-v>OM Ω
"map! <C-v>al α
"map! <C-v>be β
"map! <C-v>ga γ
"map! <C-v>de δ
"map! <C-v>ep ε
"map! <C-v>ze ζ
"map! <C-v>et η
"map! <C-v>th θ
"map! <C-v>io ι
"map! <C-v>ka κ
"map! <C-v>la λ
"map! <C-v>mu μ
"map! <C-v>xi ξ
"map! <C-v>pi π
"map! <C-v>rh ρ
"map! <C-v>si σ
"map! <C-v>ta τ
"map! <C-v>ps ψ
"map! <C-v>om ω
"map! <C-v>ph ϕ
"" Math 
map! <C-v>ll →
"map! <C-v>hh ⇌
"map! <C-v>kk ↑
"map! <C-v>jj ↓
"map! <C-v>= ∝
"map! <C-v>~ ≈
"map! <C-v>!= ≠
"map! <C-v>!> ⇸
"map! <C-v>~> ↝
"map! <C-v>>= ≥
"map! <C-v><= ≤
"map! <C-v>0  °
"map! <C-v>ce ¢
map! <C-v>*  •
"map! <C-v>co ⌘
"" Subscript and Superscript 
"inoremap <leader>1 ~1~
"inoremap <leader>2 ~2~
"inoremap <leader>3 ~3~
"inoremap <leader>4 ~4~
"inoremap <leader>5 ~5~
"inoremap <leader>6 ~6~
"inoremap <leader>7 ~7~
"inoremap <leader>8 ~8~
"inoremap <leader>9 ~9~
"inoremap <leader>== ^+^
"inoremap <leader>=2 ^2+^
"inoremap <leader>=3 ^3+^
"inoremap <leader>-- ^-^
"inoremap <leader>-2 ^2-^
"inoremap <leader>-3 ^3-^

" Folding 
"set foldenable
"set foldmethod=expand

set foldenable
set foldlevelstart=0
"let g:markdown_fold_style = 'nested'
"let g:markdown_folding = 1

autocmd FileType vim set foldmethod=marker

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>" "right next to c-n
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

nnoremap gO :!open <cfile><CR>

"highlight overlength lines
"autocmd FileType markdown highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"autocmd FileType markdown match OverLength /\%81v.\+/

highlight ColorColumn ctermbg=darkgray
set colorcolumn=80

command! -nargs=1 AddExt execute "saveas ".expand("%:p").<q-args>
command! -nargs=1 ChgExt execute "saveas ".expand("%:p:r").<q-args>

"nnoremap <leader>zl :FZF ~/Dropbox/Notebook<cr>
