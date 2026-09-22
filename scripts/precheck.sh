#!/bin/bash
set -e

echo "Running pre-flight checks..."

command -v docker >/dev/null 2>&1 || { echo >&2 "Error: docker is required but it's not installed. Aborting."; exit 1; }
command -v docker-compose >/dev/null 2>&1 || { echo >&2 "Error: docker-compose is required but it's not installed. Aborting."; exit 1; }
command -v ansible-playbook >/dev/null 2>&1 || { echo >&2 "Error: ansible is required but it's not installed. Aborting."; exit 1; }

echo "All required dependencies are installed."
