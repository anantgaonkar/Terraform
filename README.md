# 🚀 Terraform AWS VPC + EC2 + Nginx Deployment

This project demonstrates how to use **Terraform** to create a complete AWS infrastructure, including:

- A **VPC**
- **1 Public Subnet**
- **2 Private Subnets**
- An **EC2 instance** in the public subnet
- Automatic installation of **Nginx web server**
- Accessing the Nginx page via the EC2 **public IP**

It is designed for beginners learning Terraform and showcases how infrastructure can be automated using IaC.

---

## 📌 Architecture Overview

Terraform provisions the following AWS resources:

### 🏗️ Networking
- **VPC** with custom CIDR block
- **1 Public subnet**
- **2 Private subnets**
- **Internet Gateway** (for public subnet)
- **Route tables** for public & private subnets

### 💻 Compute
- **EC2 Instance** launched in the **public subnet**
- User-data script automatically installs **Nginx**
- Security group allowing **HTTP (80)** and **SSH (22)**

### 🌐 Output
- After applying Terraform, it prints the **public IP** of the EC2 instance
- You can access Nginx at:
  ```
  http://<EC2_PUBLIC_IP>
  ```

---

## 📂 Project Structure

```
.
├── main.tf
├── variables.tf
├── outputs.tf
└── README.md
```

---

## 🔧 Prerequisites

- AWS account
- IAM user with `AdministratorAccess`
- AWS CLI installed and configured
- Terraform installed (v1.x or later)

---

## 🚀 How to Deploy

```sh
terraform init
terraform validate
terraform plan
terraform apply
```

---

## 🎉 Access the Nginx Server

Retrieve the public IP from Terraform output and open:

```
http://<EC2_PUBLIC_IP>
```

---

## 🧹 Destroy Infrastructure

```
terraform destroy
```

---

## 🤝 Contributions

Pull requests and suggestions are welcome!
