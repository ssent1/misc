set number                               " Show line numbers
set linebreak                            " Break lines at word (requires Wrap lines)
set showbreak=+++                        " Wrap-broken line prefix
set textwidth=120                        " Line wrap (number of cols)
set wrap                                 " Wrap lines
set showmatch                            " Highlight matching brace
" set spell                              " Enable spell-checking
set visualbell                           " Use visual bell (no beeping)
set gcr=a:blinkon0                       " Disable cursor blink

set hlsearch!                            " Toggle highlight search results...
nnoremap <F3> :set hlsearch!<CR>         " Set F3 to toggle search highlighting
set incsearch                            " ...dynamically as they are typed.
set smartcase                            " Enable smart-case search
set ignorecase                           " Always case-insensitive
set gdefault                             " Always substitute all matches in a line
set rtp+=/usr/local/opt/fzf              " interactive command-line fuzzy finder/filter
set autoindent                           " Auto-indent new lines
set expandtab                            " Use spaces instead of tabs
set shiftwidth=4                         " Number of auto-indent spaces
set smartindent                          " Enable smart-indent
set smarttab                             " Enable smart-tabs
set softtabstop=4                        " Number of spaces per Tab

syntax on                                " Turn on syntax highlighting
filetype on                              " File-type highlighting and configuration
filetype plugin on
filetype indent on

set title                                " Set the terminal title

" Cut & Paste
set clipboard=unnamed                    " enable copy to clipboard

" Advanced
set mouse=a                              " activate mouse
set autoread                             " Reload files changed outside vim
set ruler                                " Show row and column ruler information
set showcmd                              " Show incomplete cmds down the bottom
set showmode                             " Show current mode down the bottom
set statusline+=%F                       " Show filename

set undolevels=1000                      " Number of undo levels
set history=1000                         " Store lots of :cmdline history
set backspace=indent,eol,start           " Backspace behaviour

set hidden                               " allows Vim to manage multiple buffers

runtime macros/matchit.vim               " Enable extended % matchinggg

" Keybindings & Keymaps
" map ; :
" noremap ;; ;                              Hit ;; to restore original behaviour
" painfully slow. is there a better way?
nnoremap ' `                              Remap ` to '
nnoremap ` '

nnoremap <C-e> 3<C-e>                    " Scroll the viewport faster
nnoremap <C-y> 3<C-y>

let mapleader=","                        " Change leader to , e.g. \x ≡ ,x

set listchars=tab:>-,trail:·,eol:$       " toggle show whitespace ,s
nmap <silent> <leader>s :set nolist!<CR> " toggle show whitespace ,s

" Swap and Backup Files
set backupdir=~/.vim_tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim_tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set noswapfile
" set nobackup
" set nowb

" Completion
set wildmode=list:longest
set wildmenu                             " Enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~              " Stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" Scrolling
set scrolloff=8                          " Start scrolling 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" References
" https://items.sjbach.com/319/configuring-vim-right.html
" https://vimconfig.com
" https://www.shortcutfoo.com/blog/top-50-vim-configuration-options
" https://gist.github.com/joegoggins/8482408
