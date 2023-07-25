#!/usr/bin/env bash
set -Eeuo pipefail

dir="$(dirname "$BASH_SOURCE")"

unset "${!BASHBREW_@}" # just to be sure
export BASHBREW_LIBRARY="$dir/.doi/library"

subset="$(< "$dir/subset.txt")"

set -x

time "$dir/.scripts/sources.sh" $subset > "$dir/sources.json"

time "$dir/.scripts/builds.sh" "$dir/sources.json" > "$dir/builds.json"
