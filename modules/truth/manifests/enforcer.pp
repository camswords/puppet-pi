class truth::enforcer {

	include sun_java_6

	if has_role("hello_world") {
		include hello_world
	} else {
		include hello_world::remove
	}
}