
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

	# this is a hack to ensure that the service will stop. This doesn't require the service to be there to pass.
	exec { "stop_program":
		command => "kill -9 `cat /var/run/$program_name/$program_name.pid 2>/dev/null` 2>/dev/null; echo 'this echo is just to make sure it returns exit code 0' >/dev/null"
	}
	
	file { "/opt/$program_name":
		ensure => absent,
		force => true,
		require => Exec["stop_program"]
	}
	
	file { "/var/log/$program_name":
		ensure => absent,
		force => true,
		require => Exec["stop_program"]
	}
	
	file { "/etc/init.d/$program_name":
		ensure => absent,
		require => Exec["stop_program"]
	}
}