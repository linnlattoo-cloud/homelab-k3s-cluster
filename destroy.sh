#!/bin/bash

# Ensure script runs from the project root
cd "$(dirname "$0")"

echo "Destroying the cluster and simulated servers..."
docker-compose -f docker/docker-compose.yml down -v

echo "Removing local kubeconfig..."
rm -f kubeconfig

echo "Clean up complete."
