#!/bin/bash

set -e

BASEDIR=$(dirname "${0}")
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    BASEDIR=$(dirname "$(readlink -f -- "$0")")
fi
export ROOTDIR="${BASEDIR}/.."
cd "${BASEDIR}" || exit

# Get extra parameters
export ANSIBLE_OPTIONS="$@"

source "${BASEDIR}"/version.sh

printf 'Copy inventory.\n'
cp ${ROOTDIR}/infrastructure/inventory.yaml "${BASEDIR}"/inventory.yaml 

printf 'Launch Ansible scripts.\n'
# docker-compose pull -q
docker-compose run --rm ansible
