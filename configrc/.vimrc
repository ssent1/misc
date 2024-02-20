" Syd's Vim Configuration
"
" GLOBAL
filetype plugin indent on    " enable plugin detection,indent, syntax highlights
set conceallevel=0           " Markdown not hidden; cursor line not hidden
set confirm                  " confirm changes [Yes, No, Cancel] instead of error
set guicursor+=a:blinkon0    " disable cursor blink
set gdefault                 " substitute all matches in a line
set hlsearch!                " toggle highlight search results
set ignorecase               " enable case-insensitive search
set incsearch                " show search results while typing
set linebreak                " enable line break at words; requires: wrap
set rtp^=/usr/share/vimpager " enable vimpager
set rtp+=/usr/local/opt/fzf  " enable interactive command-line fuzzy finder/filter
set showbreak=-->            " enable line break prefix
set showmatch!               " toggle highlight matching braces
set smartcase                " enable smart-case search
set textwidth=120            " set column width for line wrap
set colorcolumn=+1           " highlight column 120
set title                    " enable title in terminal
set visualbell               " enable visual bell, no beep
set wrap!                    " toggle line wrap
set wrapscan                 " wrap when search reaches start/end of file
syntax on                    " enable syntax highlighting

" SPELLCHECK
set complete+=kspell      " enable word completion; triggers: <C-n>/<C-p>
set spelllang=en_ca,en_us " enable spellcheck; Canadian, American
augroup markdown_spell
    au!
    autocmd FileType markdown setlocal spell!
    autocmd BufRead,BufNewFile *.md setlocal spell
augroup END

" HYBRID LINE NUMBERS
set number relativenumber " enable hybrid line numbers

" TABS
set autoindent    " auto-indent new lines
set expandtab     " use spaces instead of tabs
set smartindent   " enable smart-indent
set smarttab      " enable smart-tabs
set shiftwidth=4  " >>:    set # of whitespace columns made by >> (shift)
set softtabstop=4 " <Tab>: set # of whitespace columns for <Tab> keystroke
set tabstop=4     " \t:    set # of columns produced by \t <Tab> character

" COPY & PASTE
set clipboard=unnamed " enable copy to clipboard

" ADVANCED
runtime macros/matchit.vim         " enable extended % matching
set autoread                       " reload files, if changed outside vim
set autowrite                      " :write before running commands
set backspace=indent,eol,start     " set backspace behaviour
set encoding=utf-8                 " use the Unicode character set
set hidden                         " hide buffers instead of closing them
set history=1000                   " set maximum items in command history
set listchars=tab:>-,trail:·,eol:$ " define whitespace characters
set modelines=0                    " disable modelines, security precaution
set nomodeline                     " disable modelines, security precaution
set mouse=a                        " enable mouse
set nrformats+=unsigned            " disable octal mode, improves vim-speeddating performance
set nrformats+=alpha               " enable {in,de}crementing alpha chars
set ruler                          " show row and column ruler information
set showcmd                        " show incomplete commands in status line
set showmode                       " show current mode in status line
set statusline+=%f                 " show file in status line
set undolevels=1000                " set maximum undo level
set viminfo='1000,f1               " save bookmarks

" CREATE FILE ON INITIAL EDIT
augroup init_save
    au!
    autocmd BufNewFile * :write
    " autocmd BufNewFile * execute 'cd '.expand('%:p:h') |:execute 'e '.expand('%') |:execute 'write'
    autocmd BufNewFile *.md :let@r='' |:let@r="# \n\n- - -\n<!-- sources -->\n\nTags: \n\n^\n\\\n%\n" |:put r
                \|:let@r=strftime(' %FT%T%z') |:norm!"rp2k"rpgJ4kmaggdd$"
    autocmd BufRead,BufNewFile *.py setlocal textwidth=80
    autocmd BufRead,BufNewFile *.html setlocal textwidth=0
augroup END

" KEY BINDING MAPS
let mapleader="'"
nnoremap ' `
nnoremap ` '
nmap <F3> i<C-R>=strftime('%Y-%m-%dT%H:%M:%S%z')<CR><Esc>
imap <F3> <C-R>=strftime('%Y-%m-%dT%H:%M:%S%z')<CR>
nnoremap <silent> <Space>    :noh <Bar>:echo<CR>
nnoremap <silent> <leader>e  :edit <C-R>=expand("%:p:h")."/" <CR>
nnoremap <silent> <leader>ev :edit +314 $MYVIMRC<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>
nnoremap <silent> <leader>1  :call ToggleWrap()<CR>
nnoremap <silent> <leader>;  :set spell!<CR>
nnoremap <silent> <leader>w  :set nolist!<CR>
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
let g:user_emmet_leader_key=','

" set leader to '
" swap :mark leaders ' <==> `
" F3 = inset date in ISO 8601 format
" <Space> = reset search highlighting:
" 'e = edit file in same directory as active buffer
" 'ev = edit ~./vimrc in a new buffer
" 'sv = source ~./vimrc
" toggle:
"   '1 = line wrap
"   '; = spellcheck
"   'w = show whitespace
" Move screen three lines:
"   <C-e> = <Down>
"   <C-y> = <Up>

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
set wildmenu " enable <C-n> and <C-p> to scroll thru matches
set wildmode=list:longest

" SCROLLING
set scrolloff=8 " start scrolling 8 lines away from margins
set sidescroll=1
set sidescrolloff=15

" CURSOR APPEARANCE
augroup dynamic_cursor
    au!
    autocmd InsertEnter,InsertLeave * set cul! culopt=screenline
augroup END

let &t_SI = "\e[6 q" " start insert  mode, cursor = steady bar       (5 = blinking bar)
let &t_SR = "\e[4 q" " start replace mode, cursor = steady underline (3 = blinking underline)
let &t_EI = "\e[2 q" " end   irnsert mode, cursor = steady block     (1 = blinking block)
set guicursor+=i:blinkwait300-blinkon100-blinkoff200
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast

" TOGGLE WRAPPING MODES
function! ToggleWrap()
    if (&wrap == 1 && &linebreak == 1)
        set nowrap
        set nolinebreak
    else
        set wrap
        set linebreak
    endif
endfunction

" PLUGINS
"" Automatic Installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    augroup install_plug
        au!
        autocmd VimEnter * PlugInstall --sync |:source $MYVIMRC
    augroup END
endif

"" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

"" Run PlugInstall if there are missing plugins
augroup install_plugins
    au!
    autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
                \|:PlugInstall --sync |:source $MYVIMRC
                \|:endif
augroup END

let g:polyglot_disabled = ['markdown'] " conflict: vim-polyglot & vim-markdown, interferes with mkdx list indentation

"" Load plugins
call plug#begin('~/.vim/plugged')
Plug 'ap/vim-css-color'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-titlecase'
Plug 'clarke/vim-renumber'
Plug 'dense-analysis/ale'
Plug 'dhruvasagar/vim-table-mode'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'godlygeek/tabular'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'mattn/emmet-vim'
Plug 'mechatroner/rainbow_csv', {'as': 'rainbow-csv' }
"Plug 'mtth/scratch.vim'
Plug 'preservim/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'SidOfc/mkdx'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'triglav/vim-visual-increment'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

""  Set plugin options "
""" airline
let g:airline#extensions#tabline#enabled = 1 " show buffers in top status bar
let g:airline_powerline_fonts = 1            " load powerline symbols
let g:airline_theme='dark'                   " enable dark-mode theme

""" css-color
function! s:CssColorInit(typ, keywords, groups)
    try
        call css_color#init(a:typ, a:keywords, a:groups)
    catch /^Vim\%((\a\+)\)\=:E117/
        " echom 'ap/vim-css-color is not installed.'"
    endtry
endfunction

augroup CssColorCustomFiletypes
    au!
    autocmd Filetype md call s:CssColorInit('css','extended','hex')
    command ColorToggle call css_color#toggle()
augroup END

""" HTML
let g:html_indent_tags = 'li\|p' " treat <li>|<p> like block tags

""" markdown
"let g:vim_markdown_auto_insert_bullets = 1
"let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_toc_autofit = 1
set nofoldenable!  " disable folding, vim-markdown
hi DiffDelete ctermfg=17  ctermbg=45  guifg=#00005f guibg=#00dfff
hi MatchParen ctermfg=17  ctermbg=45  guifg=#00005f guibg=#00dfff
hi SpellBad   ctermfg=233 ctermbg=141 guifg=#000000 guibg=#BD93F9
hi SpellCap   ctermfg=232 ctermbg=212 guifg=#000000 guibg=#FF79C6
hi SpellLocal ctermfg=232 ctermbg=117 guifg=#000000 guibg=#8BE9FD

""" mkdx
let g:mkdx#settings = {
            \ 'image_extension_pattern': 'a\?png\|jpe\?g\|gif\|svg',
            \ 'enter':     { 'enable': 0, 'shift': 0, 'o': 1, 'shifto': 1, 'malformed': 1 },
            \ 'checkbox':  { 'toggles': [' ', 'x', '-'] },
            \ 'highlight': { 'enable': 1 },
            \ 'links':     { 'external': { 'enable': 1 } },
            \ 'table':     { 'divider': '|', 'header_divider': '-',
                \ 'align': { 'left': [], 'center': [], 'right': [], 'default': 'left' } },
            \ 'tokens':    { 'enter': ['-', '*', '>'], 'bold': '__','italic': '_' },
            \ 'toc':       { 'text': 'Contents', 'position': 2, 'update_on_write': 0 },
            \ }

" ABBREVIATIONS
"" Command-line mode
cabbrev !!     [^]+<Left><Left>
cabbrev ''     exe "norm {jma}kmz"
cabbrev alb    Tabularize /:
cabbrev alf    Tabularize /^[^:]*:\zs/l0r1
cabbrev c2l    s/\sand//e \| let cnt=1 \| silent exe 's/'.','.'/\=execute(''let cnt += 1'')/n' \| let @q=cnt \|call repeat(append('.', ""), @q)\|:call setline('.', uniq(split(tolower(getline('.')), ',\s*'))) \|:exe "norm {jma}kmz" \|:'a,'zs/^/- [ ] /e\|:'a,'zs/\v<(\w)([^.$]+)/\u\1\L\2/e\|:noh
cabbrev cap    %s/\vchrome-extension:\/\/efaidnbmnnnibpcajpcglclefindmkaj\/(https?\|ftp)(:\/\/[^\s\/\$\.\?\#]+.\S+)/\1\2/e
cabbrev ccq    %s/^\s\<\|\s\+$//e\|:%s/\>\s\{2,}/ /e\|:%s/\v([[:punct:]])\s{2,}/\1 /e\|:%s/^\n\{2,}/\r/e\|:%s/\n\+\%$//e\|:%s/[‘’]/'/e\|:%s/[“”]/"/e
cabbrev cdf    $ka\|:'a\|-1s/\n\n//e\|:?^\s*$?\|:+1,$d\|:let @q=@"\|:-3kz\|:-7ka\|:'a,'zs/\v_(\d{4}-\d{2}-\d{2}[tT_]\d{2}:\d{2}:\d{2}-\d{4})_/\1/e\|:'a,'zs/\v(\d{4})(\d{2})(\d{2})[tT_](\d{2})(\d{2})(\d{2})/\1-\2-\3T\4:\5:\6-0_00/e\|:'a,'zs/\v(\d{4})(\d{2})(\d{2})[tT_](\d{2})(\d{2})(\d{2})(\d{4})/\1-\2-\3T\4:\5:\6-\7/e\|:'a,'zd\|:let @r=@"\|:-1,$d\|:let@s="- - -\n<!-- sources -->\n"\|:pu s\|:pu q\|:pu r
cabbrev cls    s/\v,\s+%(and\s+)?\|^/\r- /\|:noh
cabbrev Cls    s/\v,\s+%(and\s+)?\|^/\r1. /\|:noh
cabbrev cpl    let @q=''\|:%s/\v_/\=setreg('Q', submatch(1), 'l')/n\|:let @*=@q\|:norm 2G"qp
cabbrev Cpl    let @q=''\|:%s/\v_/\=setreg('Q', submatch(1).'{str}'.submatch(2), 'l')/n\|:let @*=@q\|:norm 2G"qp
cabbrev crl    exe "norm {jma}kmz"\|:'a,'zs/\v^\[(\d+)\]: ([^ ]+) "([^\"]+)"/- [ ] [\3](\2)/e\|:noh
cabbrev Crl    exe "norm {jma}kmz"\|:'a,'zs/\v^\[0?([1-9]+)\]: ([^ ]+) "([^\"]+)"/\1. [ ] [\3](\2)/e\|:noh
cabbrev Csv    call search('^Tags:\s','w')\|:exe 'norm ^"qd2w'\|:call setline('.', @q.join(reverse(sort(uniq(split(tolower(getline('.')), ',\s*')))), ', '))
cabbrev csv    call search('^Tags:\s','w')\|:exe 'norm ^"qd2w'\|:call setline('.', @q.join(sort(uniq(split(tolower(getline('.')), ',\s*'))), ', '))
cabbrev ctf    s/\v^\s+\|\s+$//e\|:s/\v^(.*)\n/\=setreg('q',submatch(1))/n\|:s/\>[^ ]//e\|:s/\>\W\+/-/e\|:s/\v^(.*)/\=setreg('r',tolower(submatch(1)).'.md')/n\|:d\|:put! q\|:let @*=@r\|:noh
cabbrev ctr    exe "norm {jma}kmz"\|:'a,'zs/\v^(\d+)\. \[([^\]]+)\]\(([^\)]+)\)/[\1]: \3 "\2"/
cabbrev cts    call search('\v(\d{4})(\d{2})(\d{2})[tT_](\d{2})(\d{2})(\d{2})', 'w')\|:s/\v(\d{4})(\d{2})(\d{2})[tT_](\d{2})(\d{2})(\d{2})/\1-\2-\3T\4:\5:\6-0_00/\|:call search('\d\+')\|:exe "norm 24yl"
cabbrev ddt    let@r=strftime('%Y-%m-%d')\|:norm!"rp"
cabbrev fnr    exe "norm! Go"\|:let@r="- - -\n<!-- sources -->\n\nTags: \n\n^\n\\\n%\n"\|:put r\|:let@r=strftime(' %FT%T%z')\|:norm!"rp2k"rpgJ4k"
cabbrev gcc    %s/\v(\<!--)(\w)([^-]+)(\w)(--.*)/\1 \2\3\4 \5/e
cabbrev hyp    s/\v^\s+\|\s+$//e\|:let title = getline('.')\|:s/\W\+/-/e\|:s/\v^-?(.*)/\=setreg('r',tolower(submatch(1)).'.md')/n\|:call setline('.',title)\|:let @+=@r\|:noh
cabbrev s'     'a,'zs/\v()<Left>
cabbrev S'     exe "norm {jma}kmz"\|:'a,'zs/\v()<Left>
cabbrev sbd    exe "norm {ma}mz"\|:'a,'zs/\v^\[\d+]/[1]/\|:'a+1,'z-1 sort ui\|:'a,'zs/\v^(\[\d+\]:\s[fh]tt?ps?:\/\/)(([^\.]+\.)([^\.\/]+\.[^\/]+)\|([^\.\/]+\.[^\/]+))(.*)/\4\5\6#\1\3/\|:'a+1,'z-1 sort ui\|:'a,'zs/\v(.*)#(.*)/\2\1/\|:let i=1 \| g/^\[1\]/s//\='['.i.']'/ \| let i=i+1
cabbrev sd     %s/\v//<Left><Left>
cabbrev Sd     %s///<Left><Left>
cabbrev sr     .,s/\v()<S-Left><Right><Right>
cabbrev srt    exe "norm {jma}kmz"\|:'a,'z sort ui
cabbrev ssv    1\|:s/\v^\s+\|\s+$//e\|:let title = getline('.')\|:s/\W\+/-/e\|:s/\v^-(.*)/\=setreg('r',tolower(submatch(1)).'.md')/n\|:call setline('.',title)\|:exe 'sav'@r\|:noh
cabbrev Ssv    bufdo if &modified\|:1\|:s/\v^\s+\|\s+$//e\|:let title = getline('.')\|:s/\W\+/-/e\|:s/\v^-(.*)/\=setreg('r',tolower(submatch(1)).'.md')/n\|:call setline('.',title)\|:exe 'sav'@r\|:noh|:endif
cabbrev Tsp    bufdo if &modified\|:call search('%\s20\d\{2}-\d\{2}-\d\{2}','w')|:exe 'norm ^"qdt2'|:call setline('.',@q.strftime('%FT%T%z'))|:update\|:endif
cabbrev tsp    let view=winsaveview()\|:call search('%\s\d\{4}-\d\{2}-\d\{2}','w')\|:exe 'norm ^"qdt2'\|:call setline('.',@q.strftime('%FT%T%z'))\|:call winrestview(view)\|:up
cabbrev ttc    exe "norm {jma}kmz"\|:'a,'zs/\v(\[\d\]:\s([fh]tt?ps?:\/\/[^\/$.?#]+\S+)\/?)\s"\2"/\1/e\|:'a,'zs/\v%(\s[-\/:^\|·––—⋅]\s)([A-Za-z0-9 ]+)"$/"/\|:'a,'zs/\v(\[\d\]:\s[fh]tt?ps?:\/\/[^\/$.?#]+\S+)\|:(\s"[^-·–—\|"]+\w)[^"]*(")/\1\2\3/e\|:noh
cabbrev Url    %s/\v([fh]tt?ps?:\/\/[^\/\$\.\?\#]+\S+)/\1/\|:noh
cabbrev url    exe "norm {jma}kmz"\|:'a,'zs/\v([fh]tt?ps?:\/\/[^\/\$\.\?\#]+\S+)/\1/\|:noh
cabbrev yfn    let @+=expand("%:t")
cabbrev yp     let @+=expand("%:p")
cabbrev yrp    let @+=expand("%")

"" Insert mode
iabbrev @@    sksalmon@gmail.com
iabbrev nb    N.B.
iabbrev zym   Zymonetics

" !!     insert 'logical NOT' regex, move cursor inside brackets
" ''     mark paragraph as range; trims leading/training line
" alb    align by <character>, default = :
" alf    align from first instance of <character>, default = :
" c2l    convert csv to list
" cap    capture url Adobe PDF extension
" ccq    trim ^/$ whitespace, condense >= 2 { spaces, blank lines } into one, rm newlines @ $, convert curly “‘quotes’”
" cdf    convert document footer
" cls    <ol>, convert line to ordered list
" Cls    <ul>, convert line to unordered list
" cpl    copy linewise
" Cpl    copy linewise, multiple atoms
" Crl    convert to ordered checklist < ref link
" crl    convert to unordered checklist < reference link
" csv    sort line by comma separated values (csv), ascending order
" Csv    sort line by comma separated values (csv), descending order
" ctf    convert line to filename
" ctr    convert to reference link
" cts    convert compact timestamp to ISO 8601
" ddt    insert date (yyyy-mm-dd)
" fnr    insert footer, notes, resources
" gcc    fix comment spacing :%s/\v(\<!--)(\w)([^-]+)(\w)(--.*)/\1 \2\3\4 \5/e
" hyp    hyphenate line
" sbd    sort reference links by domain
" srt    sort range, unique
" Ssv    copy filename to :reg r, use buffer's title line as filename
" ssv    save (write) buffer to disk using title line as filename
" Tsp    for all buffers, update timestamps
" tsp    update timestamp
" ttc    trim title cruft from URLs
" Url    capture all urls
" url    capture block of urls

" s<..>  {range} very magic search pattern {cursor position}:
"" s'    marked range: 'a,'z
"" sd    entire document: %, very magic (\v)
"" Sd    entire document: %
"" sr    specified range: .,<n>; move cursor <n> (enter line number, $ (enf of file), etc.)

" y<..>  yank <current buffer filename> to system clipboard
"" yfn   %:t tail (filename, last path component only), .vimrc
"" yp    %:p expand to full path,                       /Users/<dir>/.vimrc
"" yrp   % current file name (relative path),           /Users/syd/.vimrc

" REFERENCES
" https://gist.github.com/joegoggins/8482408
" https://items.sjbach.com/319/configuring-vim-right.html
" https://nvie.com/posts/how-i-boosted-my-vim/
" https://vimconfig.com
" https://github.com/thoughtbot/dotfiles/blob/main/vimrc
" https://invisible-island.net/xterm/ctlseqs/ctlseqs.html 'XTerm Control Sequences: CSI Ps SP q: Set cursor style'

" Last update: set g:mkdx#settings = 'links' { 'enable': 0 } ==> disable getting website; desired: open in browser
" ^ 2022-01-12T21:16:44-0500
" % 2024-02-19T19:30:01-0500
