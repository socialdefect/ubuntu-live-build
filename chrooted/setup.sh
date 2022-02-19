#!/bin/bash

inchroot(){
        HOME=/root LC_ALL=C sudo chroot $HOME/live-build/chroot "$@"
}

cd $HOME/live-build/

echo "ubuntu-kde-live" > hostname
sudo cp hostname $HOME/live-build/chroot/etc/

cat <<EOF > sources.list
deb http://nl.archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse
deb-src http://nl.archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse
deb http://nl.archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse
deb-src http://nl.archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse
deb http://nl.archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse
deb-src http://nl.archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse
EOF
sudo rm $HOME/live-build/chroot/ect/apt/sources.list
sudo cp sources.list $HOME/live-build/chroot/ect/apt/

inchroot apt-get update

inchroot apt dist-upgrade -y

inchroot apt-get install -y libterm-readline-gnu-perl systemd-sysv

inchroot dbus-uuidgen > /etc/machine-id

inchroot ln -fs /etc/machine-id /var/lib/dbus/machine-id

inchroot dpkg-divert --local --rename --add /sbin/initctl

inchroot ln -s /bin/true /sbin/initctl

inchroot apt-get install -y \
    sudo \
    ubuntu-standard \
    casper \
    lupin-casper \
    discover \
    laptop-detect \
    os-prober \
    network-manager \
    resolvconf \
    net-tools \
    wireless-tools \
    wpagui \
    locales \
    grub-common \
    grub-gfxpayload-lists \
    grub-pc \
    grub-pc-bin \
    grub2-common

inchroot apt-get install -y --no-install-recommends linux-generic

inchroot apt-get install -y ubiquity ubiquity-casper ubiquity-frontend-kde ubiquity-slideshow-ubuntu ubiquity-ubuntu-artwork


exit $?
