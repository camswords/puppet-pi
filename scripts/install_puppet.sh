#!/bin/sh

# Set the timezone to Sydney
ln -sf /usr/share/zoneinfo/Australia/Sydney /etc/localtime 

# update the list of packages that can be installed
apt-get update

# install puppet
apt-get install puppet-common






