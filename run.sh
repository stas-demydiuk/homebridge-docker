#!/bin/bash

sed -i "s/rlimit-nproc=3/#rlimit-nproc=3/" /etc/avahi/avahi-daemon.conf

# Close previous instances
rm -f /var/run/dbus/pid /var/run/avahi-daemon/pid

# Install plugins
if [ -n "${HOMEBRIDGE_PLUGINS}" ]; then
	npm i "${HOMEBRIDGE_PLUGINS}"
fi

service dbus start
service avahi-daemon start

homebridge --debug