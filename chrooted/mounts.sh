#!/bin/bash

inchroot(){
	HOME=/root LC_ALL=C sudo chroot $HOME/live-build/chroot "$@"
}

inchroot mount none -t proc /proc
inchroot mount none -t sysfs /sys
inchroot mount none -t devpts /dev/pts

#inchroot export HOME=/root
#inchroot export LC_ALL=C

exit $?
