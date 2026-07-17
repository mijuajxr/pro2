#!/usr/bin/env bash
set -euo pipefail

INPUT_PATH="${1:-/input}"
OUTPUT_PATH="${2:-/output}"
shift $(( $# > 0 ? 1 : 0 ))
shift $(( $# > 0 ? 1 : 0 ))

mkdir -p "$OUTPUT_PATH"
python3 /opt/blutter/blutter.py "$INPUT_PATH" "$OUTPUT_PATH" "$@"
