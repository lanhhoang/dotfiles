" Convert current word to uppercase in insert mode
inoremap <C-u> <Esc>ebviwUi
" Convert current word to uppercase in normal mode
nnoremap <C-u> ebviwU
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
" Tab to complete
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" Easy switch between vim split
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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

" NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" FZF
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" CoC
let g:coc_global_extensions = [
  \ 'coc-solargraph',
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]
