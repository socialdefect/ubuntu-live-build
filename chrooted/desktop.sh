#!/bin/bash

inchroot(){
        HOME=/root LC_ALL=C sudo chroot $HOME/live-build/chroot "$@"
}

## update apt
inchroot apt update

## install plasma desktop
inchroot apt install -y plasma-desktop xorg xinit sddm plasma-nm kate kwrite konsole dolphin kubuntu-driver-manager plasma-workspace-wayland plymouth-theme-ubuntu-logo

## install apps
inchroot apt install -y p7zip-full snapd  bash-completion ark vim nano less mlocate discover network-manager-openvpn  openvpn okular gwenview software-properties-qt kde-config-gtk-style kcalc kruler kcharselect ktorrent vlc kdepim libreoffice-kde plasma-nm ufw plasma-vault plank kubuntu-restricted-extras

## install gtk apps
inchroot apt install -y --no-install-recommends gparted libreoffice-writer


exit $?

