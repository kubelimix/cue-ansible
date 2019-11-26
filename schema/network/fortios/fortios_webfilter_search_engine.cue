package ansible

module: fortios_webfilter_search_engine: {
	module:            "fortios_webfilter_search_engine"
	short_description: "Configure web filter search engines in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify webfilter feature and search_engine category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
	]

	version_added: "2.8"
	author: [
		"Miguel Angel Munoz (@mamunozgonzalez)",
		"Nicolas Thomas (@thomnico)",
	]
	notes: [
		"Requires fortiosapi library developed by Fortinet",
		"Run as a local_action in your playbook",
	]
	requirements: [
		"fortiosapi>=0.9.8",
	]
	options: {
		host: {
			description: [
				"FortiOS or FortiGate IP address.",
			]
			type:     "str"
			required: false
		}
		username: {
			description: [
				"FortiOS or FortiGate username.",
			]
			type:     "str"
			required: false
		}
		password: {
			description: [
				"FortiOS or FortiGate password.",
			]
			type:    "str"
			default: ""
		}
		vdom: {
			description: [
				"Virtual domain, among those defined previously. A vdom is a virtual instance of the FortiGate that can be configured and used as a different unit.",
			]

			type:    "str"
			default: "root"
		}
		https: {
			description: [
				"Indicates if the requests towards FortiGate must use HTTPS protocol.",
			]
			type:    "bool"
			default: true
		}
		ssl_verify: {
			description: [
				"Ensures FortiGate certificate must be verified by a proper CA.",
			]
			type:          "bool"
			default:       true
			version_added: 2.9
		}
		state: {
			description: [
				"Indicates whether to create or remove the object. This attribute was present already in previous version in a deeper level. It has been moved out to this outer level.",
			]

			type:     "str"
			required: false
			choices: [
				"present",
				"absent",
			]
			version_added: 2.9
		}
		webfilter_search_engine: {
			description: [
				"Configure web filter search engines.",
			]
			default: null
			type:    "dict"
			suboptions: {
				state: {
					description: [
						"B(Deprecated)",
						"Starting with Ansible 2.9 we recommend using the top-level 'state' parameter.",
						"HORIZONTALLINE",
						"Indicates whether to create or remove the object.",
					]
					type:     "str"
					required: false
					choices: [
						"present",
						"absent",
					]
				}
				charset: {
					description: [
						"Search engine charset.",
					]
					type: "str"
					choices: [
						"utf-8",
						"gb2312",
					]
				}
				hostname: {
					description: [
						"Hostname (regular expression).",
					]
					type: "str"
				}
				name: {
					description: [
						"Search engine name.",
					]
					required: true
					type:     "str"
				}
				query: {
					description: [
						"Code used to prefix a query (must end with an equals character).",
					]
					type: "str"
				}
				safesearch: {
					description: [
						"Safe search method. You can disable safe search, add the safe search string to URLs, or insert a safe search header.",
					]
					type: "str"
					choices: [
						"disable",
						"url",
						"header",
					]
				}
				safesearch_str: {
					description: [
						"Safe search parameter used in the URL.",
					]
					type: "str"
				}
				url: {
					description: [
						"URL (regular expression).",
					]
					type: "str"
				}
			}
		}
	}
}