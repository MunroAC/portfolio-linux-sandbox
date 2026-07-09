# Automated & Containerized GCP Web Architecture

A containerized Nginx web application hosted on an isolated Google Cloud Platform (GCP) Compute Engine virtual machine. This repository contains the complete automation scripts, container configuration, and step-by-step instructions to deploy a highly available and observable cloud environment.

## 🏗️ Architecture Overview

The following diagram illustrates the deployment topology, displaying how public web traffic is routed securely through GCP firewall rules into the Docker container running inside the VM.

```mermaid
flowchart LR
    Internet["Internet Client"] -->|HTTP Port 80| Firewall["GCP Firewall Tag: http-server"]
    Firewall --> VM["Compute Engine VM (Debian)"]
    VM --> Docker["Docker Daemon"]
    Docker --> Container["Nginx Container (Port 80)"]
    VM --> OpsAgent["GCP Ops Agent"]
