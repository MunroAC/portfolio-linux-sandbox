# portfolio-linux-sandbox
A cloud-hosted Linux system administration project featuring shell script automation, containerized Nginx delivery, and GCP Cloud Monitoring.

flowchart TD
    User([Internet User]) -->|HTTP Port 80| FW{GCP Firewall}
    
    subgraph VPC_Network [Google Cloud VPC Network]
        FW -->|Allowed via tag: 'http-server'| VM[Compute Engine VM <br> Debian Linux]
    end

    subgraph Host_Environment [VM Host Local Environment]
        VM -->|Port Mapping 80:80| Docker{Docker Engine}
        Docker --> Container[Nginx Docker Container <br> Alpine Base]
        Container --> HTML[Custom index.html <br> Munro AC]
    end
