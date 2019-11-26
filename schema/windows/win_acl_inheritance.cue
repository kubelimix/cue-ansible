package ansible

module: win_acl_inheritance: {
	module:            "win_acl_inheritance"
	version_added:     "2.1"
	short_description: "Change ACL inheritance"
	description: [
		"Change ACL (Access Control List) inheritance and optionally copy inherited ACE's (Access Control Entry) to dedicated ACE's or vice versa.",
	]
	options: {
		path: {
			description: [
				"Path to be used for changing inheritance",
			]
			required: true
			type:     "path"
		}
		state: {
			description: [
				"Specify whether to enable I(present) or disable I(absent) ACL inheritance.",
			]
			type: "str"
			choices: ["absent", "present"]
			default: "absent"
		}
		reorganize: {
			description: [
				"For P(state) = I(absent), indicates if the inherited ACE's should be copied from the parent directory. This is necessary (in combination with removal) for a simple ACL instead of using multiple ACE deny entries.",
				"For P(state) = I(present), indicates if the inherited ACE's should be deduplicated compared to the parent directory. This removes complexity of the ACL structure.",
			]

			type:    "bool"
			default: false
		}
	}
	seealso: [{
		module: "win_acl"
	}, {
		module: "win_file"
	}, {
		module: "win_stat"
	}]
	author: ["Hans-Joachim Kliemeck (@h0nIg)"]
}