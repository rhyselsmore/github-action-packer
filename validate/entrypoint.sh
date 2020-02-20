#!/bin/sh
set -e

TEMPLATE_FILE=$1
if [[ ! -f "$TEMPLATE_FILE" ]]; then
    echo "::error ::File ${TEMPLATE_FILE} could not be found. Please check your paths"
    exit 1
fi

set +e
# Run packer template validator
OUTPUT=$(sh -c "packer validate ${TEMPLATE_FILE}" 2>&1)
CODE=$?

if [ $CODE -ne 0 ]; then
    echo "::error ::Template Validation Failed"
    echo "$OUTPUT"
    exit 1
fi

echo "Template Successfully Validated"