set nocompatible
set t_Co=256
filetype off

" reload file changes outside vim
set autoread

" optimize for fast terminal connections
set ttyfast

" Vundle configuration
source ~/.vim/bundles.vim

color molokai

" enable syntax processing
syntax on

" show line numbers
set number

" highlight matching brace
set showmatch

" do not beep
set visualbell
set noerrorbells

" disable folding
set nofoldenable

" start scrolling when we're 8 lines away from margins
set scrolloff=8


set incsearch  " find the next match as we type the search
set hlsearch   " highlight searches by default
set ignorecase " ignore case when searching...
set smartcase  " ...unless we type a capital


" Easier window navigation
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l


" yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" do not wrap lines
set nowrap

" show invisible characters
set list
set listchars=tab:▸\ ,trail:·"char representing a tab

" ruler
set ruler
set colorcolumn=120

set backspace=indent,eol,start " backspace in insert mode

" save on buffer switch
set autowrite

" this makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" sets how many lines of history VIM has to remember
set history=1000
set undolevels=1000
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" down is really the next line
nnoremap j gj
nnoremap k gk

" easy escaping to normal mode
inoremap jj <esc>

" preserve selection when indenting
vnoremap > >gv
vnoremap < <gv

" Invisible character colours
highlight SpecialKey guifg=#4a4a59
highlight NonText guifg=#4a4a59

set cursorline

" use unix as the standard file type
set ffs=unix,dos,mac

" remember last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" always show statusline
set laststatus=2
" show command in bottom bar
set showcmd

"
" Airline configurations
"
let g:airline#extensions#whitespace#enabled = 0

" do not use powerline fonts
let g:airline_powerline_fonts = 0

" do not show separators
let g:airline_left_sep=''
let g:airline_right_sep=''

" more natural split opening
set splitbelow
set splitright

"
" CtrlP config
"
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_user_command = "find %s -type f | egrep -v '/.(git|hg|svn)|solr|tmp/' | egrep -v '.(png|exe|jpg|gif|jar|class|swp|swo|log|gitkep|keepme|so|o)$'"
let g:ctrlp_working_path_mode = '~'
