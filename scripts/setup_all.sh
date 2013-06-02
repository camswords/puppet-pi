#!/bin/bash
bash < <(curl https://raw.github.com/camswords/puppet-pi/master/scripts/expand_filesystem.sh)
bash < <(curl https://raw.github.com/camswords/puppet-pi/master/scripts/set_timezone_to_sydney.sh)
bash < <(curl https://raw.github.com/camswords/puppet-pi/master/scripts/install_puppet.sh)
reboot


