#!/bin/zsh

function app_store_update {
  echo "Starting App Store Update"
  osascript -e '
    tell application "App Store"
      activate
      delay 0.5
      tell application "System Events" to keystroke "5" using {command down}
    end tell
  '
  echo "Finished App Store Update\n\n"
}

function brew_update {
  echo "Starting Homebrew Update"
  cd ~
  brew update
  brew upgrade
  brew cleanup --force
  brew prune --force
  echo "Finished Homebrew Update\n\n"
}

function brew_cask_update {
  echo "Starting Homebrew Cask Update"
  cd ~
  brew update
  brew cu # --all --yes --cleanup https://github.com/buo/homebrew-cask-upgrade
  brew cask cleanup
  echo "Finished Homebrew Cask Update\n\n"
}

function vim_plugins_update {
  echo "Starting Vim Plugin Update"
  cd ~
  nvim -c "PlugUpgrade | PlugUpdate | PlugClean! | qall"
  echo "Finished Vim Plugin Update\n\n"
}

function zprezto_update {
  echo "Starting Prezto Update"
  cd ~/.zprezto
  git pull
  git submodule update --init --recursive
  echo "Finished Prezto Update\n\n"
}

function backup {
  echo "Starting Backup"
  cd ~
  brew leaves >! brew_packages.txt
  brew cask list >> brew_packages.txt
  brew tap >> brew_packages.txt
  # TODO: commit to dotfiles repo
  echo "Finished Backup\n\n"
}

app_store_update
brew_update
brew_cask_update
# vim_plugins_update
# zprezto_update
# backup
