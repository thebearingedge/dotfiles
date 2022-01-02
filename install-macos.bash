#!/usr/bin/env bash

set -eu

dotfiles="$HOME"/.dotfiles

function install_homebrew() {
  local brew_sh='https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh'
  curl -fsSL "$brew_sh" | bash
  # shellcheck source=/dev/null
  source "$dotfiles"/.bash_profile.d/brew.bash
  brew bundle --file "$dotfiles"/Brewfile
}

function install_node() {
  local NVM_DIR="$HOME"/.nvm

  rm -rf "$NVM_DIR"
  git clone 'https://github.com/nvm-sh/nvm.git' "$NVM_DIR"

  # shellcheck source=/dev/null
  source "$NVM_DIR"/nvm.sh
  nvm install 'lts/*'
  npm completion > "$dotfiles"/.bash_profile.d/npm_completion.bash
}

function link_files() {
  ln -s "$dotfiles"/.npmrc "$HOME"/.npmrc
  ln -s "$dotfiles"/.gitconfig "$HOME"/.gitconfig
  ln -s "$dotfiles"/.bash_profile "$HOME"/.bash_profile
}

function do_install() {
  install_homebrew
  install_node
}

do_install
