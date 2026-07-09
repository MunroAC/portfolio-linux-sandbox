#!/bin/bash
# 1. System Updates
apt-get update
apt-get upgrade -y

# 2. Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# 3. Install GCP Ops Agent for monitoring
curl -sSO https://dl.google.com/cloudagents/add-google-cloud-ops-agent-repo.sh
bash add-google-cloud-ops-agent-repo.sh --also-install

# 4. Pull and run the custom web application
docker run -d -p 80:80 --name portfolio-web my-custom-nginx
