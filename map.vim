inoremap kj <Esc>
inoremap <C-s> <ESC>:w<CR>
noremap `` :terminal<CR>

" Move line mappings
" execute "set <M-j>=\ej"
nnoremap <A-j> :m .+1<CR>
nnoremap <A-k> :m .-2<CR>
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

map <F5> :NERDTree<CR>

" inoremap { {}<Left>
" inoremap {<CR> {<CR>}<Esc>O
map <C-n> :tabn<CR>
