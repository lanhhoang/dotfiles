# dotfiles
`vim`, `tmux` configuration files for Ruby on Rails and JavaScript developer

## Tmux setup

```sh
brew install reattach-to-user-namespace
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
## Vim setup

### Install neovim

```sh
brew install neovim
```

### Install vim-plug

```sh
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Config vim

```sh
mkdir ~/.config/nvim
cd ~/.config/nvim
touch vim.init
```

### Install fzf

```sh
brew install fzf
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install
brew install ripgrep
brew install --HEAD --without-docutils universal-ctags/universal-ctags/universal-ctags
brew install the_silver_searcher
brew install fd
```
### Install CoC

```sh
brew install pyenv
pyenv install 3.8.0
pyenv install 2.7.17
pyenv global 3.8.0 2.7.17
cd ~/.config/nvim
pip3 install --user pynvim
```

## Reference
* https://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux
* https://www.chrisatmachine.com/neovim/
* https://learnvimscriptthehardway.stevelosh.com
* https://github.com/ChristianChiarulli/nvim
* https://github.com/rafi/vim-config
* https://github.com/codeaholicguy/dotfiles
* https://medium.com/vim-drops/understand-vim-mappings-and-create-your-own-shortcuts-f52ee4a6b8ed
* https://www.shortcutfoo.com/blog/top-50-vim-configuration-options
* https://medium.com/better-programming/setting-up-neovim-for-web-development-in-2020-d800de3efacd
* https://moduletux.gitlab.io/vim/ruby/programming/2019/04/12/coc-ruby-vim
* https://github.com/agarrharr/learning/tree/master/vimscript/vimscript-the-hard-way

