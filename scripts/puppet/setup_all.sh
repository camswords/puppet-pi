#!/bin/bash
bash < <(curl https://raw.github.com/camswords/puppet-pi/master/scripts/puppet/expand_filesystem.sh)
bash < <(curl https://raw.github.com/camswords/puppet-pi/master/scripts/puppet/set_timezone_to_sydney.sh)
bash < <(curl https://raw.github.com/camswords/puppet-pi/master/scripts/puppet/install_puppet.sh)
reboot


