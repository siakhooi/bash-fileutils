#!/bin/bash
set -e

# shellcheck disable=SC1091
. ./release.env

RELEASE_NOTE="$RELEASE_DESCRIPTION"

gh release create "$COMPONENT_VERSION" --title "$RELEASE_DESCRIPTION" --notes "${RELEASE_NOTE}" --latest
