#!/bin/bash

# ensure puppet repos are available, update all packages
wget http://apt.puppetlabs.com/puppetlabs-release-lucid.deb
dpkg -i puppetlabs-release-lucid.deb
apt-get update

# install the puppet master 2.7.18
apt-get install puppet-common=2.7.18-1puppetlabs1
apt-get install puppetmaster-common=2.7.18-1puppetlabs1
apt-get install puppetmaster=2.7.18-1puppetlabs1

# install git
apt-get install git-core


# get the puppetmaster code from puppet-pi
service puppetmaster stop
rm -rf /etc/puppet
git clone git://github.com/camswords/puppet-pi.git /etc/puppet
service puppetmaster start


# install switcheroo
git clone git://github.com/camswords/switcheroo.git /opt/switcheroo
apt-get install rubygems
gem install rubygems-update
/var/lib/gems/1.8/bin/update_rubygems
gem install bundler
apt-get install ruby1.8-dev libsqlite3-ruby libsqlite3-dev g++
bundle install

