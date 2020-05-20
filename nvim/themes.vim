" Colorscheme
colorscheme onedark
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'cocstatus': 'coc#status'
	\ },
  \ }

