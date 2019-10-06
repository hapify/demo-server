#!/bin/bash

set -euo pipefail

if [[ -z ${HPF_KEY} ]]; then
    echo -e "You must specify an API key with env HPF_KEY"
    exit 1
fi

if [[ -z ${HPF_PROJECT} ]]; then
    echo -e "You must specify a project id with env HPF_PROJECT"
    exit 1
fi

hpf key ${HPF_KEY}
hpf -d /app use -p ${HPF_PROJECT}

hpf --debug -d /app serve -p 4800 --no-open

