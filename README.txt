Requirements:

The script can install required software for the build.
It should work fine on recent Ubuntu systems but on Debian
you might need to upgrade debootstrap from a backports repository

CONFIG

These scripts are hard coded! You can edit desktop.sh to include
your prefered applications or install a different desktop environment.
If you edit any of the other files be sure to check all other scripts too for
they might need to include these changes too.

AUTOMATED INSTALL

1. Extract the live-build directory to your home folder
2. Run: ./run-all.sh


MANUAL EXECUTION:
When the automated install fails you might want to try to
execute the scripts manually so you can debug.
 
You can execute them in the following order:

0. build-requirements.sh
1. bootstrap.sh
2. mount.sh
3. chrooted/mount.sh
4. chrooted/setup.sh
5. chrooted/desktop.sh
6. chrooted/configure.sh
7. unmount.sh
8. prepare-iso.sh
9. Option 1: build-iso.sh (GRUB menu)
   Option 2: build-with-isolinux.sh (isolinux menu)
11. Test iso in Virtualbox or write it to DVD/USB
10. Run cleanup.sh to delete iso and all data in chroot and image folders 




CREDITS 

By Arjan van Lent, aka socialdefect 2022
License: WTFPL

This script was based off the HOWTO by Marcos Vallim at:
https://itnext.io/how-to-create-a-custom-ubuntu-live-from-scratch-dd3b3f213$


