# 🚀 Node.js URL Shortener — AWS DevOps Project

A production-oriented DevOps project demonstrating how to containerize, provision, deploy, and automate a Node.js URL Shortener application using **Docker, AWS, Terraform, Nginx, and GitHub Actions**.

The goal of this project is to implement an end-to-end DevOps workflow instead of working with individual tools in isolation.

---

## 🏗️ Architecture

```text
                         Developer
                             │
                             │ git push
                             ▼
                         GitHub
                             │
                             ▼
                     GitHub Actions
                             │
                  ┌──────────┴──────────┐
                  │                     │
               Lint & Test         Docker Build
                  │                     │
                  └──────────┬──────────┘
                             │
                             ▼
                         AWS EC2
                    ┌───────────────┐
                    │     Nginx     │
                    │      :80      │
                    └───────┬───────┘
                            │
                            ▼
                    Node.js Application
                       Docker :3000
                            │
                            │ MySQL
                            ▼
                       AWS RDS
                      MySQL :3306
```

### Infrastructure

```text
Terraform
    │
    ├── VPC
    ├── Subnets
    ├── Internet Gateway
    ├── Route Tables
    ├── Security Groups
    ├── EC2
    └── RDS MySQL
```

---

## 🛠️ Technology Stack

| Technology     | Purpose                      |
| -------------- | ---------------------------- |
| Linux          | Server environment           |
| Git            | Version control              |
| GitHub         | Source code management       |
| Node.js        | Application runtime          |
| Express.js     | Web framework                |
| MySQL          | Database                     |
| Sequelize      | ORM                          |
| Docker         | Application containerization |
| Docker Compose | Container orchestration      |
| AWS EC2        | Application server           |
| AWS RDS        | Managed MySQL database       |
| AWS VPC        | Network infrastructure       |
| Terraform      | Infrastructure as Code       |
| Nginx          | Reverse proxy                |
| GitHub Actions | CI/CD automation             |

---

## 📂 Project Structure

```text
url-shortener-devops/
│
├── api/
│   └── models/
│
├── config/
│   ├── env/
│   │   ├── development.js
│   │   ├── production.js
│   │   ├── test.js
│   │   └── index.js
│   │
│   ├── express.js
│   └── sequelize.js
│
├── test/
│   └── url.test.js
│
├── public/
│   ├── css/
│   └── javascript/
│
├── Dockerfile
├── docker-compose.yml
├── package.json
├── package-lock.json
│
├── terraform/
│   ├── provider.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   ├── vpc.tf
│   ├── subnet.tf
│   ├── internet-gateway.tf
│   ├── route-table.tf
│   ├── security-groups.tf
│   ├── ec2.tf
│   ├── rds.tf
│   └── outputs.tf
│
└── .github/
    └── workflows/
        └── ci-cd.yml
```

---

# ☁️ AWS Infrastructure

The infrastructure is provisioned using **Terraform**.

### Resources

* VPC
* Public and private subnets
* Internet Gateway
* Route tables
* Security Groups
* EC2 instance
* Amazon RDS MySQL
* SSH key pair

Terraform provides reproducible infrastructure instead of manually creating AWS resources.

---

# 🐳 Docker

The Node.js application is containerized using Docker.

Build the image:

```bash
docker build -t url-shortener .
```

Run the application:

```bash
docker run -p 3000:3000 url-shortener
```

---

# 🐳 Docker Compose

Docker Compose is used to manage the application and database containers during development/testing.

Start services:

```bash
docker compose up -d
```

Check containers:

```bash
docker compose ps
```

View logs:

```bash
docker compose logs
```

Stop services:

```bash
docker compose down
```

---

# 🗄️ Database

The application uses **MySQL** through Sequelize.

Configuration is controlled through environment variables:

```env
DB_HOST=
DB_PORT=3306
DB_NAME=
DB_USER=
DB_PASSWORD=
```

Production deployments use **Amazon RDS MySQL** rather than relying on a database running directly on the EC2 host.

Sensitive credentials are not committed to Git.

---

# 🌐 Nginx

Nginx is used as a reverse proxy in front of the Node.js application.

Request flow:

```text
Client
   │
   ▼
Nginx :80
   │
   ▼
Node.js :3000
   │
   ▼
MySQL / RDS :3306
```

This allows the application to expose a standard HTTP endpoint while keeping the Node.js service behind the reverse proxy.

---

# 🔄 CI/CD with GitHub Actions

The project includes a GitHub Actions pipeline.

Pipeline flow:

```text
Git Push
   │
   ▼
GitHub Actions
   │
   ├── Checkout
   ├── Setup Node.js
   ├── npm ci
   ├── ESLint
   ├── Mocha Tests
   ├── Docker Build
   │
   ▼
EC2 Deployment
   │
   ├── SSH
   ├── git pull
   ├── docker compose build
   └── docker compose up -d
```

The pipeline prevents deployment when the application tests fail.

---

# 🧪 Testing

Install dependencies:

```bash
npm ci
```

Run tests:

```bash
npm test
```

Run lint:

```bash
npm run lint
```

The CI pipeline also runs tests against a temporary MySQL service.

---

# 🚀 Deployment

### 1. Provision AWS infrastructure

```bash
cd terraform
terraform init
terraform validate
terraform plan
terraform apply
```

### 2. Connect to EC2

```bash
ssh -i ~/.ssh/id_ed25519 ubuntu@<EC2_PUBLIC_IP>
```

### 3. Clone the repository

```bash
git clone https://github.com/<USERNAME>/<REPOSITORY>.git
cd <REPOSITORY>
```

### 4. Start the application

```bash
docker compose up -d --build
```

### 5. Verify

```bash
docker ps
```

The application can then be accessed through the configured EC2 endpoint.

---

# 🔐 Security Considerations

* SSH private keys are never committed to Git.
* Terraform state files are ignored by Git.
* Terraform variables containing sensitive information are not committed.
* Database credentials are supplied through environment variables/secrets.
* AWS Security Groups restrict network access.
* Production database access should be limited to the application layer.

---

# 📊 DevOps Workflow

This project demonstrates the following DevOps lifecycle:

```text
PLAN
  ↓
Terraform
  ↓
PROVISION
  ↓
AWS Infrastructure
  ↓
BUILD
  ↓
Docker
  ↓
TEST
  ↓
GitHub Actions
  ↓
DEPLOY
  ↓
EC2
  ↓
REVERSE PROXY
  ↓
Nginx
  ↓
APPLICATION
  ↓
DATABASE
  ↓
RDS MySQL
```

---

# 🎯 What I Learned

Through this project, I practiced:

* AWS infrastructure provisioning
* Infrastructure as Code with Terraform
* Linux server administration
* Docker containerization
* Docker Compose
* Node.js application deployment
* MySQL and RDS integration
* Nginx reverse proxy configuration
* Git and GitHub workflows
* CI/CD with GitHub Actions
* Automated EC2 deployments
* AWS networking and Security Groups
* Troubleshooting real-world deployment issues

---

# 🚧 Future Improvements

Planned improvements include:

* HTTPS with SSL/TLS
* AWS Secrets Manager / Parameter Store
* Docker image registry
* Versioned Docker image deployments
* Blue/Green or Rolling deployments
* Automated rollback
* Prometheus monitoring
* Grafana dashboards
* Centralized logging
* Improved AWS security
* Auto Scaling
* Application health checks

---

# 👨‍💻 Author

**Huzoor Laghari**

Computer Science Student | Cloud & DevOps Learner

Focused on building practical skills in:

**AWS • Linux • Docker • Terraform • CI/CD • Cloud Computing • DevOps**

---

## ⭐ Project

If you find this project useful, consider giving the repository a ⭐.

This project was built as a hands-on learning exercise to understand how modern DevOps tools work together in a real-world cloud deployment workflow.
