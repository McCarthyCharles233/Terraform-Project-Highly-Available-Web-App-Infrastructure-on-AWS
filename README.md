
---

# 🚀 Terraform AWS Infrastructure Project

This project automates the provisioning of a basic yet scalable AWS infrastructure using **Terraform**. It includes a custom VPC, public subnets, EC2 instances with Apache web servers, and an Application Load Balancer (ALB) to distribute traffic.

---

## 📦 Project Structure

```
│
├── main.tf               # Entry point: high-level orchestration of resources
├── variables.tf          # All input variables and their defaults
├── outputs.tf            # All outputs you want to expose
├── providers.tf          # Provider config and backend 
├── terraform.tfvars      # Variable values specific to this environment
│
├── modules/              # modular components (e.g., vpc, ec2, alb)
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │
│   └── alb/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│
└── README.md                  # Project documentation 
```

---

## ✅ Features

* 🔧 Custom **VPC** with two public subnets (in different AZs)
* 🌍 Public **Internet Gateway** and route table configuration
* 💻 Two **EC2 instances** with Apache installed automatically via `user_data`
* 🔒 Configurable **Security Groups** to allow HTTP/SSH access
* ⚖️ **Application Load Balancer (ALB)** with security group and subnet setup
* 📤 Outputs for public IPs and ALB DNS to access web servers

---

## 🛠 Prerequisites

* [Terraform](https://developer.hashicorp.com/terraform/downloads) v1.0+
* AWS CLI configured with a user that has appropriate IAM permissions
* An AWS key pair (for optional SSH access)
* An Ubuntu-based AMI ID

---

## 🔑 Important Variables

Defined in `variables.tf` (or passed via CLI):

```hcl
variable "ami_value" {
  description = "The AMI ID to use for the EC2 instances"
}

variable "instance_type_value" {
  description = "EC2 instance type"
}
```

---

## 📜 User Data Script (Apache Web Server Setup)

Each EC2 runs the following on first boot:

```bash
#!/bin/bash
apt update
apt install -y apache2
cat <<EOF > /var/www/html/index.html
<html><h1>Terraform Project Server</h1></html>
EOF
systemctl start apache2
systemctl enable apache2
```

---

## 🚀 Deployment Instructions

### 1. Initialize the Project

```bash
terraform init
```

### 3. Preview the Changes

```bash
terraform plan
```

### 4. Apply the Infrastructure

```bash
terraform apply
```

---

## 🌐 Accessing Your Project

### 🔹 EC2 Public IPs (from `terraform output`)

```bash
curl http://<ec2-public-ip>
```

### 🔹 Load Balancer (from `terraform output`)

```bash
http://<alb-dns-name>
```

You should see the web page: `Terraform Project Server`.

---

## 🧹 Clean Up Resources

To destroy all resources:

```bash
terraform destroy
```

---

## 🧠 Notes

* Ensure subnets fall **within the VPC CIDR** (e.g., `10.0.0.0/16`)
* Make sure EC2s are in **public subnets** with `associate_public_ip_address = true`
* Security groups **must allow inbound HTTP (port 80)**
* Apache will only install automatically if `user_data` runs successfully

---

## 📌 TODO (Future Enhancements)

* Add a private subnet + NAT Gateway
* Attach EC2s to ALB target group
* Add health checks and listeners for ALB
* Output monitoring/CloudWatch metrics
* Make environment switchable (dev, prod)

---

## 👨🏽‍💻 Author

**Charles McCarthy**
DevOps/Cloud Engineer-in-training
Learning and building one resource at a time.

---

