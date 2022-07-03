set clipboard=unnamedplus
set backspace=indent,eol,start
colorscheme PaperColor
set mouse=r
set tabstop=4
syntax on
set shm+=I
inoremap jk <Esc>
set relativenumber
set background=dark
set ignorecase
set autoindent
set shiftwidth=4
set hlsearch
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'davidhalter/jedi-vim'
autocmd FileType python setlocal completeopt-=preview
call vundle#end()
