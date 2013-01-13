
class hello_world {

	file { "/opt/helloworld": 
		ensure => directory 
	}
	
	file { "/var/log/helloworld":
		ensure => directory
	}
	
	file { "/opt/helloworld/helloworld-1.0-standalone.jar":
		ensure => present,
		source => "puppet:///modules/hello_world/opt/helloworld/helloworld-1.0-standalone.jar",
		require => File["/opt/helloworld"]
	}
	
	file { "/etc/init.d/helloworld":
		ensure => present,
		source => "puppet:///modules/hello_world/etc/init.d/helloworld",
		mode => 655
	}
	
	file { "/var/run/helloworld":
		ensure => directory 
	}
	
	service { "helloworld":
		ensure => running,
		require => [File["/etc/init.d/helloworld"], File["/opt/helloworld/helloworld-1.0-standalone.jar"], 
					File["/var/run/helloworld"], File["/var/log/helloworld"]]
	}
}


class hello_world::remove {

	service { "helloworld":
		ensure => stopped
	}
	
	file { "/opt/helloworld":
		ensure => absent,
		force => true,
		require => Service["helloworld"]
	}
	
	file { "/etc/init.d/helloworld":
		ensure => absent,
		require => Service["helloworld"]
	}
}