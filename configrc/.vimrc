"
" Syd Salmon's Vim Configuration
"
" GLOBAL
filetype plugin indent on   " enable plugin detection,indent, syntax highlights
set confirm                 " confirm changes [Yes, No, Cancel] instead of error
set gcr=a:blinkon0          " disable cursor blink
set gdefault                " substitute all matches in a line
set hlsearch!               " toggle highlight search results
set ignorecase              " enable case-insensitive search
set incsearch               " show search results while typing
set linebreak               " enable line break at words; requires: wrap
set rtp+=/usr/local/opt/fzf " enable interactive command-line fuzzy finder/filter
set showbreak=-->           " enable line break prefix
set showmatch               " highlight matching braces
set smartcase               " enable smart-case search
set textwidth=120           " enable line wrap, columns
set title                   " enable title in terminal
set visualbell              " enable visual bell, no beep
set wrap                    " wrap lines
set wrapscan                " wrap when search reaches start/end of file
syntax on                   " enable syntax highlighting

" SPELLCHECK
set complete+=kspell             " enable word completion; triggers: ^n/^p
set spell! spelllang=en_ca,en_us " enable spellcheck; Canadian, American
set spell!                       " toggle spellcheck, off

" UNDERLINE SPELLCHECK RESULTS
augroup SpellUnderline
  autocmd!
  autocmd ColorScheme *
    \ highlight SpellBad
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellCap
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellLocal
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellRare
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  augroup END

" HYBRID LINE NUMBERS
set number relativenumber " enable hybrid line numbers

" TABS
set autoindent    " auto-indent new lines
set expandtab     " use spaces instead of tabs
set smartindent   " enable smart-indent
set smarttab      " enable smart-tabs
set shiftwidth=2  " set auto-indent spaces
set softtabstop=2 " set cursor movement for <Tab> keystroke
set tabstop=2     " set spaces per tab

" COPY & PASTE
set clipboard=unnamed " enable copy to clipboard

" ADVANCED
runtime macros/matchit.vim         " enable extended % matching
set autoread                       " reload files, if changed outside vim
set backspace=indent,eol,start     " set backspace behaviour
set hidden                         " hide buffers instead of closing them
set history=1000                   " set maximum items in command history
set listchars=tab:>-,trail:·,eol:$ " define white space characters
set mouse=a                        " enable mouse
set ruler                          " show row and column ruler information
set showcmd                        " show incomplete commands in status line
set showmode                       " show current mode in status line
set statusline+=%f                 " show file in status line
set undolevels=1000                " set maximum undo level 

" KEY MAPS
noremap <C-e> 3<C-e>
noremap <C-y> 3<C-y>
nmap <silent> <leader>; :set spell!<CR>
nmap <silent> <leader>s :set nolist!<CR>
nnoremap <silent><Space> :nohlsearch<Bar>:echo<CR>
let mapleader="'"
" move screen down/up three lines:     ^e/^y
" toggle spellcheck/show white space:  '; / 's
" clear search highlighting:           <Space>
" set leader to apostrophe (')

" SWAP AND BACKUP FILES
set backupdir=~/.vim_tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim_tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" COMPLETION
set wildignore+=*.gem " ignore the following tab completion items:
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*DS_Store*
set wildignore+=*sass-cache*
set wildignore+=*vim/backups*
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=vendor/cache/**
set wildignore+=vendor/rails/**
set wildignore=*.o,*.obj,*~
set wildmenu " enable ^n and ^p to scroll thru matches
set wildmode=list:longest

" SCROLLING
set scrolloff=8 " start scrolling 8 lines away from margins
set sidescroll=1
set sidescrolloff=15

" PLUGINS
"" Automatic Installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

"" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

"" Load plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()

""  Set plugin options
""" Airline
let g:airline#extensions#tabline#enabled = 1 " show active buffers in top status bar
let g:airline_powerline_fonts = 1            " load powerline symbols
let g:airline_theme='dark'                   " enable dark-mode theme

""" Markdown
set foldenable! " toggle folding, vim-markdown

" REFERENCES
"" https://gist.github.com/joegoggins/8482408
"" https://items.sjbach.com/319/configuring-vim-right.html
"" https://nvie.com/posts/how-i-boosted-my-vim/
"" https://vimconfig.com
"" https://www.shortcutfoo.com/blog/top-49-vim-configuration-options"
