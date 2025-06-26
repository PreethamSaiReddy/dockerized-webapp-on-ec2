# Dockerized Web App on AWS EC2

## Overview
This project demonstrates how to dockerize a simple Node.js application and deploy it on an AWS EC2 instance with optional automation using `cloud-init` and a shell script.

## 📁 Project Structure
```
/your-repo
├── app/
│   ├── server.js
│   └── package.json
├── Dockerfile
├── deploy.sh
├── cloud-init.txt
└── README.md
```

## 🔧 Docker Instructions
```bash
docker build -t webapp .
docker run -p 3000:3000 webapp
```

## 🚀 EC2 Setup
```bash
# SSH into EC2
ssh -i your-key.pem ec2-user@ec2-ip

# Install Docker
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo usermod -aG docker ec2-user
exit
```

Reconnect:
```bash
ssh -i your-key.pem ec2-user@ec2-ip
```

## 📦 Deploy App
```bash
scp -i your-key.pem -r * ec2-user@ec2-ip:/home/ec2-user/
ssh -i your-key.pem ec2-user@ec2-ip
cd /home/ec2-user
sudo docker build -t webapp .
sudo docker run -d -p 80:3000 webapp
```
