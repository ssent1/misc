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
set showmatch!              " toggle highlight matching braces
set smartcase               " enable smart-case search
set textwidth=120           " set column width for line wrap
set title                   " enable title in terminal
set visualbell              " enable visual bell, no beep
set wrap!                   " toggle line wrap
set wrapscan                " wrap when search reaches start/end of file
syntax on                   " enable syntax highlighting

" SPELLCHECK
set complete+=kspell      " enable word completion; triggers: ^n/^p
set spelllang=en_ca,en_us " enable spellcheck; Canadian, American
augroup markdownSpell
    autocmd!
    autocmd FileType markdown setlocal spell
    autocmd BufRead,BufNewFile *.md setlocal spell
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
set listchars=tab:>-,trail:·,eol:$ " define whitespace characters
set mouse=a                        " enable mouse
set ruler                          " show row and column ruler information
set showcmd                        " show incomplete commands in status line
set showmode                       " show current mode in status line
set statusline+=%f                 " show file in status line
set undolevels=1000                " set maximum undo level 

" KEY MAPS
let mapleader="'"
noremap <C-e> 3<C-e>
noremap <C-y> 3<C-y>
nmap <silent> <leader>; :set spell!<CR>
nmap <silent> <leader>s :set nolist!<CR>
nmap <silent> <leader>1 :call ToggleWrap()<CR>
nnoremap <silent><Space> :nohlsearch<Bar>:echo<CR>
" set leader to apostrophe:          '
" move screen down/up three lines:   ^e/^y
" toggle spellcheck/show whitespace: ';/'s
" clear search highlighting:         <Space>

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

" CURSOR APPEARANCE
autocmd InsertEnter,InsertLeave * set cul! culopt=screenline
let &t_SI = "\e[5 q"  " [s]tart [i]nsert  mode; cursor: blinking bar
let &t_SR = "\e[3 q"  " [s]tart [r]eplace mode; cursor: steady underline
let &t_EI = "\e[1 q"  " [e]nd   [ir]nsert mode; cursor: blinking block
set guicursor+=i:blinkwait300-blinkon100-blinkoff200
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast

" TOGGLE WRAPPING MODES
function ToggleWrap()
 if (&wrap == 1)
   if (&linebreak == 0)
     set linebreak
   else
     set nowrap
   endif
 else
   set wrap
   set nolinebreak
 endif
endfunction

" PLUGINS
"" Automatic Installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

"" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

"" Load plugins
call plug#begin('~/.vim/plugged')
Plug 'bradford-smith94/vim-autolist'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-titlecase'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'triglav/vim-visual-increment'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

""  Set plugin options
""" Airline
let g:airline#extensions#tabline#enabled = 1 " show buffers in top status bar
let g:airline_powerline_fonts = 1            " load powerline symbols
let g:airline_theme='dark'                   " enable dark-mode theme

""" Markdown
set foldenable! " toggle folding, vim-markdown
hi DiffDelete ctermfg=17  ctermbg=45  guifg=#00005f guibg=#00dfff
hi MatchParen ctermfg=17  ctermbg=45  guifg=#00005f guibg=#00dfff
hi SpellLocal ctermfg=17  ctermbg=45  guifg=#00005f guibg=#00dfff
hi SpellBad   ctermfg=232 ctermbg=160 guifg=#000000 guibg=#990000

" REFERENCES
"" https://gist.github.com/joegoggins/8482408
"" https://items.sjbach.com/319/configuring-vim-right.html
"" https://nvie.com/posts/how-i-boosted-my-vim/
"" https://vimconfig.com
"" https://www.shortcutfoo.com/blog/top-49-vim-configuration-options"
