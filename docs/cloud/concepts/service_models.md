# Service Models

## IaaS (Infrastructure as a Service)

### Includes

- Virtual machines
- Storage
- Networking
- Firewalls
- Load balancers

### Your Responsibilities

- Operating system
- Runtime
- Scaling
  - configure with autoscaling groups, etc...
- Applications
- Data

### Provider Responsibilities

- Physical servers
- Data centers
- Networking hardware
- Virtualization layer

## PaaS (Platform as a Service)

### Includes

- Managed OS
- Managed runtime (Node, Java, Python, etc.)
- Auto scaling by provider (you define limits or policies)
- Built-in monitoring

### Your Responsibilities

- Application code
- Application configuration
- Data

### Provider Responsibilities

- Infrastructure
- Operating system
- Runtime
- Scaling
- Platform-level security
- Platform availability

## SaaS (Software as a Service)

### Includes

- API access
- Application access

#### Example

- Gmail
- Meta Platforms (Facebook)
- Salesforce

### Your Responsibilities

- User configuration
- Data

### Provider Responsibilities

- Everything

## Responsibilities Comparison

| Layer              | IaaS     | PaaS     | SaaS     |
| ------------------ | -------- | -------- | -------- |
| User Configuration | You      | You      | You      |
| Data Ownership     | You      | You      | You      |
| Application Code   | You      | You      | Provider |
| Runtime            | You      | Provider | Provider |
| OS                 | You      | Provider | Provider |
| Scaling            | You      | Provider | Provider |
| Infrastructure     | Provider | Provider | Provider |
