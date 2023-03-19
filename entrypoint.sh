#!/bin/bash -e

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

if [ ! -e './smileycoin.conf' ] ; then
    RPCUSER='smileycoinrpc'
    RPCPASSWORD="$(xxd -ps -l 22 /dev/urandom)"
    RPCPORT='9332'
    RPCALLOWIP="*.*.*.*"

    cat <<-EOF > ./smileycoin.conf
rpcuser=${RPCUSER}
rpcpassword=${RPCPASSWORD}
rpcport=${RPCPORT}

rpcallowip=${RPCALLOWIP}
EOF
fi

./smileycoind -datadir=/var/local/smly --server -printtoconsole -algo=skein
