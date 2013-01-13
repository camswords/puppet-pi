
class hello_world {

	file { "/opt/helloworld": 
		ensure => directory 
	}
	
	file { "/opt/helloworld/helloworld-1.0-standalone.jar":
		ensure => present,
		source => "puppet:///modules/helloworld/opt/helloworld/helloworld-1.0-standalone.jar",
		require => File["/opt/helloworld"]
	}
	
	file { "/etc/init.d/helloworld":
		ensure => present,
		source => "puppet:///modules/helloworld/etc/init.d/helloworld",
		mode => 655
	}
	
	service { "helloworld":
		hasstatus => false,
		ensure => running,
		require => [File["/etc/init.d/helloworld"], File["/opt/helloworld/helloworld-1.0-standalone.jar"]]
	}
}


class hello_world::remove {

	service { "helloworld":
		hasstatus => false,
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