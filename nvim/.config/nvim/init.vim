" ---------------------------
"  NEOVIM Configuration
"
"  Kevin Kinney
"
"  --------------------------
" VUNDLE Configurtation
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" MY PLUGINS
Plugin 'vim-airline/vim-airline'
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'sainnhe/everforest'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" My vim settings
source ~/.vim/set.vim
source ~/.vim/map.vim

" colorscheme github
" let g:airline_theme = "github"
" let g:lightline = {'colorscheme':'github'}
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
