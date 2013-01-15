
class puppet_agent {

	file { "/etc/puppet/puppet.conf":
		ensure => present,
		source => "puppet:///modules/puppet_agent/etc/puppet/puppet.conf"
	}
	
	file { "/etc/puppet/server_tags":
		ensure => present,
		source => "puppet:///modules/puppet_agent/etc/puppet/server_tags",
		mode => 0644
	}
	
}