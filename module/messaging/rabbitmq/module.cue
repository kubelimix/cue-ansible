package rabbitmq

rabbitmq_exchange :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	rabbitmq_exchange: {

		// whether exchange is durable or not

		durable?: bool

		// type for the exchange

		exchange_type?: string

		// exchange is available only for other exchanges

		internal?: bool

		// Name of the exchange to create

		name: string

		// Whether the exchange should be present or absent

		state?: string

		// extra arguments for exchange. If defined this argument is a key/value dictionary

		arguments?: string

		// if the exchange should delete itself after all queues/exchanges unbound from it

		auto_delete?: bool
	}
}

rabbitmq_global_parameter :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	rabbitmq_global_parameter: {

		// erlang node name of the rabbit we wish to configure

		node?: string

		// Specify if user is to be added or removed

		state?: string

		// Value of the global parameter, as a JSON term

		value?: string

		// Name of the global parameter being set

		name: string
	}
}

rabbitmq_parameter :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	rabbitmq_parameter: {

		// erlang node name of the rabbit we wish to configure

		node?: string

		// Specify if user is to be added or removed

		state?: string

		// Value of the parameter, as a JSON term

		value?: string

		// vhost to apply access privileges.

		vhost?: string

		// Name of the component of which the parameter is being set

		component: string

		// Name of the parameter being set

		name: string
	}
}

rabbitmq_user :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	rabbitmq_user: {

		// Regular expression to restrict configure actions on a resource for the specified vhost.
		// By default all actions are restricted.
		// This option will be ignored when permissions option is used.

		configure_priv?: string

		// Password of user to add.
		// To change the password of an existing user, you must also specify C(update_password=always).

		password?: string

		// Regular expression to restrict configure actions on a resource for the specified vhost.
		// By default all actions are restricted.
		// This option will be ignored when permissions option is used.

		read_priv?: string

		// Specify if user is to be added or removed

		state?: string

		// User tags specified as comma delimited

		tags?: string

		// vhost to apply access privileges.
		// This option will be ignored when permissions option is used.

		vhost?: string

		// Regular expression to restrict configure actions on a resource for the specified vhost.
		// By default all actions are restricted.
		// This option will be ignored when permissions option is used.

		write_priv?: string

		// Deletes and recreates the user.

		force?: bool

		// erlang node name of the rabbit we wish to configure

		node?: string

		// a list of dicts, each dict contains vhost, configure_priv, write_priv, and read_priv, and represents a permission rule for that vhost.
		// This option should be preferable when you care about all permissions of the user.
		// You should use vhost, configure_priv, write_priv, and read_priv options instead if you care about permissions for just some vhosts.

		permissions?: string

		// C(on_create) will only set the password for newly created users.  C(always) will update passwords if they differ.

		update_password?: string

		// Name of user to add

		user: string
	}
}

rabbitmq_vhost_limits :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	rabbitmq_vhost_limits: {

		// Max number of concurrent client connections.
		// Negative value means "no limit".
		// Ignored when the I(state) is C(absent).

		max_connections?: string

		// Max number of queues.
		// Negative value means "no limit".
		// Ignored when the I(state) is C(absent).

		max_queues?: string

		// Name of the RabbitMQ Erlang node to manage.

		node?: string

		// Specify whether the limits are to be set or cleared.
		// If set to C(absent), the limits of both I(max_connections) and I(max-queues) will be cleared.

		state?: string

		// Name of the virtual host to manage.

		vhost?: string
	}
}

rabbitmq_binding :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	rabbitmq_binding: {

		// Whether the bindings should be present or absent.

		state?: string

		// extra arguments for exchange. If defined this argument is a key/value dictionary

		arguments?: string

		// destination exchange or queue for the binding.

		destination: string

		// Either queue or exchange.

		destination_type: string

		// source exchange to create binding on.

		name: string

		// routing key for the binding.

		routing_key?: string
	}
}

rabbitmq_policy :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	rabbitmq_policy: {

		// The priority of the policy.

		priority?: string

		// The state of the policy.

		state?: string

		// A dict or string describing the policy. Required when C(state=present). This option is no longer required as of Ansible 2.9.

		tags?: string

		// The name of the vhost to apply to.

		vhost?: string

		// What the policy applies to. Requires RabbitMQ 3.2.0 or later.

		apply_to?: string

		// The name of the policy to manage.

		name: string

		// Erlang node name of the rabbit we wish to configure.

		node?: string

		// A regex of queues to apply the policy to. Required when C(state=present). This option is no longer required as of Ansible 2.9.

		pattern?: string
	}
}

rabbitmq_queue :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	rabbitmq_queue: {

		// Optional name of an exchange to which messages will be republished if they
		// are rejected or expire

		dead_letter_exchange?: string

		// Optional replacement routing key to use when a message is dead-lettered.
		// Original routing key will be used if unset

		dead_letter_routing_key?: string

		// whether queue is durable or not

		durable?: bool

		// How many messages can the queue contain before it starts rejecting

		max_length?: string

		// How long a message can live in queue before it is discarded (milliseconds)

		message_ttl?: string

		// extra arguments for queue. If defined this argument is a key/value dictionary

		arguments?: string

		// if the queue should delete itself after all queues/queues unbound from it

		auto_delete?: bool

		// How long a queue can be unused before it is automatically deleted (milliseconds)

		auto_expires?: string

		// Whether the queue should be present or absent

		state?: string

		// Maximum number of priority levels for the queue to support.
		// If not set, the queue will not support message priorities.
		// Larger numbers indicate higher priority.

		max_priority?: string

		// Name of the queue

		name: string
	}
}

rabbitmq_vhost :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	rabbitmq_vhost: {

		// The state of vhost

		state?: string

		// Enable/disable tracing for a vhost

		tracing?: bool

		// The name of the vhost to manage

		name: string

		// erlang node name of the rabbit we wish to configure

		node?: string
	}
}

rabbitmq_plugin :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	rabbitmq_plugin: {

		// Comma-separated list of plugin names. Also, accepts plugin name.

		names: string

		// Only enable missing plugins.
		// Does not disable plugins that are not in the names list.

		new_only?: bool

		// Specify a custom install prefix to a Rabbit.

		prefix?: string

		// Specify if plugins are to be enabled or disabled.

		state?: string
	}
}
