#!/bin/sh

REPO="https://gitee.com/mirrors/oh-my-zsh.git"
ZSH_AUTO_SUGGESTIONS="https://gitee.com/zsh-users/zsh-autosuggestions.git"
ZSH_SYNTAX_HIGHLIGHTING="https://gitee.com/zsh-users/zsh-syntax-highlighting.git"

user_can_sudo() {
  command_exists sudo || return 1
  
  ! LANG= sudo -n -v 2>&1 | grep -q "may not run sudo"
}

command_exists() {
  command -v "$@" >/dev/null 2>&1
}

check_git() {
  command_exists git || {
    echo "Git is not installed. Please install git first."
    exit 1
  }
}

install_zsh() {
  if [ "$(basename -- "$SHELL")" = "zsh" ]; then
    return
  fi
  
  if ! command_exists zsh ; then
    echo "Zsh is not installed. Please install zsh first."
    exit 1
  fi
  
  echo "The current shell is not `zsh`. Do you want to change your default shell to zsh? [Y/n]"
  read -r opt
  case $opt in
    y*|Y*|"") ;;
    n*|N*) echo "Shell change skipped."; exit ;;
    *) echo "Invalid choice. Shell change skipped."; exit ;;
  esac
  
  if ! command_exists chsh ; then
    echo "I can't change your shell automatically because this system does not have chsh. Please manually change your default shell to zsh"
    exit 1
  fi
  
  echo "It needs to input your password to change your default shell to zsh."
  chsh -s $(command -v zsh)
}

main() {
  if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "~/.oh-my-zsh is not empty"
    exit
  fi
  
  install_zsh
  
  check_git
  
  git clone $REPO ~/.oh-my-zsh
  
  if [ -f "$HOME/.zshrc" ]; then
    mv $HOME/.zshrc $HOME/.zshrc.bak
  fi
  
  cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
  sed -i "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"ys\"/g" ~/.zshrc
  
  git clone $ZSH_AUTO_SUGGESTIONS ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone $ZSH_SYNTAX_HIGHLIGHTING ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  
  sed -i "s/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/g" ~/.zshrc
  
  exec zsh -l
}

main
