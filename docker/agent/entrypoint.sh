#!/bin/bash
set -e

./config.sh \
    --unattended \
    --url ${ADO_PROJECT_URL} \
    --auth pat \
    --token ${ADO_PAT} \
    --pool ${ADO_POOL} \
    --agent ${AGENT_NAME} \
    --replace \
    --acceptTeeEula

./run.sh $@
