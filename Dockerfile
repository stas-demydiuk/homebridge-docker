FROM node:7

MAINTAINER Stanislav Demydiuk <s.demydiuk@gmail.com>

# Set environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

# Install tools
RUN apt-get update; \
	apt-get install -y apt-utils; \
	apt-get install -y \
		libnss-mdns \
		avahi-discover \
		libavahi-compat-libdnssd-dev \
		libkrb5-dev; \
	apt-get -qq -y autoclean; \
    apt-get -qq -y autoremove; \
    apt-get -qq -y clean

# Install Homebridge
RUN npm install -g homebridge --unsafe-perm

# Workaround to get dbus working, required for avahi to talk to dbus
RUN mkdir -p /var/run/dbus

USER root

ADD run.sh /root/run.sh

# Expose mDNS and homebridge ports
EXPOSE 5353 51826

# Set volume mount points for homebridge home directory.
VOLUME /root/.homebridge

# Set the default working directory as homebridge directory.
WORKDIR /root/.homebridge

CMD ["/root/run.sh"]