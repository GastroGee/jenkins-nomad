#!/usr/bin/env bash

# Inspired by karlkfi/concourse-dcind
# https://github.com/karlkfi/concourse-dcind/blob/master/entrypoint.sh

# Add this override to check and make sure the DOCKER_CONFIG variable is set if we intend to perform a docker login.
# If its not present then we shouldnt allow for a login as this would be shared across the worker execution.
echo 'docker() {
    if [[ $@ == "login" ]]; then
        if [ -z $DOCKER_CONFIG ]; then
          echo "The DOCKER_CONFIG environmental variable must be set in order to run docker login." && return 1
        fi
    else
        command docker "$@"
    fi
}' >> ~/.bashrc

set -o errexit -o pipefail

source /docker-lib.sh
start_docker

# We need to set this after starting docker to avoid the failure
#   /docker-lib.sh: line 78: $1: unbound variable
set -o nounset

# do not exec, because exec disables traps
if [[ "$#" != "0" ]]; then
  "$@"
else
  bash --login
fi
