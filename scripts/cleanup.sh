# Remove items used for building, since they aren't needed anymore
apt-get -y remove linux-headers-$(uname -r) build-essential
apt-get -y autoremove

#Clean up tmp
rm -rf /tmp/*

sleep 3

exit