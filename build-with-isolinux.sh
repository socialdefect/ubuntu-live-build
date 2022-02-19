#!/bin/bash

cd $HOME/live/build/image/

cat <<EOF> isolinux/isolinux.cfg
UI vesamenu.c32MENU TITLE Boot Menu
DEFAULT linux
TIMEOUT 600
MENU RESOLUTION 640 480
MENU COLOR border       30;44   #40ffffff #a0000000 std
MENU COLOR title        1;36;44 #9033ccff #a0000000 std
MENU COLOR sel          7;37;40 #e0ffffff #20ffffff all
MENU COLOR unsel        37;44   #50ffffff #a0000000 std
MENU COLOR help         37;40   #c0ffffff #a0000000 std
MENU COLOR timeout_msg  37;40   #80ffffff #00000000 std
MENU COLOR timeout      1;37;40 #c0ffffff #00000000 std
MENU COLOR msg07        37;40   #90ffffff #a0000000 std
MENU COLOR tabmsg       31;40   #30ffffff #00000000 stdLABEL linux
 MENU LABEL Try Ubuntu FS
 MENU DEFAULT
 KERNEL /casper/vmlinuz
 APPEND initrd=/casper/initrd boot=casperLABEL linux
 MENU LABEL Try Ubuntu FS (nomodeset)
 MENU DEFAULT
 KERNEL /casper/vmlinuz
 APPEND initrd=/casper/initrd boot=casper nomodeset
EOF

sudo apt install -y syslinux-common && \
cp /usr/lib/ISOLINUX/isolinux.bin isolinux/ && \
cp /usr/lib/syslinux/modules/bios/* isolinux/

sudo xorriso \
   -as mkisofs \
   -iso-level 3 \
   -full-iso9660-filenames \
   -volid "Ubuntu KDE" \
   -output "../ubuntu-kde.iso" \
 -isohybrid-mbr /usr/lib/ISOLINUX/isohdpfx.bin \
 -eltorito-boot \
     isolinux/isolinux.bin \
     -no-emul-boot \
     -boot-load-size 4 \
     -boot-info-table \
     --eltorito-catalog isolinux/isolinux.cat \
 -eltorito-alt-boot \
     -e /EFI/boot/efiboot.img \
     -no-emul-boot \
     -isohybrid-gpt-basdat \
 -append_partition 2 0xef EFI/boot/efiboot.img \
   "$HOME/live-build/image"


exit $?
