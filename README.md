# portfolio-linux-sandbox
A cloud-hosted Linux system administration project featuring shell script automation, containerized Nginx delivery, and GCP Cloud Monitoring.

flowchart TD
    User([Internet User])
    FW{GCP Firewall}

    subgraph VPC_Network ["Google Cloud VPC Network"]
        VM["Compute Engine VM (Debian Linux)"]
    end

    subgraph Host_Environment ["VM Host Local Environment"]
        Docker{Docker Engine}
        Container["Nginx Docker Container (Alpine Base)"]
        HTML["Custom index.html (Munro AC)"]
    end

    User -->|HTTP Port 80| FW
    FW -->|"Allowed via tag: http-server"| VM
    VM -->|"Port Mapping 80:80"| Docker
    Docker --> Container
    Container --> HTML
