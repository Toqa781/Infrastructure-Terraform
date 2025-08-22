# Infrastructure-Terraform

This repository provisions an Amazon VPC and an Amazon EKS cluster using Terraform.
It follows a modular structure with reusable vpc/ and eks/ modules.


## 🚀 AWS Infrastructure with Terraform (VPC + EKS)

### This Terraform project provisions a complete AWS infrastructure including:

- A VPC named sprints-cluster-vpc

- 2 Public and 2 private subnets across 2 Availability Zones

- Internet Gateway & 2 NAT Gateways for outbound access

- 2 Public & 2 Private Route Tables for traffic routing


## 📂 Project structure
```bash
.
├── 0-providers.tf        # AWS provider configuration
├── 1-backend.tf          # Remote backend configuration (S3, DynamoDB)
├── 2-main.tf             # Main entrypoint calling VPC and EKS modules
├── 3-variables.tf        # Global variables
├── 4-outputs.tf          # Global outputs
├── 5-terraform.tfvars    # Variable values (cluster name, subnets, etc.)
│
├── vpc/                  # VPC module
│   ├── 1-main.tf
│   ├── 2-subnets.tf
│   ├── 3-igw.tf
│   ├── 4-nat.tf
│   ├── 5-routetables.tf
│   ├── variables.tf
│   ├── outputs.tf
│
└── eks/                  # EKS module
    ├── 1-main.tf
    ├── 2-node_group.tf
    ├── variables.tf
    ├── outputs.tf

```

## ⚙️ Infrastructure Details
### 🏗️ VPC (sprints-cluster-vpc)

- CIDR block: defined in 5-terraform.tfvars  [ 10.0.0.0/16 ]

- 2 Availability Zones: [eu-central-1a, eu-central-1b]

- 2 Public Subnets (1 per AZ) with CIDR Blocks: [ 10.0.3.0/24, 10.0.4.0/24 ]

- 2 Private Subnets (1 per AZ) with CIDR Blocks: [ 10.0.3.0/24, 10.0.4.0/24 ]

- 1 Internet Gateway

- 2 NAT Gateways (1 per AZ)

- 2 Public Route Tables (for internet access)

- 2 Private Route Tables (for private traffic via NAT)

### ☸️ EKS Cluster

- EKS Cluster "sprints-cluster" created inside the VPC

- Uses the private subnets for worker nodes

- Node Group with:

    - Configurable instance type(s)

    - Auto-scaling settings (desired_size, min_size, max_size)

## ⚙️ Prerequisites
### Before using this project, ensure you have:

Terraform
 ≥ 1.3

AWS CLI
 configured with proper credentials

An AWS account with permissions to manage VPC, IAM, and EKS resources

## 🚀 Usage
1- Clone the repository
```bash
git clone https://github.com/Toqa781/Infrastructure-Terraform.git
cd Infrastructure-Terraform
```
2- Initialize Terraform
```bash
Terraform init
```
3- Validate configuration
```bash
Terraform validate
```

4- Preview changes
```bash
Terraform plan
```

5- Apply configuration
```bash
Terraform apply -auto-approve
```

## 📤 Outputs

### After deployment, Terraform will export values such as:

VPC ID

Private & Public Subnet IDs

EKS Cluster Name & Endpoint

## 🧹 Cleanup
To destroy all resources created:
```bash
terraform destroy -auto-approve
```
