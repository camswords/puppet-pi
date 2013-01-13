
class led_fun_and_games {

	file { "/tmp/led_fun":
		ensure => present,
		content => "cam was here!",
		mode => 644
	}

}


class led_fun_and_games::remove {

	file { "/tmp/led_fun":
		ensure => absent,
		force => true
	}

}