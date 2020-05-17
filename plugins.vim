" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugins')
  Plug 'joshdick/onedark.vim'   " Theme
  Plug 'itchyny/lightline.vim'  " Colorscheme
  Plug 'preservim/nerdtree'     " File Explorer
  Plug 'ryanoasis/vim-devicons' " File Icon
  Plug 'sheerun/vim-polyglot'   " Language Pack
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails'
call plug#end()
