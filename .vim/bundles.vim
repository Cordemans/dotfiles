"  Vundle configuration

set nocompatible
filetype off

" let Vundle manage Vundle
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'bling/vim-airline'
Plugin 'myusuf3/numbers.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'godlygeek/tabular'
Plugin 'mhinz/vim-signify'
Plugin 'mattn/emmet-vim'
Plugin 'sjl/gundo.vim'
Plugin 'kien/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
