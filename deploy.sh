#!/bin/bash
set -e

# Ensure script runs from the project root
cd "$(dirname "$0")"

# 1. Run Pre-checks
./scripts/precheck.sh

echo "Building and starting simulated bare-metal servers..."
docker-compose -f docker/docker-compose.yml up -d --build

echo "Waiting for servers to fully boot..."
sleep 5

echo "Running Ansible to provision the K3s cluster..."
cd ansible
ansible-playbook -i inventory/hosts.ini playbooks/site.yml
cd ..

# 2. Run Post-checks
./scripts/postcheck.sh

echo ""
echo "Cluster provisioned successfully."
echo "To interact with your cluster, run:"
echo "export KUBECONFIG=\$(pwd)/kubeconfig"
echo "kubectl get nodes"
