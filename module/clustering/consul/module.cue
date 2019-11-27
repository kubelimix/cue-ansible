package consul

pacemaker_cluster :: {
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	vars?: {...}
	pacemaker_cluster: {

		// Force the change of the cluster state

		force?: bool

		// Specify which node of the cluster you want to manage. None == the cluster status itself, 'all' == check the status of all nodes.

		node?: string

		// Indicate desired state of the cluster

		state: string

		// Timeout when the module should considered that the action has failed

		timeout?: string
	}
}

znode :: {
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	vars?: {...}
	znode: {

		// A list of ZooKeeper servers (format '[server]:[port]').

		hosts: string

		// The path of the znode.

		name: string

		// An operation to perform. Mutually exclusive with state.

		op?: string

		// Recursively delete node and all its children.

		recursive?: bool

		// The state to enforce. Mutually exclusive with op.

		state?: string

		// The amount of time to wait for a node to appear.

		timeout?: string

		// The value assigned to the znode.

		value?: string
	}
}

consul :: {
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	vars?: {...}
	consul: {

		// a name for the service check. Required if standalone, ignored if part of service definition.

		check_name?: string

		// checks can be registered with an HTTP endpoint. This means that consul will check that the http endpoint returns a successful HTTP status. I(interval) must also be provided with this option.

		http?: string

		// the script/command that will be run periodically to check the health of the service. Scripts require I(interval) and vice versa.

		script?: string

		// the ID for the service, must be unique per node. If I(state=absent), defaults to the service name if supplied.

		service_id?: string

		// Unique name for the service on a node, must be unique per node, required if registering a service. May be omitted if registering a node level check

		service_name?: string

		// A custom HTTP check timeout. The consul default is 10 seconds. Similar to the interval this is a number with a C(s) or C(m) suffix to signify the units of seconds or minutes, e.g. C(15s) or C(1m).

		timeout?: string

		// host of the consul agent defaults to localhost

		host?: string

		// the address to advertise that the service will be listening on. This value will be passed as the I(address) parameter to Consul's U(/v1/agent/service/register) API method, so refer to the Consul API documentation for further details.

		service_address?: string

		// tags that will be attached to the service registration.

		tags?: [...]

		// whether to verify the TLS certificate of the consul agent

		validate_certs?: bool

		// the interval at which the service check will be run. This is a number with a s or m suffix to signify the units of seconds or minutes e.g C(15s) or C(1m). If no suffix is supplied, m will be used by default e.g. C(1) will be C(1m). Required if the I(script) parameter is specified.

		interval?: string

		// Notes to attach to check when registering it.

		notes?: string

		// the protocol scheme on which the consul agent is running

		scheme?: string

		// the token key identifying an ACL rule set. May be required to register services.

		token?: string

		// an ID for the service check. If I(state=absent), defaults to I(check_name). Ignored if part of a service definition.

		check_id?: string

		// the port on which the consul agent is running

		port?: int

		// the port on which the service is listening. Can optionally be supplied for registration of a service, i.e. if I(service_name) or I(service_id) is set

		service_port?: int

		// register or deregister the consul service, defaults to present

		state?: string

		// checks can be registered with a ttl instead of a I(script) and I(interval) this means that the service will check in with the agent before the ttl expires. If it doesn't the check will be considered failed. Required if registering a check and the script an interval are missing Similar to the interval this is a number with a s or m suffix to signify the units of seconds or minutes e.g C(15s) or C(1m). If no suffix is supplied, C(m) will be used by default e.g. C(1) will be C(1m)

		ttl?: string
	}
}

consul_acl :: {
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	vars?: {...}
	consul_acl: {

		// a management token is required to manipulate the acl lists

		mgmt_token?: string

		// the port on which the consul agent is running

		port?: int

		// whether to verify the tls certificate of the consul agent

		validate_certs?: bool

		// the token key identifying an ACL rule set. If generated by consul this will be a UUID

		token?: string

		// the type of token that should be created

		token_type?: string

		// host of the consul agent defaults to localhost

		host?: string

		// the name that should be associated with the acl key, this is opaque to Consul

		name?: string

		// rules that should be associated with a given token

		rules?: [...]

		// the protocol scheme on which the consul agent is running

		scheme?: string

		// whether the ACL pair should be present or absent

		state?: string
	}
}

consul_kv :: {
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	vars?: {...}
	consul_kv: {

		// The token key identifying an ACL rule set that controls access to the key value pair

		token?: string

		// Opaque positive integer value that can be passed when setting a value.

		flags?: string

		// The key at which the value should be stored.

		key: string

		// The port on which the consul agent is running.

		port?: int

		// If the I(state) is C(present) and I(value) is set, perform a read after setting the value and return this value.

		retrieve?: bool

		// The protocol scheme on which the consul agent is running.

		scheme?: string

		// The session that should be used to acquire or release a lock associated with a key/value pair.

		session?: string

		// The action to take with the supplied key and value. If the state is 'present' and `value` is set, the key contents will be set to the value supplied and `changed` will be set to `true` only if the value was different to the current contents. If the state is 'present' and `value` is not set, the existing value associated to the key will be returned. The state 'absent' will remove the key/value pair, again 'changed' will be set to true only if the key actually existed prior to the removal. An attempt can be made to obtain or free the lock associated with a key/value pair with the states 'acquire' or 'release' respectively. a valid session must be supplied to make the attempt changed will be true if the attempt is successful, false otherwise.

		state?: string

		// Used when acquiring a lock with a session. If the C(cas) is C(0), then Consul will only put the key if it does not already exist. If the C(cas) value is non-zero, then the key is only set if the index matches the ModifyIndex of that key.

		cas?: string

		// Host of the consul agent.

		host?: string

		// If the key represents a prefix, each entry with the prefix can be retrieved by setting this to C(yes).

		recurse?: bool

		// Whether to verify the tls certificate of the consul agent.

		validate_certs?: bool

		// The value should be associated with the given key, required if C(state) is C(present).

		value: string
	}
}

consul_session :: {
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	vars?: {...}
	consul_session: {

		// ID of the session, required when I(state) is either C(info) or C(remove).

		id?: string

		// The port on which the consul agent is running.

		port?: int

		// The protocol scheme on which the consul agent is running.

		scheme?: string

		// Whether the session should be present i.e. created if it doesn't exist, or absent, removed if present. If created, the I(id) for the session is returned in the output. If C(absent), I(id) is required to remove the session. Info for a single session, all the sessions for a node or all available sessions can be retrieved by specifying C(info), C(node) or C(list) for the I(state); for C(node) or C(info), the node I(name) or session I(id) is required as parameter.

		state?: string

		// Whether to verify the TLS certificate of the consul agent.

		validate_certs?: bool

		// Checks that will be used to verify the session health. If all the checks fail, the session will be invalidated and any locks associated with the session will be release and can be acquired once the associated lock delay has expired.

		checks?: [...]

		// The name of the datacenter in which the session exists or should be created.

		datacenter?: string

		// The host of the consul agent defaults to localhost.

		host?: string

		// The name that should be associated with the session. Required when I(state=node) is used.

		name?: string

		// The name of the node that with which the session will be associated. by default this is the name of the agent.

		node?: string

		// The optional behavior that can be attached to the session when it is created. This controls the behavior when a session is invalidated.

		behavior?: string

		// The optional lock delay that can be attached to the session when it is created. Locks for invalidated sessions ar blocked from being acquired until this delay has expired. Durations are in seconds.

		delay?: int
	}
}

etcd3 :: {
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	vars?: {...}
	etcd3: {

		// The socket level timeout in seconds.

		timeout?: string

		// PEM formatted certificate chain file to be used for SSL client authentication.
		// Required if I(client_key) is defined.

		client_cert?: string

		// the state of the value for the key.
		// can be present or absent

		state: string

		// the IP address of the cluster

		host?: string

		// the key where the information is stored in the cluster

		key: string

		// The password to use for authentication.
		// Required if I(user) is defined.

		password?: string

		// the port number used to connect to the cluster

		port?: string

		// The etcd user to authenticate with.

		user?: string

		// the information stored

		value: string

		// The Certificate Authority to use to verify the etcd host.
		// Required if I(client_cert) and I(client_key) are defined.

		ca_cert?: string

		// PEM formatted file that contains your private key to be used for SSL client authentication.
		// Required if I(client_cert) is defined.

		client_key?: string
	}
}
