#!/bin/bash

sudo mount --bind /dev $HOME/live-build/chroot/dev
sudo mount --bind /run $HOME/live-build/chroot/run


exit $?
