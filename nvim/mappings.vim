" Convert current word to uppercase in insert mode
inoremap <C-u> <Esc>ebviwUi
" Convert current word to uppercase in normal mode
nnoremap <C-u> ebviwU
" Turn off search highlight
nnoremap <Leader><Space> :nohlsearch<CR>
" Split pane vertically and horizontally
nnoremap <Leader>v :vs<CR>
nnoremap <Leader>h :sp<CR>
" open and edit init.vim
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
" source init.vim
nnoremap <Leader>sv :source $MYVIMRC<CR>
" save edited
nnoremap <C-q> :wq<CR>
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
" wrap word in double quotes
nnoremap <Leader>" viw<Esc>a"<Esc>bi"<Esc>lel
" wrap word in single quotes
nnoremap <Leader>' viw<Esc>a'<Esc>bi'<Esc>lel
" No more Esc
inoremap jk <Esc>
inoremap kj <Esc>
inoremap <Esc> <nop>
" No more arrow
nnoremap <Left> :echoe 'Use h'<CR>
nnoremap <Right> :echoe 'Use l'<CR>
nnoremap <Up> :echoe 'Use k'<CR>
nnoremap <Down> :echoe 'Use j'<CR>
" Easy switch between vim split
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Go to the begin or the end of line while editing
inoremap <C-w> <C-o>0
inoremap <C-e> <C-o>$

" Auto indent, set no wrap for HTML file
augroup filetype_html
  autocmd!
  autocmd BufWritePre,BufRead *.html :normal gg=G
  autocmd BufNewFile,BufRead *.html setlocal nowrap
augroup END

onoremap in( :<C-u>normal! f(vi(<CR>
onoremap il( :<C-u>normal! f)vi(<CR>
onoremap an( :<C-u>normal! f(va(<CR>
onoremap al( :<C-u>normal! f)va(<CR>
onoremap in[ :<C-u>normal! f[vi[<CR>
onoremap il[ :<C-u>normal! f]vi[<CR>
onoremap an[ :<C-u>normal! f[va[<CR>
onoremap al[ :<C-u>normal! f]va[<CR>
onoremap in{ :<C-u>normal! f{vi{<CR>
onoremap il{ :<C-u>normal! f}vi{<CR>
onoremap an{ :<C-u>normal! f{va{<CR>
onoremap al{ :<C-u>normal! f}va{<CR>
