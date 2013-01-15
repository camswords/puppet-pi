class truth::enforcer {

	notice("$fqdn, I see that you're a: $server_tags")

	include java

	if has_role("helloworld") {
		class { 'java_program': jar_file => "helloworld-1.0-standalone.jar", program_name => "helloworld" }	
	} else {
		class { 'java_program::remove': program_name => "helloworld" }
	}
	
	if has_role("puppet_agent") {
		include puppet_agent
	}
}