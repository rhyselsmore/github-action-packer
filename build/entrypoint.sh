#!/bin/sh
set -e

TEMPLATE_FILE=$1
if [[ ! -f "$TEMPLATE_FILE" ]]; then
    echo "::error ::File ${TEMPLATE_FILE} could not be found. Please check your paths"
    exit 1
fi

set +e

# Run packer template validator
OUTPUT=$(mktemp)
packer build -color=false ${TEMPLATE_FILE} | tee $OUTPUT
CODE=${PIPESTATUS[0]}


if [ $CODE -ne 0 ]; then
    echo "::error ::Template Build Failed"
    echo "$OUTPUT"
    exit 1
fi
