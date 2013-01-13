
class hello_world (
	$jar_file => "helloworld-1.0-standalone.jar",
	$program_name => "helloworld"
) {

	file { "/opt/$program_name": 
		ensure => directory 
	}
	
	file { "/var/log/$program_name":
		ensure => directory
	}
	
	file { "/opt/$program_name/$jar_file":
		ensure => present,
		source => "puppet:///modules/hello_world/opt/$program_name/jar_file",
		require => File["/opt/$program_name"]
	}
	
	file { "/etc/init.d/$program_name":
		ensure => present,
		source => "puppet:///modules/hello_world/etc/init.d/$program_name",
		mode => 655
	}
	
	file { "/var/run/$program_name":
		ensure => directory 
	}
	
	service { "$program_name":
		ensure => running,
		require => [File["/etc/init.d/$program_name"], File["/opt/$program_name/$jar_file"], 
					File["/var/run/$program_name"], File["/var/log/$program_name"]]
	}
}


class hello_world::remove {

	service { "$program_name":
		ensure => stopped
	}
	
	file { "/opt/$program_name":
		ensure => absent,
		force => true,
		require => Service["$program_name"]
	}
	
	file { "/etc/init.d/$program_name":
		ensure => absent,
		require => Service["$program_name"]
	}
}