apt-get -y install --no-install-recommends libdbus-1-3

# The netboot installs the VirtualBox support (old) so we have to remove it
/etc/init.d/virtualbox-ose-guest-utils stop
rmmod vboxguest
aptitude -y purge virtualbox-ose-guest-x11 virtualbox-ose-guest-dkms virtualbox-ose-guest-utils
aptitude -y install dkms

CURDIR=$(PWD)
mount -t iso9660 -o loop "linux.iso" /mnt
tar xzvf /mnt/VMware*.tar.gz -C /tmp
cd /tmp/vmware-tools-distrib/
./vmware-install.pl -d
cd ${CURDIR}
umount /mnt
rm -rf linux.iso

