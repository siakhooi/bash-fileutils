#!/bin/bash
set -e

# shellcheck disable=SC1091
. ./release.env

gh release create "$COMPONENT_VERSION" --title "$RELEASE_TITLE" --notes "$RELEASE_DESCRIPTION" --latest
