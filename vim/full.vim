" Basic Config as single file. 

" VUNDLE Configurtation
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" MY PLUGINS
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'preservim/nerdtree'
Plugin 'sainnhe/everforest'

call vundle#end()
filetype plugin indent on

let g:everforest_background = 'hard'
let g:airline_theme = 'everforest' 
let g:everforest_transparent_background = 1
let g:everforest_curren_word = 'bold'
let g:everforest_enable_italic = 0
let g:everforest_disable_italic_comment = 1
colorscheme everforest

set background=dark
if has('termguicolors')
    set termguicolors
endif
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Options
set number
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smarttab
set mouse=a
set noswapfile
set confirm
set path+=**
set clipboard="unnamedplus"
set wrap

" Keymaps
inoremap kj <Esc>
inoremap jk <Esc>
inoremap <C-s> <ESC>:w<CR>
