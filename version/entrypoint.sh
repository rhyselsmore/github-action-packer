#!/bin/sh
set -e

VERSION=$(sh -c "packer version -color=false" 2>&1)
echo "$VERSION"
