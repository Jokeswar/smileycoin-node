#!/bin/bash -e

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

DATADIR='/smly-data'

if [ ! -e "$DATADIR/smileycoin.conf" ] ; then
    RPCUSER='smileycoinrpc'
    RPCPASSWORD="$(xxd -ps -l 22 /dev/urandom)"
    RPCPORT='9332'
    RPCALLOWIP="*.*.*.*"

    mkdir -p "$DATADIR"
    cat <<-EOF > "$DATADIR/smileycoin.conf"
rpcuser=${RPCUSER}
rpcpassword=${RPCPASSWORD}
rpcport=${RPCPORT}

rpcallowip=${RPCALLOWIP}
EOF
fi

./smileycoind -datadir="$DATADIR" --server -printtoconsole -algo=skein
