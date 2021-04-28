#!/bin/bash
cd $(dirname $0)
host_file=hosts/all.yml
playbook_file=roles/playbook.yml

# First connection? setup
if [[ ! -f ${host_file} ]] ; then
    ./setup-ssh.sh ${host_file}
fi

# Simple yes/no implementation
function yesno () {
    local question=${1}
    read -s -p "${question} [Yn]" answer
    case "${answer:0:1}" in
        Y|y) return 0 ;;
        *)   return 1 ;;
    esac
}

# install
ansible-playbook -i ${host_file} ${playbook_file}
