#!/bin/sh
set -e

VERSION=$(sh -c "packer version" 2>&1)
echo "$VERSION"
