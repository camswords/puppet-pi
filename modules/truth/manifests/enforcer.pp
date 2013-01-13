class truth::enforcer {

	if has_role("led_fun_and_games") {
		include led_fun_and_games
	} else {
		include led_fun_and_games::remove
	}
}