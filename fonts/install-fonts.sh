#!/bin/sh
sudo pacman -Syu ttf-bitstram-vera ttf-inconsolata ttf-ubuntu-font-family ttf-dejavu ttf-freefont ttf-linux-libertine ttf-liberation

yaourt -S ttf-ms-fonts ttf-vista-fonts ttf-monaco﻿ ttf-qurancomplex-fonts

sudo ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d

sudo pacman -S infinality-bundle infinality-bundle-multilib
