

# Puppet-Pi #

Puppet Pi came about out of the need to have many raspberry pis work together to solve a single problem.

The idea is that I could write a Clojure program, and use the Akka framework to handle communication between pis. I could then uberjar the program, and distribute it to all the pis. The program would then run on all of them simultaneously.


There are three elements:

#### Puppet on a Raspberry Pi ####
An automated way to install puppet on a raspberry pi. Puppet will talk to the puppet master, who will assign it roles. Software will be installed based on roles.

#### PuppetMaster running on Ubuntu ####
An automated way to install a puppet master on ubuntu. The puppet master knows all of the software to install given a specific role. A file is kept in the puppet master that contains all of the roles, when this is updated it is pushed to all of the pis. On their next puppet run they will have all of the roles defined in that file.

At the moment the puppet master is designed to be run on Ubuntu (I run it in a virtual machine). Ideally, this should also be run on a Raspberry Pi.

#### Switcheroo running on the PuppetMaster machine ####
A website that allows you to upload / delete (java) programs. Also helps you decide which programs should be running on the Pis. Internally, this just updates the file that the puppet master knows about in terms of setting roles. Programs are uploaded to the puppet master so that it can be installed on pis.


### Puppet on a Raspberry Pi ###

#### Installation Instructions ####

Upload a Wheezy Armel image to your SD Card. Note these instructions have only been tested on 2013-05-29-wheezy-armel. Turn your Pi on, then run

sudo bash < <(curl https://raw.github.com/camswords/puppet-pi/master/scripts/setup_all.sh)

Your Pi will reboot at the end (to resize the filesystem). Following this, puppet 2.7.18 and ruby 1.9.3 should be installed.



#### PuppetMaster running on Ubuntu ####

#### Switcheroo running on the PuppetMaster machine ####