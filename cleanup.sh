#!/bin/bash

clear

echo 'This will delete all data in your chroot and image directories'

{
echo -n "Are you sure you want to continue? (YES/NO):";
read;
if [ ${REPLY} != 'YES'  ]; then
	exit 1
fi
}


sudo rm -rf $HOME/live-build/chroot $HOME/live-build/image $HOME/live-build/ubuntu-kde.iso
echo

exit $?

