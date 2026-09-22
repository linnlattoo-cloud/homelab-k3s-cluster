#!/bin/bash
set -e

cd "$(dirname "$0")/.."

export KUBECONFIG="$(pwd)/kubeconfig"

if [ ! -f "$KUBECONFIG" ]; then
    echo "Error: kubeconfig not found. Cluster deployment may have failed."
    exit 1
fi

echo "Running post-flight checks..."

if ! command -v kubectl >/dev/null 2>&1; then
    echo "Warning: kubectl is not installed locally. Skipping node readiness check."
    exit 0
fi

echo "Verifying node readiness..."
for i in {1..12}; do
    READY_NODES=$(kubectl get nodes --no-headers 2>/dev/null | awk '{print $2}' | grep -c -w "Ready" || true)
    
    if [ "$READY_NODES" -eq 3 ]; then
        echo "Success: All 3 nodes are in Ready state."
        exit 0
    fi
    
    echo "Waiting for nodes to become ready... ($READY_NODES/3 Ready)"
    sleep 5
done

echo "Error: Nodes did not reach Ready state in time."
kubectl get nodes
exit 1
