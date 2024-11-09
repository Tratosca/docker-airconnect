#!/bin/sh
#env
#set -x

set_val() {
    if [ -n "$2" ]; then
        echo "set $2 to $1"
        sed -i "s/<$2>[^<]*<\/$2>/<$2>$1<\/$2>/g" /etc/airupnp.conf
    else
        echo "No setting passed for $1, skipping." >&2
    fi
}

set_val $CODEC codec
set_val $METADATA metadata
set_val $LATENCY latency
set_val $NAME name
set_val $ARTWORK artwork
set_val $MAXVOLUME max_volume

/bin/airupnp -x /etc/airupnp.conf