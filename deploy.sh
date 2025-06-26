#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo usermod -aG docker ec2-user
docker build -t webapp .
docker run -d -p 80:3000 webapp
