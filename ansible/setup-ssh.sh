#!/bin/bash
cd $(dirname $0)
host_file=${1}

echo "===[ setup ssh connection to pinanas host ]==="

read -p "pinanas hostname or ip: " pinanas_host

echo "  - create ansible host file $(readlink -f ${host_file})"
sed "s/@PINANAS_HOST@/${pinanas_host}/" <${host_file}.in >${host_file}

echo "  - allow ${USER}@${HOSTNAME} to connect to pi@${pinanas_host} with an ssh key"
ssh-copy-id pi@${pinanas_host}
