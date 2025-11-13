# 📘 Wave-App Infrastructure

This repository contains the complete **Infrastructure-as-Code (IaC)** setup for the **Wave-App** project - a full-stack application (Frontend React + Backend Flask) deployed on **Amazon EKS**, following production-grade DevOps standards.

All infrastructure is fully automated using **Terraform**, structured according to best practices, and separated into three isolated environments:

- **dev**
- **stage**
- **prod**

Each environment has its own state, VPC, EKS cluster, ECR registries, and backup resources.

---

## 📁 Repository Structure

```text
wave-app-infra/
├── .gitignore
├── README.md
├── modules/
│   ├── network/       # VPC, subnets, routing, NAT, tags for EKS
│   ├── eks/           # EKS cluster + managed node groups
│   ├── ecr/           # ECR repos for frontend & backend
│   └── backup/        # S3 backup bucket with versioning & lifecycle
└── env/
    ├── dev/           # Environment-specific Terraform deployment
    ├── stage/
    └── prod/
```

---

## 🧩 Modules

### **1. Network Module**
Creates a production-ready AWS VPC designed for Kubernetes workloads:

- Multi-AZ VPC  
- Public + private subnets  
- NAT Gateway  
- DNS Hostnames + DNS Resolution  
- Subnet tagging for EKS (internal/external ALBs)

---

### **2. EKS Module**
Deploys the Kubernetes control plane:

- AWS EKS Cluster  
- Managed Node Group  
- Version-controlled K8s upgrades  
- Worker nodes in private subnets  

---

### **3. ECR Module**
Creates two registries per environment:

- `frontend`
- `backend`

Used by CI/CD pipelines to push Docker images.

---

### **4. Backup Module**
Creates an isolated S3 bucket per environment:

- Versioning enabled  
- AES256 encryption  
- Lifecycle cleanup rules  
- Ideal for backups and exported artifacts  

---

## 🌍 Environments (dev / stage / prod)

Each environment contains:

| File | Purpose |
|------|---------|
| `backend.tf` | Remote state (S3 + DynamoDB) |
| `providers.tf` | AWS provider |
| `variables.tf` | Variables for environment |
| `main.tf` | Calls all modules |
| `outputs.tf` | Useful outputs |
| `<env>.tfvars` | Values per environment |

Each environment is deployed separately for full isolation.

---

## 🗂 Remote State Configuration

Terraform state is stored securely using:

### **S3 Bucket**
Stores:
- `env/dev/terraform.tfstate`
- `env/stage/terraform.tfstate`
- `env/prod/terraform.tfstate`

### **DynamoDB Table**
Provides:
- State lock  
- Prevents concurrent terraform apply  
- Ensures safe team collaboration  

---

## ⚙️ Deployment Instructions

### 1. Configure AWS credentials
```bash
aws configure
```

### 2. Deploy an environment

#### Dev
```bash
cd env/dev
terraform init
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"
```

#### Stage
```bash
cd env/stage
terraform init
terraform plan -var-file="stage.tfvars"
terraform apply -var-file="stage.tfvars"
```

#### Prod
```bash
cd env/prod
terraform init
terraform plan -var-file="prod.tfvars"
terraform apply -var-file="prod.tfvars"
```

---

## 🔗 Connect to EKS

```bash
aws eks update-kubeconfig \
  --region us-east-1 \
  --name wave-app-dev-eks
```
