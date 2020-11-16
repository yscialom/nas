#!/bin/bash
cd $(dirname $0)
host_file=hosts/all.yml
playbook_file=roles/playbook.yml

# First connection? setup
if [[ ! -f ${host_file} ]] ; then
    ./setup-ssh.sh ${host_file}
fi

# install
ansible-playbook -i ${host_file} ${playbook_file}
