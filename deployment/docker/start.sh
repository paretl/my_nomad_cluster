#!/bin/sh

set -e

BASEDIR=$(dirname "$(readlink -f -- "$0")")
ROOTDIR="${BASEDIR}/.."
cd "${ROOTDIR}" || exit

# Define hosts file
HOST_FILE="${ROOTDIR}/inventory.yaml"

echo $ROOTDIR

printf 'Install custom roles.\n'
ansible-galaxy install \
    --force \
    -r "${ROOTDIR}/requirements.yml"

printf 'Launch Ansible custom playbook.\n'
ansible-playbook playbook.yml \
    -i ${HOST_FILE} \
    --diff \
    ${ANSIBLE_OPTIONS}
