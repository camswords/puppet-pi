class gpio {

	define export_gpio {
		exec { "echo ${gpio_number} > /sys/class/gpio/export": 
			creates => "/sys/class/gpio/gpio${gpio_number}" 
		}
	}

	export_gpio { [0, 1, 4, 7, 8, 9, 10, 11, 14, 15, 17, 18, 21, 22, 23, 24, 25]: }
}