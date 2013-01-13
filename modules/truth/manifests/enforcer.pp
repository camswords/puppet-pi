class truth::enforcer {

	include java

	if has_role("hello_world") {
		class { 'java_program': jar_file => "helloworld-1.0-standalone.jar", program_name => "hello_world" }	
	} else {
		class { 'java_program::remove': program_name => "hello_world" }
	}
}