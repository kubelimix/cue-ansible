package panos

panos_interface :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	panos_interface: {

		// Name of the interface to configure.

		if_name: string

		// Name of the zone for the interface. If the zone does not exist it is created but if the zone exists and it is not of the layer3 type the operation will fail.

		zone_name: string

		// Commit if changed

		commit?: bool

		// Whether or not to add default route with router learned via DHCP.

		create_default_route?: bool
	}
}

panos_lic :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	panos_lic: {

		// authcode to be applied

		auth_code: string

		// whether to apply authcode even if device is already licensed

		force?: bool
	}
}

panos_pg :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	panos_pg: {

		// name of the vulnerability profile

		vulnerability?: string

		// name of the file blocking profile

		file_blocking?: string

		// name of the security profile group

		pg_name: string

		// name of the spyware profile

		spyware?: string

		// name of the url filtering profile

		url_filtering?: string

		// name of the anti-virus profile

		virus?: string

		// commit if changed

		commit?: bool

		// name of the data filtering profile

		data_filtering?: string

		// name of the wildfire analysis profile

		wildfire?: string
	}
}

panos_cert_gen_ssh :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	panos_cert_gen_ssh: {

		// Certificate CN (common name) embedded in the certificate signature.

		cert_cn: string

		// Human friendly certificate name (not CN but just a friendly name).

		cert_friendly_name: string

		// IP address (or hostname) of PAN-OS device being configured.

		ip_address: string

		// Location of the filename that is used for the auth. Either I(key_filename) or I(password) is required.

		key_filename: string

		// Password credentials to use for auth. Either I(key_filename) or I(password) is required.

		password: string

		// Number of bits used by the RSA algorithm for the certificate generation.

		rsa_nbits?: string

		// Undersigning authority (CA) that MUST already be presents on the device.

		signed_by: string
	}
}

panos_admpwd :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	panos_admpwd: {

		// IP address (or hostname) of PAN-OS device

		ip_address: string

		// filename of the SSH Key to use for authentication

		key_filename: string

		// password to configure for admin on the PAN-OS device

		newpassword: string

		// username for initial authentication

		username?: string
	}
}

panos_dag_tags :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	panos_dag_tags: {

		// API key that can be used instead of I(username)/I(password) credentials.

		api_key?: string

		// commit if changed

		commit?: bool

		// The purpose / objective of the static Address Group

		description?: string

		// - Device groups are used for the Panorama interaction with Firewall(s). The group must exists on Panorama. If device group is not define we assume that we are contacting Firewall.

		devicegroup?: string

		// IP that will be registered with the given tag names.

		ip_to_register?: string

		// The action to be taken. Supported values are I(add)/I(update)/I(find)/I(delete).

		operation?: string

		// The list of the tags that will be added or removed from the IP address.

		tag_names?: string
	}
}

panos_import :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	panos_import: {

		// Category of file uploaded. The default is software.
		// See API > Import section of the API reference for category options.

		category?: string

		// Location of the file to import into device.

		file?: string

		// URL of the file that will be imported to device.

		url?: string

		// If C(no), SSL certificates will not be validated. Disabling certificate validation is not recommended.

		validate_certs?: bool
	}
}

panos_match_rule :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	panos_match_rule: {

		// Password credentials to use for auth unless I(api_key) is set.

		password: string

		// The inbound interface in a NAT rule.

		to_interface?: string

		// ID of the VSYS object.

		vsys_id: string

		// API key that can be used instead of I(username)/I(password) credentials.

		api_key?: string

		// URL category

		category?: string

		// The IP protocol number from 1 to 255.

		protocol?: string

		// The source zone.

		source_zone?: string

		// Username credentials to use for auth unless I(api_key) is set.

		username?: string

		// The application.

		application?: string

		// The destination IP address.

		destination_ip?: string

		// The source IP address.

		source_ip: string

		// The source port.

		source_port?: string

		// The source user or group.

		source_user?: string

		// The destination port.

		destination_port?: string

		// IP address (or hostname) of PAN-OS device being configured.

		ip_address: string

		// The destination zone.

		destination_zone?: string

		// Type of rule. Valid types are I(security) or I(nat).

		rule_type: string
	}
}

panos_object :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	panos_object: {

		// The filter match criteria to be used in a dynamic addressgroup definition.

		dynamic_value?: string

		// IP address (or hostname) of PAN-OS device or Panorama management console being configured.

		ip_address: string

		// Password credentials to use for authentication.

		password: string

		// The name of the service object.

		serviceobject?: string

		// The source port to be used in a service object definition.

		source_port?: string

		// Username credentials to use for authentication.

		username?: string

		// The name of the address object.

		addressobject?: string

		// The destination port to be used in a service object definition.

		destination_port?: string

		// - The name of the Panorama device group. The group must exist on Panorama. If device group is not defined it is assumed that we are contacting a firewall.

		devicegroup?: string

		// The IP protocol to be used in a service object definition.  Valid values are I(tcp) or I(udp).

		protocol?: string

		// The group of service objects used in a servicegroup definition.

		services?: string

		// The name of an object or rule tag.

		tag_name?: string

		// A group of address objects to be used in an addressgroup definition.

		static_value?: string

		// The IP address of the host or network in CIDR notation.

		address?: string

		// The type of address object definition.  Valid types are I(ip-netmask) and I(ip-range).

		address_type?: string

		// A static group of address objects or dynamic address group.

		addressgroup?: string

		// API key that can be used instead of I(username)/I(password) credentials.

		api_key?: string

		// - The color of the tag object.  Valid values are I(red, green, blue, yellow, copper, orange, purple, gray, light green, cyan, light gray, blue gray, lime, black, gold, and brown).

		color?: string

		// The description of the object.

		description?: string

		// The operation to be performed.  Supported values are I(add)/I(delete)/I(find).

		operation: string

		// A group of service objects.

		servicegroup?: string
	}
}

panos_restart :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	panos_restart: {
	}
}

panos_admin :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	panos_admin: {

		// password for admin user

		admin_password: string

		// username for admin user

		admin_username?: string

		// commit if changed

		commit?: bool

		// role for admin user

		role?: string
	}
}

panos_op :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	panos_op: {

		// IP address (or hostname) of PAN-OS device or Panorama management console being configured.

		ip_address: string

		// Password credentials to use for authentication.

		password: string

		// Username credentials to use for authentication.

		username?: string

		// API key that can be used instead of I(username)/I(password) credentials.

		api_key?: string

		// The OP command to be performed.

		cmd: string
	}
}

panos_query_rules :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	panos_query_rules: {

		// The destination port to be queried.

		destination_port?: string

		// Name of the destination security zone to be queried.

		destination_zone?: string

		// Password credentials to use for authentication.

		password: string

		// The source IP address to be queried.

		source_ip?: string

		// Username credentials to use for authentication.

		username?: string

		// The destination IP address to be queried.

		destination_ip?: string

		// The Panorama device group in which to conduct the query.

		devicegroup?: string

		// The protocol used to be queried.  Must be either I(tcp) or I(udp).

		protocol?: string

		// Name of the application or application group to be queried.

		application?: string

		// IP address (or hostname) of PAN-OS firewall or Panorama management console being queried.

		ip_address: string

		// Name of the rule tag to be queried.

		tag_name?: string

		// API key that can be used instead of I(username)/I(password) credentials.

		api_key?: string

		// Name of the source security zone to be queried.

		source_zone?: string

		// The source port to be queried.

		source_port?: string
	}
}

panos_sag :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	panos_sag: {

		// name of the dynamic address group

		sag_name: string

		// Tags to be associated with the address group

		tags?: string

		// API key that can be used instead of I(username)/I(password) credentials.

		api_key?: string

		// commit if changed

		commit?: bool

		// The purpose / objective of the static Address Group

		description?: string

		// - The name of the Panorama device group. The group must exist on Panorama. If device group is not defined it is assumed that we are contacting a firewall.

		devicegroup?: string

		// The operation to perform Supported values are I(add)/I(list)/I(delete).

		operation: string

		// Static filter user by the address group

		sag_match_filter?: [...]
	}
}

panos_security_rule :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	panos_security_rule: {

		// Name of the already defined file_blocking profile.

		file_blocking?: string

		// IP address (or hostname) of PAN-OS device being configured.

		ip_address: string

		// Whether to log at session end.

		log_end?: bool

		// The action to be taken.  Supported values are I(add)/I(update)/I(find)/I(delete).

		operation?: string

		// Name of the security rule.

		rule_name: string

		// - Security profile group that is already defined in the system. This property supersedes antivirus, vulnerability, spyware, url_filtering, file_blocking, data_filtering, and wildfire_analysis properties.

		group_profile?: string

		// Whether to log at session start.

		log_start?: bool

		// Password credentials to use for auth unless I(api_key) is set.

		password: string

		// API key that can be used instead of I(username)/I(password) credentials.

		api_key?: string

		// The category.

		category?: [...]

		// Name of the already defined data_filtering profile.

		data_filtering?: string

		// List of source zones.

		source_zone?: string

		// Name of the already defined wildfire_analysis profile.

		wildfire_analysis?: string

		// Commit configuration if changed.

		commit?: bool

		// - Device groups are used for the Panorama interaction with Firewall(s). The group must exists on Panorama. If device group is not define we assume that we are contacting Firewall.

		devicegroup?: string

		// List of services.

		service?: string

		// Description for the security rule.

		description?: string

		// Name of the already defined url_filtering profile.

		url_filtering?: string

		// Username credentials to use for auth unless I(api_key) is set.

		username?: string

		// Action to apply once rules maches.

		action?: string

		// Name of the already defined antivirus profile.

		antivirus?: string

		// List of destination addresses.

		destination_ip?: string

		// List of destination zones.

		destination_zone?: string

		// Use users to enforce policy for individual users or a group of users.

		source_user?: string

		// - If you are using GlobalProtect with host information profile (HIP) enabled, you can also base the policy on information collected by GlobalProtect. For example, the user access level can be determined HIP that notifies the firewall about the user's local configuration.

		hip_profiles?: string

		// Type of security rule (version 6.1 of PanOS and above).

		rule_type?: string

		// List of source addresses.

		source_ip?: string

		// Name of the already defined vulnerability profile.

		vulnerability?: string

		// List of applications.

		application?: string

		// Name of the already defined spyware profile.

		spyware?: string

		// Administrative tags that can be added to the rule. Note, tags must be already defined.

		tag_name?: string
	}
}

panos_mgtconfig :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	panos_mgtconfig: {

		// commit if changed

		commit?: bool

		// address of primary DNS server

		dns_server_primary?: string

		// address of secondary DNS server

		dns_server_secondary?: string

		// address of primary Panorama server

		panorama_primary?: string

		// address of secondary Panorama server

		panorama_secondary?: string
	}
}

panos_commit :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	panos_commit: {

		// Commit changes for specified VSYS

		commit_vsys?: [...]

		// IP address (or hostname) of PAN-OS device.

		ip_address: string

		// Password for authentication. If the value is not specified in the task, the value of environment variable C(ANSIBLE_NET_PASSWORD) will be used instead.

		password: string

		// Username for authentication. If the value is not specified in the task, the value of environment variable C(ANSIBLE_NET_USERNAME) will be used instead if defined. C(admin) will be used if nothing above is defined.

		username?: string

		// timeout for commit job

		timeout?: string

		// Commit changes made by specified admin

		commit_changes_by?: [...]

		// Commit description/comment

		description?: string

		// interval for checking commit job

		interval?: string

		// if commit should be synchronous

		sync?: bool
	}
}

panos_dag :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	panos_dag: {

		// commit if changed

		commit?: bool

		// dynamic filter user by the dynamic address group

		dag_filter: string

		// name of the dynamic address group

		dag_name: string
	}
}

panos_loadcfg :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	panos_loadcfg: {

		// commit if changed

		commit?: bool

		// configuration file to load

		file?: string
	}
}

panos_nat_rule :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	panos_nat_rule: {

		// Destination interface.

		to_interface?: string

		// type of source translation. Supported values are I(translated-address)/I(translated-address).

		snat_address_type?: string

		// type of source translation

		snat_type?: string

		// IP address (or hostname) of PAN-OS device being configured.

		ip_address: string

		// The action to be taken.  Supported values are I(add)/I(update)/I(find)/I(delete).

		operation: string

		// Password credentials to use for auth unless I(api_key) is set.

		password: string

		// name of the SNAT rule

		rule_name: string

		// list of source addresses

		source_ip?: string

		// Commit configuration if changed.

		commit?: bool

		// list of destination addresses

		destination_ip?: string

		// If Panorama, the device group to put this rule in.

		devicegroup?: string

		// dnat translated address

		dnat_address?: string

		// bidirectional flag

		snat_bidirectional?: bool

		// Source NAT translated address. Used with Static-IP translation.

		snat_static_address?: string

		// list of source zones

		source_zone: string

		// Tag for the NAT rule.

		tag_name?: string

		// The description

		description?: string

		// destination zone

		destination_zone: string

		// Username credentials to use for auth unless I(api_key) is set.

		username?: string

		// service

		service?: string

		// Source NAT translated address. Used with Dynamic-IP and Dynamic-IP-and-Port.

		snat_dynamic_address?: string

		// snat interface

		snat_interface?: string

		// snat interface address

		snat_interface_address?: string

		// API key that can be used instead of I(username)/I(password) credentials.

		api_key?: string

		// dnat translated port

		dnat_port?: string
	}
}

panos_set :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	panos_set: {

		// The 'xpath' for the commands configurable

		xpath: string

		// Xapi method name which supports 'xpath' or 'xpath' and 'element'

		command?: string

		// The 'element' for the 'xpath' if required

		element?: string

		// IP address or host FQDN of the target PAN-OS NVA

		ip_address: string

		// Password for the given 'username'

		password: string

		// User name for a user with admin rights on the PAN-OS NVA

		username?: string
	}
}

panos_check :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	panos_check: {

		// time waited between checks

		interval?: string

		// timeout of API calls

		timeout?: string
	}
}
