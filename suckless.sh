#!/bin/bash

# ███████╗██╗   ██╗ ██████╗██╗  ██╗██╗     ███████╗███████╗███████╗
# ██╔════╝██║   ██║██╔════╝██║ ██╔╝██║     ██╔════╝██╔════╝██╔════╝
# ███████╗██║   ██║██║     █████╔╝ ██║     █████╗  ███████╗███████╗
# ╚════██║██║   ██║██║     ██╔═██╗ ██║     ██╔══╝  ╚════██║╚════██║
# ███████║╚██████╔╝╚██████╗██║  ██╗███████╗███████╗███████║███████║
# ╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚══════╝

install() {
  rm -rfv "$HOME/Sources/$1"
  if git clone https://git.suckless.org/"$1" "$HOME"/Sources/"$1"; then
    if git -C "$HOME"/Sources/"$1" apply "$(cd "$(dirname "$0")"; pwd -P)/patches/$1.diff"; then
      sudo make clean install -C "$HOME"/Sources/"$1"
    fi
  fi
}

install dwm
install slock
