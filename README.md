# Threat Modelling Tool on AWS ECS

![App Demo](./images/Animation.gif)

---

## Tools and Technologies Used

<p align="center">
  <img src="https://img.shields.io/badge/AWS-ECS-orange?logo=amazonaws&logoColor=white" alt="AWS ECS" />
  <img src="https://img.shields.io/badge/Terraform-v1.5-blue?logo=terraform&logoColor=white" alt="Terraform" />
  <img src="https://img.shields.io/badge/Docker-Multi--Stage-blue?logo=docker&logoColor=white" alt="Docker" />
  <img src="https://img.shields.io/badge/GitHub-Actions-black?logo=github&logoColor=white" alt="GitHub Actions" />
  <img src="https://img.shields.io/badge/Trivy-Security-green?logo=aqua&logoColor=white" alt="Trivy" />
  <img src="https://img.shields.io/badge/Checkov-Infrastructure-green?logo=checkmarx&logoColor=white" alt="Checkov" />
  <img src="https://img.shields.io/badge/Node.js-v18-green?logo=node.js&logoColor=white" alt="Node.js" />
  <img src="https://img.shields.io/badge/Yarn-v1.22-blue?logo=yarn&logoColor=white" alt="Yarn" />
</p>

---

## Overview

This project showcases the deployment of Amazon's open-source **Threat Modelling Tool** on AWS ECS. The solution is designed to be highly scalable, secure, and production-ready, leveraging modern DevOps practices, including multi-stage Docker builds, modular Terraform configuration, and a robust CI/CD pipeline. Advanced security measures such as image scanning with Trivy and infrastructure security validation with Checkov are integrated to ensure reliability and compliance.

---

## Features

- **Scalability**: Deployed using AWS ECS with Fargate for automatic scaling and high availability.
- **Security**: 
  - Docker images scanned with **Trivy** to identify vulnerabilities.
  - Infrastructure validated with **Checkov** to ensure compliance with best practices.
- **Production-Ready**: HTTPS integration for secure communication and robust infrastructure design.
- **CI/CD Pipeline**: Automated deployment pipeline for seamless integration and delivery.
- **Modular Terraform**: Clean and reusable infrastructure as code using modularised Terraform.
- **Multi-Stage Docker Builds**: Lightweight and optimised container images.

---

## Architecture

### High-Level Workflow
1. **Infrastructure**:
   - VPC with public subnets for load balancer and private subnets for ECS tasks.
   - Application Load Balancer (ALB) with HTTPS termination.
   - ECS Cluster using Fargate for serverless compute.

2. **Deployment Pipeline**:
   - CI/CD pipeline automates the build, test, and deploy process.
   - Docker image built and pushed to AWS ECR.
   - Terraform provisions AWS resources and deploys the app.

3. **Security Enhancements**:
   - Docker image scanned for vulnerabilities using **Trivy**.
   - Terraform code checked for misconfigurations with **Checkov**.



---

### **Setup Instructions**

#### **1. Clone the Repository**
```bash
git clone [repo-url]
cd [repo-directory]
```

#### **2. Docker Setup**
Build and run the application locally using Docker:
```bash
yarn install
yarn build
yarn start
```
Access the app locally at `http://localhost:3000`.

#### **3. Deploy with Terraform**

Initialise Terraform:
```bash
terraform init
```

Preview changes:
```bash
terraform plan
```

Apply the infrastructure deployment:
```bash
terraform apply
```

Once deployed, access the tool via the custom domain.

#### **4. Clean Up Resources**
After the demo, clean up the AWS resources:
```bash
terraform destroy
```

---
