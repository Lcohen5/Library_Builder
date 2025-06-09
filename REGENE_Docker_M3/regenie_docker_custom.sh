#!/bin/bash
# regenie_docker.sh (custom mount version)
# Usage: ./regenie_docker.sh [REGENIE ARGUMENTS]

# Hardcoded dataset directory
DATA_DIR="/your/file/path/here"

# Check if user supplied --bsize
HAS_BSIZE=false
for arg in "$@"; do
  if [[ "$arg" == "--bsize" ]]; then
    HAS_BSIZE=true
    break
  fi
done

# If --bsize is missing, insert it at the beginning
if [ "$HAS_BSIZE" = false ]; then
  set -- --bsize 1000 "$@"
fi

# Run REGENIE in Docker using custom data mount
docker run --rm --platform=linux/amd64 \
  -v "$DATA_DIR":/data \
  -w /data \
  ghcr.io/rgcgithub/regenie/regenie:v3.0.1.gz \
  regenie "$@"
