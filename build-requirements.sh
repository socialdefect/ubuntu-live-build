#!/bin/bash

sudo apt-get install \
    binutils \
    debootstrap \
    squashfs-tools \
    xorriso \
    grub-pc-bin \
    grub-efi-amd64-bin \
    mtools \
    ubuntu-keyring

mkdir $HOME/live-build

if [ -f /usr/share/debootstrap/scripts/focals ]; then
	echo 'Found debootstrap config for Ubuntu Focal' && sleep 3
else
	clear
	echo 'Could not find a debootstrap config for Ubuntu Focal'
	echo 'You might need to upgrade debootstrap from backports'
	echo 'Please fix the problem and try again'
	exit 1
fi

exit $?
