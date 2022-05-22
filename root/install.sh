if [ $(arch) = "amd64" ]; then \
echo "Running on amd64, downloading x86-64 binary..."
wget --no-check-certificate -O /bin/airupnp https://raw.githubusercontent.com/philippe44/AirConnect/master/bin/airupnp-x86-64-static;
	elif [ $(arch) = "arm64" ]; then \
echo "Runing on arm64, downloading aarch64 binary..."
wget --no-check-certificate -O /bin/airupnp https://raw.githubusercontent.com/philippe44/AirConnect/master/bin/airupnp-aarch64-static; 
	elif [ $(arch) = "aarch64" ]; then \
echo "Running on aarch64, downloading aarch64 binary..."
wget --no-check-certificate -O /bin/airupnp https://raw.githubusercontent.com/philippe44/AirConnect/master/bin/airupnp-aarch64-static;
	elif [ $(arch) = "armv7l" ]; then \
echo "Running on armv7l, downloading arm binary"
wget --no-check-certificate -O /bin/airupnp https://raw.githubusercontent.com/philippe44/AirConnect/master/bin/airupnp-arm-static;
	else \
echo "Unsupported OS, aborting";
fi

chmod +x /bin/airupnp