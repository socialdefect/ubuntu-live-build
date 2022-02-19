#!/bin/bash

sudo debootstrap \
   --arch=amd64 \
   --variant=minbase \
   focal \
   $HOME/live-build/chroot \
   http://nl.archive.ubuntu.com/ubuntu/

exit $?
