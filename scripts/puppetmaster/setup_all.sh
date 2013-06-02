#!/bin/bash

# ensure puppet repos are available, update all packages
wget http://apt.puppetlabs.com/puppetlabs-release-lucid.deb
dpkg -i puppetlabs-release-lucid.deb
apt-get update

# install the puppet master 2.7.18
apt-get -y install puppet-common=2.7.18-1puppetlabs1
apt-get -y install puppetmaster-common=2.7.18-1puppetlabs1
apt-get -y install puppetmaster=2.7.18-1puppetlabs1

# install git
apt-get -y install git-core


# get the puppetmaster code from puppet-pi
service puppetmaster stop
rm -rf /etc/puppet
git clone git://github.com/camswords/puppet-pi.git /etc/puppet
service puppetmaster start


# install switcheroo
git clone git://github.com/camswords/switcheroo.git /opt/switcheroo
apt-get -y install rubygems
gem install rubygems-update
/var/lib/gems/1.8/bin/update_rubygems
gem install bundler
apt-get -y install ruby1.8-dev libsqlite3-ruby libsqlite3-dev g++
bundle install

