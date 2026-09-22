# Homelab K3s Cluster

A lightweight, automated Kubernetes cluster generator for local environments. 

This simulates a bare-metal multi-node environment using Docker containers running `systemd`, and then uses Ansible to provision a fully functional K3s cluster across them.

## Architecture

* **Infrastructure Layer:** Docker & Docker Compose (Simulates 1 Control Plane, 2 Worker Nodes)
* **Configuration Management:** Ansible
* **Kubernetes Distribution:** K3s

## Skills Demonstrated

* **Infrastructure as Code (IaC):** Automating environment creation with Docker Compose.
* **Configuration Management:** Writing idempotent Ansible playbooks to provision servers.
* **Kubernetes Architecture:** Understanding the bootstrapping process, CNI, and Ingress (Traefik) configuration from scratch, rather than relying on black-box tools.
* **DevOps Best Practices:** Utilizing defensive scripting (pre/post-flight checks) and creating a frictionless developer experience.

## Prerequisites

* Docker
* Ansible 

## Quick Start

### 1. Deploy the Cluster
Run the deployment script to build the infrastructure and provision the cluster:
```bash
./deploy.sh
```

### 2. Access the Cluster
Once the deployment finishes, the script will generate a secure `kubeconfig` file. Export it to your environment:
```bash
export KUBECONFIG=$(pwd)/kubeconfig
kubectl get nodes
```

### 3. Destroy the Cluster
To cleanly tear down the simulated servers and remove local configurations:
```bash
./destroy.sh
```
