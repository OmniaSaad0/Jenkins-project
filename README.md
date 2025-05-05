#  Jenkins CI/CD Pipeline Project

This project implements a complete **CI/CD pipeline** using **Jenkins**, **Terraform**, **Ansible**, **Docker**, and **AWS** services. The pipeline provisions cloud infrastructure, configures a Jenkins build environment, and deploys a Node.js application integrated with RDS and Redis.

---

## 📌 Project Overview

| Stage | Tools Used | Description |
|-------|------------|-------------|
| 1️⃣ Provision Infrastructure | Terraform, Jenkins | Automate AWS resource creation using a Jenkins pipeline and Terraform. |
| 2️⃣ Configure Jenkins Slave | Ansible, SSH | Prepare a private EC2 instance as a Jenkins agent with all dependencies. |
| 3️⃣ Build & Deploy App | Docker, Jenkins, AWS | Build, push Docker image, and deploy Node.js app connected to MySQL RDS and Redis. |

---

## 🏗️ Stage 1: Infrastructure Provisioning

🔗 Repo: [test-terraform-jenkins](https://github.com/OmniaSaad0/test-terraform-jenkins)

- Run a Jenkins pipeline (Jenkinsfile) on a slave EC2 instance.
- Use **Terraform** to provision:
  - EC2 Instances (Master & Slave)
  - RDS (MySQL)
  - Elasticache (Redis)
  - Application Load Balancer
- Slack notifications are integrated for job success/failure.
- Generate a `.env` file with Terraform output variables for app deployment.

---

## ⚙️ Stage 2: Jenkins Slave Configuration

- Configure SSH access from Bastion to Private EC2 using `~/.ssh/config`.
- Update Bastion's `/etc/ssh/sshd_config` to allow:
  - TCP forwarding
  - Gateway ports
- Use **Ansible** to install on the Jenkins slave:
  - OpenJDK 17
  - Docker
  - Terraform
- Create a reverse SSH tunnel to expose Jenkins Master through the Bastion public IP.
- Launch Jenkins agent manually and connect via UI.

---

## 📦 Stage 3: Node.js Application Deployment

🔗 App Repo: [rds-redis](https://github.com/OmniaSaad0/rds-redis)

- Jenkins pulls code and Jenkinsfile from the repo.
- Builds a Docker image and pushes it to Docker Hub:
  - `omniasaad/node-jenkins:v2`
- Deploys the app using Docker Compose and the `.env` file.
- Application endpoints:
  - `/redis` — Tests Redis connection.
  - `/db` — Tests RDS (MySQL) connection.

### ✅ Example Output:

```bash
curl http://<load-balancer-DNS>/redis
# → redis is successfully connected

curl http://<load-balancer-DNS>/db
# → db connection successful

### 🧱 Architecture Summary:

                    +-------------------------+
                    |     Jenkins Master      |
                    | (reverse tunneled via   |
                    |   Bastion public IP)    |
                    +------------+------------+
                                 |
                                 ▼
               +-------------------------------+
               |       Bastion EC2 (Public)     |
               +-------------------------------+
                  |                       |
         SSH + Reverse Tunnel     SSH Access to Private EC2
                  |                       |
                  ▼                       ▼
      +------------------+      +------------------------+
      | Jenkins Slave EC2|      | RDS & Redis Instances  |
      +------------------+      +------------------------+


