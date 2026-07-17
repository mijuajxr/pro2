#!/usr/bin/env bash
set -euo pipefail

INPUT_PATH="${1:?Masukkan path APK atau folder arm64-v8a}"
OUTPUT_PATH="${2:-$(pwd)/output}"
IMAGE_NAME="${BLUTTER_IMAGE:-blutter-github-runner:v1}"

mkdir -p "$OUTPUT_PATH"
docker build -t "$IMAGE_NAME" .
docker run --rm -v "$INPUT_PATH:/input/source:ro" -v "$OUTPUT_PATH:/output" "$IMAGE_NAME" /input/source /output
