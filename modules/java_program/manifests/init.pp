
class java_program ($jar_file, $program_name) {

	file { "/opt/$program_name": 
		ensure => directory 
	}
	
	file { "/var/log/$program_name":
		ensure => directory
	}
	
	file { "/opt/$program_name/$jar_file":
		ensure => present,
		source => "puppet:///modules/java_program/opt/$program_name/$jar_file",
		require => File["/opt/$program_name"]
	}
	
	file { "/etc/init.d/$program_name":
		ensure => present,
		content => template("java_program/etc/init.d/control-script.erb"),
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


class java_program::remove ($program_name) {

	# unfortunately, and error will occur when attempting to stop the service when it doesn't exist. I don't know how to fix this yet.
	service { "$program_name":
		ensure => stopped,
	}
	
	file { "/opt/$program_name":
		ensure => absent,
		force => true,
		require => Service["$program_name"]
	}
	
	file { "/var/log/$program_name":
		ensure => absent,
		force => true,
		require => Service["$program_name"]
	}
	
	file { "/etc/init.d/$program_name":
		ensure => absent,
		require => Service["$program_name"]
	}
}