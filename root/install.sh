arch=$(uname -m)

wget --no-check-certificate -O /tmp/airupnp.zip https://github.com/philippe44/AirConnect/releases/download/1.8.3/AirConnect-1.8.3.zip
unzip /tmp/airupnp.zip -d /tmp


if [ "$arch" = "x86_64" ]; then
	echo "Running on x86_64, copying x86_64 binary..."
	cp /tmp/airupnp-linux-x86_64-static /bin/airupnp
elif [ "$arch" = "aarch64" ]; then
	echo "Running on aarch64, copying aarch64 binary..."
	cp /tmp/airupnp-linux-aarch64-static /bin/airupnp
elif [ "$arch" = "armv7l" ]; then
	echo "Running on armv7l, copying arm binary..."
	cp /tmp/airupnp-linux-arm-static /bin/airupnp
elif [ "$arch" = "armv6l" ]; then
	echo "Running on armv6l, copying armv6 binary..."
	cp /tmp/airupnp-linux-armv6-static /bin/airupnp
elif [ "$arch" = "armv5l" ]; then
	echo "Running on armv5l, copying armv5 binary..."
	cp /tmp/airupnp-linux-armv5-static /bin/airupnp
elif [ "$arch" = "mips" ]; then
	echo "Running on mips, copying mips binary..."
	cp /tmp/airupnp-linux-mips-static /bin/airupnp
elif [ "$arch" = "mipsel" ]; then
	echo "Running on mipsel, copying mipsel binary..."
	cp /tmp/airupnp-linux-mipsel-static /bin/airupnp
elif [ "$arch" = "powerpc" ]; then
	echo "Running on powerpc, copying powerpc binary..."
	cp /tmp/airupnp-linux-powerpc-static /bin/airupnp
elif [ "$arch" = "sparc64" ]; then
	echo "Running on sparc64, copying sparc64 binary..."
	cp /tmp/airupnp-linux-sparc64-static /bin/airupnp
elif [ "$arch" = "i686" ]; then
	echo "Running on i686, copying x86 binary..."
	cp /tmp/airupnp-linux-x86-static /bin/airupnp
else
	echo "Unsupported architecture, aborting"
	exit 1
fi
rm -rf /tmp/airconnect /tmp/*
chmod +x /bin/airupnp

