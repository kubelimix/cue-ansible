package nuage

nuage_vspk :: {
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	vars?: {...}
	nuage_vspk: {

		// A filter used when looking (both in I(command) and I(state) for entities, in the format the Nuage VSP API expects.
		// If I(match_filter) is defined, it will take precedence over the I(properties), but not on the I(id)

		match_filter?: string

		// The ID of the parent of the entity you want to work on.
		// When I(state) is specified, the entity will be gathered from this parent, if it exists, unless an I(id) is specified.
		// When I(command=find) is specified, the entity will be searched for in this parent, unless an I(id) is specified.
		// If specified, I(parent_type) also needs to be specified.

		parent_id?: string

		// The type of entity you want to work on (example Enterprise).
		// This should match the objects CamelCase class name in VSPK-Python.
		// This Class name can be found on U(https://nuagenetworks.github.io/vspkdoc/index.html).

		type: string

		// The type of parent the ID is specified for (example Enterprise).
		// This should match the objects CamelCase class name in VSPK-Python.
		// This Class name can be found on U(https://nuagenetworks.github.io/vspkdoc/index.html).
		// If specified, I(parent_id) also needs to be specified.

		parent_type?: string

		// Properties are the key, value pairs of the different properties an entity has.
		// If no I(id) and no I(match_filter) is specified, these are used to find or determine if the entity exists.

		properties?: string

		// Specifies the desired state of the entity.
		// If I(state=present), in case the entity already exists, will update the entity if it is needed.
		// If I(state=present), in case the relationship with the parent is a member relationship, will assign the entity as a member of the parent.
		// If I(state=absent), in case the relationship with the parent is a member relationship, will unassign the entity as a member of the parent.
		// Either I(state) or I(command) needs to be defined, both can not be defined at the same time.

		state?: string

		// Dict with the authentication information required to connect to a Nuage VSP environment.
		// Requires a I(api_username) parameter (example csproot).
		// Requires either a I(api_password) parameter (example csproot) or a I(api_certificate) and I(api_key) parameters, which point to the certificate and key files for certificate based authentication.
		// Requires a I(api_enterprise) parameter (example csp).
		// Requires a I(api_url) parameter (example https://10.0.0.10:8443).
		// Requires a I(api_version) parameter (example v4_0).

		auth: string

		// Can be used to specify a set of child entities.
		// A mandatory property of each child is the I(type).
		// Supported optional properties of each child are I(id), I(properties) and I(match_filter).
		// The function of each of these properties is the same as in the general task definition.
		// This can be used recursively
		// Only useable in case I(state=present).

		children?: string

		// Specifies a command to be executed.
		// With I(command=find), if I(parent_id) and I(parent_type) are defined, it will only search within the parent. Otherwise, if allowed, will search in the root object.
		// With I(command=find), if I(id) is specified, it will only return the single entity matching the id.
		// With I(command=find), otherwise, if I(match_filter) is define, it will use that filter to search.
		// With I(command=find), otherwise, if I(properties) are defined, it will do an AND search using all properties.
		// With I(command=change_password), a password of a user can be changed. Warning - In case the password is the same as the existing, it will throw an error.
		// With I(command=wait_for_job), the module will wait for a job to either have a status of SUCCESS or ERROR. In case an ERROR status is found, the module will exit with an error.
		// With I(command=wait_for_job), the job will always be returned, even if the state is ERROR situation.
		// Either I(state) or I(command) needs to be defined, both can not be defined at the same time.

		command?: string

		// The ID of the entity you want to work on.
		// In combination with I(command=find), it will only return the single entity.
		// In combination with I(state), it will either update or delete this entity.
		// Will take precedence over I(match_filter) and I(properties) whenever an entity needs to be found.

		id?: string
	}
}
