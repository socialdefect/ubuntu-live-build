#!/bin/bash

inchroot(){
        HOME=/root LC_ALL=C sudo chroot $HOME/live-build/chroot "$@"
}


inchroot apt-get autoremove -y

inchroot dpkg-reconfigure locales

inchroot dpkg-reconfigure resolvconf

sudo cat <<EOF > $HOME/live-build/chroot/root/NetworkManager.conf
[main]
rc-manager=resolvconf
plugins=ifupdown,keyfile
dns=dnsmasq
[ifupdown]
managed=false
EOF

inchroot cp /root/NetworkManager.conf $HOME/live-build/chroot/etc/NetworkManager/NetworkManager.conf

inchroot dpkg-reconfigure network-manager

inchroot truncate -s 0 /etc/machine-id

inchroot rm /sbin/initctl

inchroot dpkg-divert --rename --remove /sbin/initctl

inchroot apt-get clean

inchroot rm -rf /tmp/* ~/.bash_history

inchroot umount /proc

inchroot umount /sys

inchroot umount /dev/pts


exit $?

