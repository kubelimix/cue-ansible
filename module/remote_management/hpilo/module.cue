package hpilo

wakeonlan :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	wakeonlan: {

		// Network broadcast address to use for broadcasting magic Wake-on-LAN packet.

		broadcast?: string

		// MAC address to send Wake-on-LAN broadcast packet for.

		mac: string

		// UDP port to use for magic Wake-on-LAN packet.

		port?: string
	}
}

hpilo_boot :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	hpilo_boot: {

		// The state of the boot media.
		// no_boot: Do not boot from the device
		// boot_once: Boot from the device once and then notthereafter
		// boot_always: Boot from the device each time the server is rebooted
		// connect: Connect the virtual media device and set to boot_always
		// disconnect: Disconnects the virtual media device and set to no_boot
		// poweroff: Power off the server

		state?: string

		// Whether to force a reboot (even when the system is already booted).
		// As a safeguard, without force, hpilo_boot will refuse to reboot a server that is already running.

		force?: bool

		// The HP iLO hostname/address that is linked to the physical system.

		host: string

		// The URL of a cdrom, floppy or usb boot media image. protocol://username:password@hostname:port/filename
		// protocol is either 'http' or 'https'
		// username:password is optional
		// port is optional

		image?: string

		// The login name to authenticate to the HP iLO interface.

		login?: string

		// The boot media to boot the system from

		media?: string

		// The password to authenticate to the HP iLO interface.

		password?: string

		// Change the ssl_version used.

		ssl_version?: string
	}
}

hpilo_info :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	hpilo_info: {

		// The login name to authenticate to the HP iLO interface.

		login?: string

		// The password to authenticate to the HP iLO interface.

		password?: string

		// Change the ssl_version used.

		ssl_version?: string

		// The HP iLO hostname/address that is linked to the physical system.

		host: string
	}
}

hponcfg :: {
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	hponcfg: {

		// The minimum firmware level needed.

		minfw?: string

		// The XML file as accepted by hponcfg.

		path: string

		// Run hponcfg in verbose mode (-v).

		verbose?: bool

		// Path to the hponcfg executable (`hponcfg` which uses $PATH).

		executable?: string
	}
}
