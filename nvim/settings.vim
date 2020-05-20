let mapleader=','
"let maplocalleader='\\'
let g:python3_host_prog = expand("~/.pyenv/shims/python3")

syntax on
filetype plugin indent on

set backspace=2               " make backspace work like most other programs
set pumheight=10
set history=50
set laststatus=2              " Always display the status line
set clipboard=unnamedplus
set hidden                    " Required to keep multiple buffers open multiple buffers
set nobackup                  " Some servers have issues with backup files, see #649.
set nowritebackup
set cmdheight=2               " Give more space for displaying messages.
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set updatetime=300 
set shortmess+=c              " Don't pass messages to ins-completion-menu.
" Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.
set signcolumn=yes            
set nowrap                    " Display long lines as just one line
set cursorline
set noswapfile
set noshowmode
set ruler                     " show the cursor position all the time
set showcmd                   " display incomplete commands
set incsearch                 " do incremental searching
set autoread                  " Automatically read when file is changed
set autowrite                 " Automatically :write before running commands
set smartindent
set autoindent
" Soft tab, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set smarttab
set expandtab
" Open new split panes to right and bottom, which feels more natural
set splitright
set splitbelow
" Number
set number
set relativenumber
set numberwidth=5
