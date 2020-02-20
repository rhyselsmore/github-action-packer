#!/bin/sh
set -e

TEMPLATE_FILE=$1
if [[ ! -f "$TEMPLATE_FILE" ]]; then
    echo "::error ::File ${TEMPLATE_FILE} could not be found. Please check your paths"
    exit 1
fi
