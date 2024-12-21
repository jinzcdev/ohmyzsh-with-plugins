#!/bin/sh

# You can use the following two commands to install Oh My Zsh according to your location.
# sh -c "$(curl -fsSL https://gitee.com/jinzcdev/linux-shell/raw/main/install_ohmyzsh.sh)"
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/jinzcdev/linux-shell/main/install_ohmyzsh.sh)"

REPO="https://gitee.com/mirrors/oh-my-zsh.git"
ZSH_AUTO_SUGGESTIONS="https://gitee.com/zsh-users/zsh-autosuggestions.git"
ZSH_SYNTAX_HIGHLIGHTING="https://gitee.com/zsh-users/zsh-syntax-highlighting.git"
ZSH="${ZSH:-$HOME/.oh-my-zsh}"

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

  echo "The current shell is not zsh. Do you want to change your default shell to zsh? [Y/n]"
  read -r opt
  case $opt in
    y*|Y*|"")
      if ! command_exists chsh ; then
        echo "I can't change your shell automatically because this system does not have chsh. Please manually change your default shell to zsh"
        exit 1
      fi

      echo "It needs to input your password to change your default shell to zsh."
      if chsh -s $(command -v zsh); then
        echo "Shell successfully changed to zsh."
      else
        echo "Failed to change shell to zsh. Please try again."
        exit 1
      fi
      ;;
    n*|N*) echo "Shell change skipped."; exit ;;
    *) echo "Invalid choice. Shell change skipped."; exit ;;
  esac
}

setup_zshrc() {
  # Keep most recent old .zshrc at .zshrc.pre-oh-my-zsh, and older ones
  # with datestamp of installation that moved them aside, so we never actually
  # destroy a user's original zshrc
  echo "${FMT_BLUE}Looking for an existing zsh config...${FMT_RESET}"

  # Must use this exact name so uninstall.sh can find it
  OLD_ZSHRC=~/.zshrc.pre-oh-my-zsh
  if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
    # Skip this if the user doesn't want to replace an existing .zshrc
    if [ "$KEEP_ZSHRC" = yes ]; then
      echo "${FMT_YELLOW}Found ~/.zshrc.${FMT_RESET} ${FMT_GREEN}Keeping...${FMT_RESET}"
      return
    fi
    if [ -e "$OLD_ZSHRC" ]; then
      OLD_OLD_ZSHRC="${OLD_ZSHRC}-$(date +%Y-%m-%d_%H-%M-%S)"
      if [ -e "$OLD_OLD_ZSHRC" ]; then
        fmt_error "$OLD_OLD_ZSHRC exists. Can't back up ${OLD_ZSHRC}"
        fmt_error "re-run the installer again in a couple of seconds"
        exit 1
      fi
      mv "$OLD_ZSHRC" "${OLD_OLD_ZSHRC}"

      echo "${FMT_YELLOW}Found old ~/.zshrc.pre-oh-my-zsh." \
        "${FMT_GREEN}Backing up to ${OLD_OLD_ZSHRC}${FMT_RESET}"
    fi
    echo "${FMT_YELLOW}Found ~/.zshrc.${FMT_RESET} ${FMT_GREEN}Backing up to ${OLD_ZSHRC}${FMT_RESET}"
    mv ~/.zshrc "$OLD_ZSHRC"
  fi

  echo "${FMT_GREEN}Using the Oh My Zsh template file and adding it to ~/.zshrc.${FMT_RESET}"

  # Replace $HOME path with '$HOME' in $ZSH variable in .zshrc file
  omz=$(echo "$ZSH" | sed "s|^$HOME/|\$HOME/|")
  sed "s|^export ZSH=.*$|export ZSH=\"${omz}\"|" "$ZSH/templates/zshrc.zsh-template" > ~/.zshrc-omztemp
  mv -f ~/.zshrc-omztemp ~/.zshrc

  echo
}

main() {
  if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "~/.oh-my-zsh is not empty"
    exit
  fi
  
  install_zsh
  
  check_git

  git clone $REPO ~/.oh-my-zsh
  
  setup_zshrc
  
  cp "$ZSH/templates/zshrc.zsh-template" ~/.zshrc
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"ys\"/g" ~/.zshrc
  else
    sed -i "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"ys\"/g" ~/.zshrc
  fi
  
  git clone $ZSH_AUTO_SUGGESTIONS ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone $ZSH_SYNTAX_HIGHLIGHTING ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "s/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/g" ~/.zshrc
  else
    sed -i "s/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/g" ~/.zshrc
  fi

  exec zsh -l
}

main
