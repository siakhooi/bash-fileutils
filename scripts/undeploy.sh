#!/bin/bash
set -e
# shellcheck disable=SC1091
source ./release.env

apt remove -y "$COMPONENT_NAME"
