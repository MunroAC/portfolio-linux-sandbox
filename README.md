# portfolio-linux-sandbox
A cloud-hosted Linux system administration project featuring shell script automation, containerized Nginx delivery, and GCP Cloud Monitoring.

Automated & Containerized GCP Web Architecture

A hands-on Cloud Engineering and Linux System Administration project demonstrating secure networking, Docker containerization, and system observability on Google Cloud Platform (GCP).

Architecture Diagram

graph TD
    User([Internet User]) -->|HTTP Port 80| FW{GCP Firewall}
    
    subgraph GCP [Google Cloud Platform]
        subgraph VPC [Default VPC Network]
            FW -->|Allowed: Tag 'http-server'| VM[Compute Engine VM <br> Debian Linux]
            
            subgraph VM_Internal [VM Host Environment]
                VM -->|Port Mapping 80:80| Docker{Docker Engine}
                
                subgraph Container [Docker Container]
                    Docker --> Nginx[Nginx Web Server]
                    Nginx --> HTML[Custom index.html <br> Munro AC]
                end
            end
        end
    end

    classDef gcp fill:#4285F4,stroke:#1a73e8,stroke-width:2px,color:#fff;
    classDef vm fill:#34A853,stroke:#137333,stroke-width:2px,color:#fff;
    classDef docker fill:#2496ED,stroke:#1d70b8,stroke-width:2px,color:#fff;
    class GCP gcp;
    class VM vm;
    class Docker,Container docker;


Project Objective

The goal of this project is to deploy a custom, responsive landing page served from a secure, lightweight Docker container hosted on a Google Cloud virtual machine.

This project demonstrates proficiency in:

Infrastructure Provisioning: Deploying Linux VM instances on Google Cloud.

Network Security: Managing GCP Firewall rules, target tags, and network access.

Containerization: Writing custom Dockerfiles and building optimized Alpine-based images.

Observability: Installing and configuring the GCP Ops Agent to capture VM-level metrics.

Automation (IaC): Translating manually built cloud resources into reusable Terraform blueprints.

Core Technologies Used

Cloud Platform: Google Cloud Platform (GCP) Compute Engine

Operating System: Debian GNU/Linux 12

Container Engine: Docker Community Edition

Web Server: Nginx (Alpine-based)

Automation/IaC: Bash (Startup Shell Scripts) & Terraform

Repository File Structure

index.html: The responsive, highly customized CSS landing page for Munro AC.

Dockerfile: Packaging configurations instructing Docker to build our custom Alpine-Nginx image.

main.tf: The Terraform orchestration code defining the VM and security group.

variables.tf: Reusable configuration variables for the Terraform stack.

providers.tf: GCP plugin and backend configuration details for Terraform.

startup.sh: The automated bootstrap script used by Terraform to provision the environment on boot.

How to Deploy Locally via the GCP CLI & Terraform

1. Prerequisites

Install the Terraform CLI.

Install the Google Cloud SDK (gcloud CLI).

Authenticate your local machine with Google Cloud:

gcloud auth application-default login


2. Deployment

Clone this repository to your local machine:

git clone https://github.com/YOUR_USERNAME/YOUR_REPOSITORY.git
cd YOUR_REPOSITORY


Initialize Terraform to download the GCP provider plugins:

terraform init


Preview the infrastructure deployment plan:

terraform plan -var="project_id=YOUR_GCP_PROJECT_ID"


Deploy the infrastructure to GCP:

terraform apply -var="project_id=YOUR_GCP_PROJECT_ID" --auto-approve


Within approximately 60 seconds, the VM will boot, execute the automated startup.sh script to install Docker, pull the codebase, spin up your custom container, and output your live IP address.

SysAdmin Observability & Verification

To verify the host's performance, the Google Cloud Ops Agent is actively installed on the VM. It streams CPU utilization, memory distribution, and system logs back to Google Cloud Monitoring.

Uptime Validation: Verified locally inside the host via curl http://localhost:80.

Container Health: Checked via host CLI: docker ps -a showing healthy execution bounds.

Monitoring Dashboards: Visible in the GCP Console under Monitoring -> Dashboards -> VM Instances.
