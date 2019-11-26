package ansible

module: aruba_config: {
	module:            "aruba_config"
	version_added:     "2.4"
	author:            "James Mighion (@jmighion)"
	short_description: "Manage Aruba configuration sections"
	description: [
		"Aruba configurations use a simple block indent file syntax for segmenting configuration into sections.  This module provides an implementation for working with Aruba configuration sections in a deterministic way.",
	]

	extends_documentation_fragment: "aruba"
	options: {
		lines: {
			description: [
				"The ordered set of commands that should be configured in the section.  The commands must be the exact same commands as found in the device running-config.  Be sure to note the configuration command syntax as some commands are automatically modified by the device config parser.",
			]

			aliases: ["commands"]
		}
		parents: description: [
			"The ordered set of parents that uniquely identify the section or hierarchy the commands should be checked against.  If the parents argument is omitted, the commands are checked against the set of top level or global commands.",
		]

		src: description: [
			"Specifies the source path to the file that contains the configuration or configuration template to load.  The path to the source file can either be the full path on the Ansible control host or a relative path from the playbook or role root directory.  This argument is mutually exclusive with I(lines), I(parents).",
		]

		before: description: [
			"The ordered set of commands to push on to the command stack if a change needs to be made.  This allows the playbook designer the opportunity to perform configuration commands prior to pushing any changes without affecting how the set of commands are matched against the system.",
		]

		after: description: [
			"The ordered set of commands to append to the end of the command stack if a change needs to be made.  Just like with I(before) this allows the playbook designer to append a set of commands to be executed after the command set.",
		]

		match: {
			description: [
				"Instructs the module on the way to perform the matching of the set of commands against the current device config.  If match is set to I(line), commands are matched line by line.  If match is set to I(strict), command lines are matched with respect to position.  If match is set to I(exact), command lines must be an equal match.  Finally, if match is set to I(none), the module will not attempt to compare the source configuration with the running configuration on the remote device.",
			]

			default: "line"
			choices: ["line", "strict", "exact", "none"]
		}
		replace: {
			description: [
				"Instructs the module on the way to perform the configuration on the device.  If the replace argument is set to I(line) then the modified lines are pushed to the device in configuration mode.  If the replace argument is set to I(block) then the entire command block is pushed to the device in configuration mode if any line is not correct.",
			]

			default: "line"
			choices: ["line", "block"]
		}
		backup: {
			description: [
				"This argument will cause the module to create a full backup of the current C(running-config) from the remote device before any changes are made. If the C(backup_options) value is not given, the backup file is written to the C(backup) folder in the playbook root directory. If the directory does not exist, it is created.",
			]

			type:    "bool"
			default: "no"
		}
		running_config: {
			description: [
				"The module, by default, will connect to the remote device and retrieve the current running-config to use as a base for comparing against the contents of source.  There are times when it is not desirable to have the task get the current running-config for every task in a playbook.  The I(running_config) argument allows the implementer to pass in the configuration to use as the base config for comparison.",
			]

			aliases: ["config"]
		}
		save_when: {
			description: [
				"When changes are made to the device running-configuration, the changes are not copied to non-volatile storage by default.  Using this argument will change that before.  If the argument is set to I(always), then the running-config will always be copied to the startup configuration and the I(modified) flag will always be set to True.  If the argument is set to I(modified), then the running-config will only be copied to the startup configuration if it has changed since the last save to startup configuration.  If the argument is set to I(never), the running-config will never be copied to the startup configuration.  If the argument is set to I(changed), then the running-config will only be copied to the startup configuration if the task has made a change.",
			]

			default: "never"
			choices: ["always", "never", "modified", "changed"]
			version_added: "2.5"
		}
		diff_against: {
			description: [
				"When using the C(ansible-playbook --diff) command line argument the module can generate diffs against different sources.",
				"When this option is configure as I(startup), the module will return the diff of the running-config against the startup configuration.",
				"When this option is configured as I(intended), the module will return the diff of the running-config against the configuration provided in the C(intended_config) argument.",
				"When this option is configured as I(running), the module will return the before and after diff of the running-config with respect to any changes made to the device configuration.",
			]

			choices: ["startup", "intended", "running"]
		}
		diff_ignore_lines: description: [
			"Use this argument to specify one or more lines that should be ignored during the diff.  This is used for lines in the configuration that are automatically updated by the system.  This argument takes a list of regular expressions or exact line matches.",
		]

		intended_config: description: [
			"The C(intended_config) provides the master configuration that the node should conform to and is used to check the final running-config against.   This argument will not modify any settings on the remote device and is strictly used to check the compliance of the current device's configuration against.  When specifying this argument, the task should also modify the C(diff_against) value and set it to I(intended).",
		]

		encrypt: {
			description: [
				"This allows an Aruba controller's passwords and keys to be displayed in plain text when set to I(false) or encrypted when set to I(true). If set to I(false), the setting will re-encrypt at the end of the module run. Backups are still encrypted even when set to I(false).",
			]

			type:          "bool"
			default:       "yes"
			version_added: "2.5"
		}
		backup_options: {
			description: [
				"This is a dict object containing configurable options related to backup file path. The value of this option is read only when C(backup) is set to I(yes), if C(backup) is set to I(no) this option will be silently ignored.",
			]

			suboptions: {
				filename: description: [
					"The filename to be used to store the backup configuration. If the the filename is not given it will be generated based on the hostname, current time and date in format defined by <hostname>_config.<current-date>@<current-time>",
				]

				dir_path: {
					description: [
						"This option provides the path ending with directory name in which the backup configuration file will be stored. If the directory does not exist it will be first created and the filename is either the value of C(filename) or default filename as described in C(filename) options description. If the path value is not given in that case a I(backup) directory will be created in the current working directory and backup configuration will be copied in C(filename) within I(backup) directory.",
					]

					type: "path"
				}
			}
			type:          "dict"
			version_added: "2.8"
		}
	}
}