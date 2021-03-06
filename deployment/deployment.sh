#!/bin/bash

set -e

BASEDIR=$(dirname "${0}")
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    BASEDIR=$(dirname "$(readlink -f -- "$0")")
fi
export ROOTDIR="${BASEDIR}/.."
cd "${BASEDIR}" || exit

# Get bash methods repository
BASH_METHODS_PATH="${ROOTDIR}/bash-methods"

# Check custom script parameters
SCRIPT_PARAMS_VARIABLES=(STEP)
SCRIPT_PARAMS_USAGE='<step ex.init|plan|apply>'
source "${BASH_METHODS_PATH}"/components/check-bash-parameters.sh

# Get env variables
source "${ROOTDIR}"/version.sh

cd ${ROOTDIR}/infrastructure
export NOMAD_IP=$(terraform output -raw nomad_ip)
printf 'The Nomad IP is %s.\n' "$NOMAD_IP"
cd "${BASEDIR}"

# Define parameters for each command
export TF_CLI_ARGS_init="-upgrade -reconfigure"
export TF_CLI_ARGS_apply="-auto-approve"

# Prepare environment variables
export USER_ID=$(id -u)

# Run terraform script + get terraform command exit code
source "${BASH_METHODS_PATH}"/terraform/run-docker-compose-with-exit-code.sh
