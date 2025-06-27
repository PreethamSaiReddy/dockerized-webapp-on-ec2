# Dockerized Web App on AWS EC2

Author: Preetham Reddy P V S  
GitHub Repo: https://github.com/PreethamSaiReddy/dockerized-webapp-on-ec2

---

## Overview
This project demonstrates how to dockerize a simple Node.js application and deploy it on an AWS EC2 instance. It includes optional automation using cloud-init and a shell script (deploy.sh).

---

## Project Structure
dockerized-webapp-on-ec2/
├── app/
│   ├── server.js
│   └── package.json
├── Dockerfile
├── deploy.sh
├── cloud-init.txt
└── README.md

---

## Docker Instructions (Local Machine)

# Build Docker image
docker build -t webapp .

# Run container locally
docker run -d -p 80:3000 webapp

# Verify locally
curl localhost

Screenshot: local-docker-running.png

---

## EC2 Setup

EC2 Configuration:
- AMI: Amazon Linux 2023
- Instance Type: t3.micro (Free-tier eligible)
- Inbound Rules: TCP ports 22 (SSH), 80, 3000 from 0.0.0.0/0

---

## SSH Into EC2

ssh -i PreethamReddyPVS.pem ec2-user@13.60.21.224

Screenshot: ssh-terminal-setup.png

---

## Run App on EC2 Using Docker

sudo yum update -y  
sudo yum install docker -y  
sudo service docker start  
sudo usermod -aG docker ec2-user  
exit

# Reconnect after group change
ssh -i PreethamReddyPVS.pem ec2-user@13.60.21.224

# Clone the repo and run the app
git clone https://github.com/PreethamSaiReddy/dockerized-webapp-on-ec2  
cd dockerized-webapp-on-ec2  
docker build -t webapp .  
docker run -d -p 3000:3000 webapp

Screenshot: public-ip-app-browser.png  
(Access: http://13.60.21.224:3000)

---

## Screenshots Summary

Screenshot Name              | Description
----------------------------|---------------------------------------------
local-docker-running.png    | App running locally via Docker
ec2-dashboard.png           | EC2 dashboard from AWS console
ssh-terminal-setup.png      | Terminal after SSH and running server.js
public-ip-app-browser.png   | App accessed using EC2 public IP

All screenshots are available in the Drive folder.

---

## Bonus (Optional Features Implemented)

- deploy.sh: Automates build and Docker run  
- cloud-init.txt: Automatically installs Docker & runs container on EC2 boot  
- IAM role was attached to enable `aws s3 ls` on EC2

---

## Submission Links

GitHub Repo: https://github.com/PreethamSaiReddy/dockerized-webapp-on-ec2  
Google Drive Folder: [Insert your Drive link here]

---

## Acknowledgment

Thanks to the DevOps faculty for the practical learning opportunity.  

Preetham Reddy P V S  
PES1UG21CS448 — PES University
