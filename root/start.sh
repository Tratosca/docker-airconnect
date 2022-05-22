#!/bin/sh
env

set -x

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

#Which name for the AirPlay Receiver ?
set_val $NAME name

#Should artwork be send ? Either 1 or 0
set_val $ARTWORK artwork

airupnp -x /etc/airupnp.conf