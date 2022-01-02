#!/usr/bin/env bash

bash_profile_d="$HOME"/.dotfiles/.bash_profile.d

if [ -d "$bash_profile_d" ]; then
  for config in "$bash_profile_d"/*.bash; do
    [ -f "$config" ] || continue
    # shellcheck source=/dev/null
    source "$config"
  done
fi
