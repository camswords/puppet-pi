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
chown -R puppet:puppet /etc/puppet
chmod 664 /etc/puppet/modules/puppet_agent/files/etc/puppet/server_tags
chmod 664 /etc/puppet/modules/puppet_agent/files/etc/puppet/enforcer.pp
service puppetmaster start

# install switcheroo
git clone git://github.com/camswords/switcheroo.git /opt/switcheroo
apt-get -y install rubygems
gem install rubygems-update
/var/lib/gems/1.8/bin/update_rubygems
gem install bundler
apt-get -y install ruby1.8-dev libsqlite3-ruby libsqlite3-dev g++
cd /opt/switcheroo
bundle install

# create a switcheroo user
useradd switcheroo
usermod -G puppet switcheroo
chown -R switcheroo:switcheroo /opt/switcheroo

# setup run / log directories
mkdir /var/log/switcheroo
chown -R switcheroo:switcheroo /var/log/switcheroo

# create the init.d script
cp /opt/switcheroo/script/etc/init.d/switcheroo /etc/init.d/switcheroo
chmod 755 /etc/init.d/switcheroo

# start switcheroo
/etc/init.d/switcheroo start