class truth::enforcer {

	include java

	if has_role("hello_world") {
		include hello_world
	} else {
		include hello_world::remove
	}
}