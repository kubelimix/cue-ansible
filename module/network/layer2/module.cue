package layer2

net_l2_interface :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	net_l2_interface: {

		// List of allowed VLAN's in a given trunk port.

		trunk_allowed_vlans?: string

		// List of VLANs to be configured in trunk port.

		trunk_vlans?: string

		// Configure given VLAN in access port.

		access_vlan?: string

		// List of Layer-2 interface definitions.

		aggregate?: string

		// Mode in which interface needs to be configured.

		mode?: string

		// Name of the interface excluding any logical unit number.

		name?: string

		// Native VLAN to be configured in trunk port.

		native_vlan?: string

		// State of the Layer-2 Interface configuration.

		state?: string
	}
}

net_vlan :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	net_vlan: {

		// State of the VLAN configuration.

		state?: string

		// ID of the VLAN.

		vlan_id?: string

		// List of VLANs definitions.

		aggregate?: string

		// List of interfaces the VLAN should be configured on.

		interfaces?: string

		// Name of the VLAN.

		name?: string

		// Purge VLANs not defined in the I(aggregate) parameter.

		purge?: string
	}
}
