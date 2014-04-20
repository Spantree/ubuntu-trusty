apt-get -y update
apt-get -y install git-core
mkdir /var/puppet-init
apt-get -y install build-essential ruby-dev && touch /var/puppet-init/librarian-base-packages
apt-get -y install libgemplugin-ruby && touch /var/puppet-init/librarian-libgemplugin-ruby
apt-get clean

sleep 3

gem install librarian-puppet && touch /var/puppet-init/librarian-puppet-installed

sleep 3
