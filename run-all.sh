#!/bin/bash

cd $HOME/live-build/

clear
echo "Installing build requirements" && sleep 3

./build-requirements.sh

clear
echo "Bootstrapping the base system" && sleep 3

./bootstrap.sh

clear
echo "Mounting required filesystems" && sleep 3

./mount.sh

clear
echo "Mounting filesystems inside chroot"  && sleep 3
./chrooted/mounts.sh

clear
echo "Setting up the chroot environment" && sleep 3

./chrooted/setup.sh

clear
echo "Installing KDE desktop and other basic applications"  && sleep 3

./chrooted/desktop.sh

clear
echo "Configuring and cleaning up the chroot" && sleep 3

./chrooted/configure.sh

clear
echo "Unmounting filesystems" && sleep 3

./unmount.sh

clear
echo "preparing required files for the ISO"  && sleep 3

./prepare-iso.sh

clear
echo "Trying to build the image using: ./build-iso.sh"  && sleep 3
echo
./build-iso.sh

if [ -f $HOME/live-build/ubuntu-kde.iso ]; then
	clear
	echo && echo '---------' && echo
	echo 'The build was succesful!'
	echo "Your iso is located at:"
	echo "$PWD/`ls *iso`"
	exit 0
else
	echo && echo '---------' && echo
	echo "Building the ISO failed. Will try again using isolinux:"   && sleep 3
	echo
	echo "build-with-isolinux.sh"
	./build-with-isolinux.sh
	if [ -f $HOME/live-build/ubuntu-kde.iso ]; then
		clear
        	echo && echo '---------' && echo
        	echo 'The build was succesful!'
        	echo "Your iso is located at:"
        	echo "$HOME/live-build/ubuntu-kde.iso"
        	exit 0
	else
		echo && echo '---------' && echo
		echo "Building the ISO failed again.."
		echo "Please check console output and try running the scripts manually"
		exit 1
	fi
fi


exit $?
