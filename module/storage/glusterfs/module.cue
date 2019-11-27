package glusterfs

gluster_peer :: {
	tags?: [...string]
	notify?: string | [...string]
	vars?: {...}
	when?: string
	gluster_peer: {

		// Applicable only while removing the nodes from the pool. gluster will refuse to detach a node from the pool if any one of the node is down, in such cases force can be used.

		force?: bool

		// List of nodes that have to be probed into the pool.

		nodes: string

		// Determines whether the nodes should be attached to the pool or removed from the pool. If the state is present, nodes will be attached to the pool. If state is absent, nodes will be detached from the pool.

		state: string
	}
}

gluster_volume :: {
	tags?: [...string]
	notify?: string | [...string]
	vars?: {...}
	when?: string
	gluster_volume: {

		// List of hosts to use for probing and brick setup.

		cluster?: string

		// A dictionary/hash with options/settings for the volume.

		options?: string

		// Redundancy count for volume.

		redundancies?: string

		// Stripe count for volume.

		stripes?: string

		// If brick is being created in the root partition, module will fail. Set force to true to override this behaviour.

		force?: bool

		// Override local hostname (for peer probing purposes).

		host?: string

		// Quota value for limit-usage (be sure to use 10.0MB instead of 10MB, see quota list).

		quota?: string

		// Controls whether the volume is started after creation or not.

		start_on_create?: bool

		// Use present/absent ensure if a volume exists or not. Use started/stopped to control its availability.

		state: string

		// Transport type for volume.

		transport?: string

		// Brick paths on servers. Multiple brick paths can be separated by commas.

		bricks?: string

		// Disperse count for volume.

		disperses?: string

		// Arbiter count for volume.

		arbiters?: string

		// Directory for limit-usage.

		directory?: string

		// The volume name.

		name: string

		// Controls whether the cluster is rebalanced after changes.

		rebalance?: bool

		// Replica count for volume.

		replicas?: string
	}
}

gluster_heal_info :: {
	tags?: [...string]
	notify?: string | [...string]
	vars?: {...}
	when?: string
	gluster_heal_info: {

		// The volume name.

		name: string

		// Determines which facts are to be returned.
		// If the C(status_filter) is C(self-heal), status of self-heal, along with the number of files still in process are returned.
		// If the C(status_filter) is C(rebalance), rebalance status is returned.

		status_filter?: string
	}
}
