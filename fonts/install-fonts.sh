#!/bin/sh
sudo pacman -Syu ttf-bitstream-vera ttf-inconsolata ttf-ubuntu-font-family ttf-dejavu ttf-freefont ttf-linux-libertine ttf-liberation

yaourt -S ttf-ms-fonts
yaourt -S ttf-vista-fonts
yaourt -S ttf-monaco
yaourt -S ttf-qurancomplex-fonts
yaourt -S powerline-fonts-git

sudo ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d

sudo pacman -S infinality-bundle infinality-bundle-multilib
