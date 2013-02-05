class java {

	file { "java-install-file":
		path   => "/opt/ejre-7u10-fcs-b18-linux-arm-vfp-client_headless-28_nov_2012.gz",
		ensure => present,
		source => "puppet:///modules/java/tmp/ejre-7u10-fcs-b18-linux-arm-vfp-client_headless-28_nov_2012.gz"
	}
	
	exec { "untar-install-file":
		command => "tar -xf ejre-7u10-fcs-b18-linux-arm-vfp-client_headless-28_nov_2012.gz",
		cwd     => "/opt",
		creates => "/opt/ejre1.7.0_10",
		path    => ["/bin"],
		require => File["java-install-file"]
	}
	
	file { "create-java-symlink":
		path    => "/usr/bin/java",
		ensure  => link,
		target  => "/opt/ejre1.7.0_10/bin/java"
	}
}