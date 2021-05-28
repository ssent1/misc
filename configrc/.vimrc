"
" Syd Salmon's Vim Configuration
"
" Global
filetype on                              " Filetype syntax highlighting and configuration
filetype indent on
filetype plugin on
nnoremap <F3> :set hlsearch!<CR>         " Set F3 to toggle search highlighting
set gcr=a:blinkon0                       " Disable cursor blink
set gdefault                             " Always substitute all matches in a line
set hlsearch!                            " Toggle highlight search results...
set ignorecase                           " Always case-insensitive
set incsearch                            " ...dynamically as they are typed.
set linebreak                            " Break lines at word (requires Wrap lines)
set number                               " Show line numbers
set rtp+=/usr/local/opt/fzf              " interactive command-line fuzzy finder/filter
set showbreak=+++                        " Wrap-broken line prefix
set showmatch                            " Highlight matching brace
set smartcase                            " Enable smart-case search
" set spell                              " Enable spell-checking
set textwidth=120                        " Line wrap (number of cols)
set title                                " Set the terminal title
set visualbell                           " Use visual bell (no beeping)
set wrap                                 " Wrap lines
syntax on                                " Turn on syntax highlighting

" Tabs
set autoindent                           " Auto-indent new lines
set expandtab                            " Use spaces instead of tabs
set smartindent                          " Enable smart-indent
set smarttab                             " Enable smart-tabs
set shiftwidth=2                         " Number of auto-indent spaces
set softtabstop=2                        " Number of spaces per tab
set tabstop=2                            " Number of spaces per tab

" Copy & Paste
set clipboard=unnamed                    " enable copy to clipboard

" Advanced
runtime macros/matchit.vim               " Enable extended % matchinggg
set autoread                             " Reload files changed outside vim
set backspace=indent,eol,start           " Backspace behaviour
set hidden                               " hide buffers instead of closing them
set history=1000                         " Store lots of :cmdline history
set mouse=a                              " Activate mouse
set ruler                                " Show row and column ruler information
set showcmd                              " Show incomplete cmds down the bottom
set showmode                             " Show current mode down the bottom
set statusline+=%F                       " Show filename
set undolevels=1000                      " Number of undo levels

" Keybindings & Keymaps
" Painfully slow. Is there a better way?
" map ; :
" noremap ;; ;                           " Hit ;; to restore original behaviour
" nnoremap ' `                           " Remap ` to '
" nnoremap ` '                           " Remap ' to `
" Scroll the viewport faster
nnoremap <C-e> 3<C-e>                    
nnoremap <C-y> 3<C-y>
let mapleader=","                        " Change leader to , e.g. \x ≡ ,x
set listchars=tab:>-,trail:·,eol:$       " configure whitespace characters
nmap <silent> <leader>s :set nolist!<CR> " toggle 'show whitespace' ,s

" Swap and Backup Files
set backupdir=~/.vim_tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim_tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set nobackup
" set noswapfile
" set nowb

" Completion
set wildignore+=*.gem                    " Ignore the following when tab completing
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*DS_Store*
set wildignore+=*sass-cache*
set wildignore+=*vim/backups*
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=vendor/cache/**
set wildignore+=vendor/rails/**
set wildignore=*.o,*.obj,*~              
set wildmenu                             " Enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=list:longest

" Scrolling
set scrolloff=8                          " Start scrolling 8 lines away from margins
set sidescroll=1
set sidescrolloff=15

" Plugins
" Automatic installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Run vim-plug
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
call plug#end()

let g:airline_powerline_fonts = 1             " populate g:airline_symbols with powerline symbols
let g:airline_theme='dark'                    " dracula: base16_dracula'
# let g:airline_theme_base16='base16_dracula' " dracula: base16 theme for vim-airline; too light

" References
" https://gist.github.com/joegoggins/8482408
" https://items.sjbach.com/319/configuring-vim-right.html
" https://nvie.com/posts/how-i-boosted-my-vim/
" https://vimconfig.com
" https://www.shortcutfoo.com/blog/top-50-vim-configuration-options "
