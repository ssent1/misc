"
" Syd Salmon's Vim Configuration
"
" Global
filetype indent on
filetype on                              " Enable syntax highlighting and configuration
filetype plugin on
set gcr=a:blinkon0                       " Disable cursor blink
set gdefault                             " Always substitute all matches in a line
set hlsearch!                            " Toggle highlight search results...
set ignorecase                           " Always case-insensitive
set incsearch                            " ...dynamically as they are typed.
set linebreak                            " Break lines at word (requires Wrap lines)
set rtp+=/usr/local/opt/fzf              " Interactive command-line fuzzy finder/filter
set showbreak=--><Space>                 " Wrap-broken line prefix
set showmatch                            " Highlight matching brace
set smartcase                            " Enable smart-case search
set textwidth=120                        " Line wrap (number of cols)
set title                                " Set the terminal title
set visualbell                           " Use visual bell (no beeping)
set wrap                                 " Wrap lines
set wrapscan                             " Wrap when search reaches beginning/end of file
syntax on                                " Turn on syntax highlighting
nnoremap <silent><Space> :nohlsearch<Bar>:echo<CR>
" Press <Space> to clear search highlighting 

" Spellcheck
set spell! spelllang=en_ca,en_us         " Toggle spell-checking
set spell!                               " :set nospell as the default                              
set complete+=kspell                     " Word completion; in insert mode, `^n` & ^p` trigger word completion
nmap <silent> <leader>s :set spell!<CR>  " Toggle spellcheck `,;`

" Underline spellcheck results
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

" Hybrid line numbers
set relativenumber                       " Show relative line numbers
set number                               " Show line numbers
set number relativenumber                " Show hybrid line numbers

" Tabs
set autoindent                           " Auto-indent new lines
set expandtab                            " Use spaces instead of tabs
set smartindent                          " Enable smart-indent
set smarttab                             " Enable smart-tabs
set shiftwidth=2                         " Number of auto-indent spaces
set softtabstop=2                        " Number of spaces per tab
set tabstop=2                            " Number of spaces per tab

" Copy & Paste
set clipboard=unnamed                    " Enable copy to clipboard

" Advanced
runtime macros/matchit.vim               " Enable extended % matchinggg
set autoread                             " Reload files changed outside vim
set backspace=indent,eol,start           " Backspace behaviour
set hidden                               " Hide buffers instead of closing them
set history=1000                         " Store lots of :cmdline history
set mouse=a                              " Activate mouse
set ruler                                " Show row and column ruler information
set showcmd                              " Show incomplete cmds down the bottom
set showmode                             " Show current mode down the bottom
set statusline+=%F                       " Show filename
set undolevels=1000                      " Number of undo levels

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>                    
nnoremap <C-y> 3<C-y>
let mapleader=","                        " Change leader to `,`
set listchars=tab:>-,trail:·,eol:$       " Set whitespace characters
nmap <silent> <leader>s :set nolist!<CR> " Toggle 'show whitespace' `,s`

" Swap and Backup Files
set backupdir=~/.vim_tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim_tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Completion
set wildignore+=*.gem                    " Ignore the following items when tab completion
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*DS_Store*
set wildignore+=*sass-cache*
set wildignore+=*vim/backups*
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=vendor/cache/**
set wildignore+=vendor/rails/**
set wildignore=*.o,*.obj,*~              
set wildmenu                             " Enable `^n` and `^p` to scroll thru matches
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

let g:airline_powerline_fonts = 1             " Populate g:airline_symbols with powerline symbols
let g:airline_theme='dark'                    " Dracula: base16_dracula
let g:airline#extensions#tabline#enabled = 1  " if [[ buffers > 1 && tabs = 1 ]) ; show all buffers ; fi

" References
" https://gist.github.com/joegoggins/8482408
" https://items.sjbach.com/319/configuring-vim-right.html
" https://nvie.com/posts/how-i-boosted-my-vim/
" https://vimconfig.com
" https://www.shortcutfoo.com/blog/top-49-vim-configuration-options "
