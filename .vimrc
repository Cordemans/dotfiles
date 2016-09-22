set nocompatible
set t_Co=256
filetype off

" reload file changes outside vim
set autoread

" optimize for fast terminal connections
set ttyfast

" ============== PLUGINS =================
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Smart-Tabs'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'myusuf3/numbers.vim'

Plugin 'spf13/piv'

Plugin 'terryma/vim-multiple-cursors'


call vundle#end()
filetype plugin indent on


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


" this makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" down is really the next line
nnoremap j gj
nnoremap k gk

" easy escaping to normal mode
inoremap jj <esc>

" preserve selection when indenting
vnoremap > >gv
vnoremap < <gv

" PIV, tabularize, numbers, surround, snipmate
