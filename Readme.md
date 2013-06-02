

# Puppet-Pi #

Puppet Pi makes it easy to distribute Java programs (jars) to many of your Raspberry Pis. This is essentially a Puppet / Puppet Master configuration with an accompanying website called Switcheroo that makes it easy to upload / delete programs, as well as making it easy to determine which of those programs should be running on your pis.

Puppet Pi came about out of the need to have many raspberry pis work together to solve a single problem. The idea is that I could write a Clojure program, and use the Akka framework to handle communication between pis. I could then uberjar the program, and distribute it to all the pis. The program would then run on all of them simultaneously.


There are three elements: Puppet, that needs to be installed on all of your Raspberry Pis, and PuppetMaster / Switcheroo, both of which should be on the same machine.


### Puppet on a Raspberry Pi ###

#### About ####
An automated way to install puppet on a raspberry pi. Puppet will talk to the puppet master, who will assign it roles. Programs will be installed and run based on roles that have been set.

#### Installation Instructions ####

Upload a Wheezy Armel image to your SD Card. Note these instructions have only been tested on 2013-05-29-wheezy-armel. Turn your Pi on, plug in the ethernet cable and log into your pi. Then run

sudo bash < <(curl https://raw.github.com/camswords/puppet-pi/master/scripts/setup_all.sh)

Your Pi will reboot at the end (to resize the filesystem). Following this, puppet 2.7.18 and ruby 1.9.3 should be installed.



### PuppetMaster / Switcheroo ###

#### About ####
The puppet master knows all of the programs that can be installed / run given a specific role. A file is kept in the puppet master that contains all of the roles, when this is updated it is pushed to all of the pis. On their next puppet run they will have all of the roles defined in that file. Having a role will trigger a program to be installed / run.

At the moment the puppet master is designed to be run on Ubuntu (I run it in a virtual machine). Ideally, this should also be run on a Raspberry Pi.

#### Install ####
Create a new virtual machine running Ubuntu. Note that this has only been tested using ubuntu-10.04.1-desktop-i386. Once loaded, in a terminal run

sudo apt-get install curl

and then

sudo bash < <(curl https://raw.github.com/camswords/puppet-pi/master/scripts/puppetmaster/setup_all.sh)




