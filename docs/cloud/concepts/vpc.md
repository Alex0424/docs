# Virtual Private Cloud

```mermaid
flowchart TB
    %% Region
    subgraph REGION["stockholm-2 (region)"]
        direction TB

        %% VPC
        subgraph VPC["10.0.0.0/16 (VPC)"]
            direction TB

            %% Internet Gateway
            IGW((Internet<br/>Gateway))

            %% AZ 1
            subgraph AZ1["availability zone 1"]
                direction LR

                %% Public Subnet
                subgraph PUB1["10.0.1.0/24 (public subnet)"]
                    LB1["Load Balancer Node<br/>10.0.1.10"]
                end

                %% Private App Subnet
                subgraph APP1["10.0.2.0/24 (private subnet)"]
                    EC21["VM Instance<br/>10.0.2.10"]
                end

                %% Private DB Subnet
                subgraph DB1["10.0.3.0/24 (private subnet)"]
                    RDS1["Database<br/>10.0.3.10"]
                end
            end

            %% AZ 2
            subgraph AZ2["availability zone 2"]
                direction LR

                %% Public Subnet
                subgraph PUB2["10.0.4.0/24 (public subnet)"]
                    LB2["Load Balancer Node<br/>10.0.4.10"]
                end

                %% Private App Subnet
                subgraph APP2["10.0.5.0/24 (private subnet)"]
                    EC22["VM Instance<br/>10.0.5.10"]
                end

                %% Private DB Subnet
                subgraph DB2["10.0.6.0/24 (private subnet)"]
                    RDS2["Database<br/>10.0.6.10"]
                end
            end

            %% Internet connections
            IGW --- LB1
            IGW --- LB2

            %% Cross-AZ load balancing
            LB1 --> EC21
            LB1 --> EC22

            LB2 --> EC21
            LB2 --> EC22

            %% App to DB
            EC21 --> RDS1
            EC22 --> RDS2
        end
    end

    %% Styling
    classDef public fill:#1b5e20,stroke:#4caf50,color:#ffffff,stroke-width:2px;
    classDef private fill:#0d47a1,stroke:#42a5f5,color:#ffffff,stroke-width:2px;
    classDef resource fill:#1e1e1e,stroke:#bbbbbb,color:#ffffff;

    class PUB1,PUB2 public;
    class APP1,APP2,DB1,DB2 private;
    class LB1,LB2,EC21,EC22,RDS1,RDS2,IGW resource;
```

A VPC is an isolated virtual network inside a public cloud provider where you can deploy and manage your own infrastructure.

## What You Can Configure

Inside a VPC, you can configure:

- Virtual machines / servers
- Route tables
- Internet gateways
- Subnets
- Security groups / firewall rules
- Load balancers
- Private and public networking

## Subnets

A VPC can contain multiple subnets.

- **Public subnets**
    - Accessible from the internet
    - Usually contain load balancers, NAT gateways, or bastion hosts

- **Private subnets**
    - Not directly accessible from the internet
    - Usually contain application servers and databases

- Configure IPv4 adress range
    - example:
        - 10.0.0.0/8 — large network (millions of IP addresses)
        - 10.0.0.0/16 — medium network (65,536 IP addresses)
        - 10.0.0.0/24 — small network (256 IP addresses)
