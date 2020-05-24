#!/bin/bash

set -xv

while test $# -gt 0; do 
  case "$1" in
    --help)
      echo "Help"
      exit
      ;;
    --macos)
      echo $OSTYPE
      install_macos
      backup
      link_dotfiles
      zsh
      source ~/.zshrc
      exit
      ;;
    --backup)
      echo 'backup'
      backup
      exit
      ;;
    --dotfiles)
      echo 'link_dotfiles'
      link_dotfiles
      exit
      ;;
  esac
done

function check_installed {
  # set to 1 initially
  local status=1
  # set to 0 if not found
  type $1 >/dev/null 2>&1 || { local status=0; }
  # return
  echo "$status"
}

function install_macos {
  if [[ $OSTYPE != darwin* ]]; then
    return
  fi

  echo "MacOS detected"
  xcode-select --install

  if [ "$(check_installed brew)" == "0" ]; then
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi

  if [ "$(check_installed git)" == "0" ]; then
    echo "Installing Git"
    brew install git
  fi

  if [ $TERM_PROGRAM != "iTerm.app" ]; then
    echo "Installing iTerm2"
    brew tap caskroom/cask
    brew cask install iterm2
    echo "Installing Hack Nerd Font"
    brew tap homebrew/cask-fonts
    brew cask install font-hack-nerd-font
  fi

  if [ "$(check_installed zsh)" == "0" ]; then
    echo "Installing zsh"
    brew install zsh zsh-completions
    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  fi

  if [ "$(check_installed tmux)" == "0" ]; then
    echo "Installing tmux"
    brew install tmux
    echo "Installing reattach-to-user-namespace"
    brew install reattach-to-user-namespace
    echo "Installing tmux-plugin-manager"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi

  if [ "$(check_installed pyenv)" == "1" ]; then
    echo "Install Python version manager"
    brew install pyenv
    pyenv install 2.7.17
    pyenv install 3.8.0
    pyenv global 2.17.17 3.8.0
  fi

  if [ "$(check_installed rbenv)" == "1" ]; then
    echo "Install Ruby version manager"
    brew install rbenv
  fi

  if [ "$(check_installed node)" == "0" ]; then
    echo "Installing Node"
    brew install node
  fi

  if [ "$(check_installed nvim)" == "0" ]; then
    echo "Install neovim"
    brew install neovim
  fi

  if [ "$(check_installed fzf)" == "0" ]; then
    echo "Installing fzf"
    brew install fzf
    $(brew --prefix)/opt/fzf/install
  fi

  if [ "$(check_installed ag)" == "0" ]; then
    echo "Installing The silver searcher"
    brew install the_silver_searcher
  fi

  if [ "$(check_installed rg)" == "0" ]; then
    echo "Installing ripgrep"
    brew install ripgrep
  fi

  if [ "$(check_installed ctags)" == "0" ]; then
    echo "Installing ctags"
    brew install --HEAD --without-docutils universal-ctags/universal-ctags/universal-ctags
  fi

  if [ "$(check_installed fd)" == "0" ]; then
    echo "Installing fd"
    brew install fd
  fi
}

function backup {
  echo "Backing up dotfiles"
  local current_date=$(date +%s)
  local backup_dir=dotfiles_$current_date

  mkdir ~/$backup_dir
  mkdir ~/$backup_dir/zsh
  mkdir ~/$backup_dir/tmux
  mkdir ~/$backup_dir/nvim

  mv ~/.zshrc ~/$backup_dir/zsh/.zshrc
  mv ~/.tmux.conf ~/$backup_dir/tmux/.tmux.conf
  mv ~/.config/nvim ~/$backup_dir/nvim
}

function link_dotfiles {
  echo "Linking dotfiles"

  ln -s $(pwd)/zshrc ~/.zshrc
  ln -s $(pwd)/tmux.conf ~/.tmux.conf

  if [ ! -d "$ZSH/custom/themes/powerlevel9k" ]; then
    echo "Installing powerlevel9k theme"
    git clone https://github.com/bhilburn/powerlevel9k.git $ZSH/custom/themes/powerlevel9k
  fi

  if [ ! -d "$ZSH/custom/plugins/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH/custom/plugins/zsh-autosuggestions
  fi

  if [ ! -d "$ZSH/custom/plugins/zsh-syntax-highlighting" ]; then
    echo "Installing zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH/custom/plugins/zsh-syntax-highlighting
  fi

  rm -rf $HOME/.config/nvim
  mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}

  ln -s $(pwd)/nvim $XDG_CONFIG_HOME/nvim
}
