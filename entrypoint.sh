#!/bin/bash

set -eo pipefail

PORT="${HPF_PORT:-4800}"
HOST="${HPF_HOSTNAME:-localhost}"

if [[ ! -z "$HPF_KEY" ]]; then
    hpf config --apiKey ${HPF_KEY}
fi

if [[ ! -z "$HPF_API_URL" ]]; then
    hpf config --apiUrl ${HPF_API_URL}
fi

if [[ ! -z "$HPF_PROJECT" ]]; then
    hpf -d /app use -p ${HPF_PROJECT}
fi

hpf --debug -d /app serve -p ${PORT} -H ${HOST} --no-open
