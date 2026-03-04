# EC2 Docker Bootstrap Automation

## Project Overview
This project demonstrates how to automatically prepare an EC2 instance for Docker workloads using a bootstrap shell script.

When the EC2 instance launches, the script performs the following tasks:

- Updates the system packages
- Installs Docker
- Adds the EC2 user to the Docker group
- Starts and enables the Docker service

This approach is commonly used in DevOps environments to automate server initialization.

---

## Architecture

User launches EC2 instance  
↓  
User data script executes  
↓  
System updated  
↓  
Docker installed  
↓  
Docker service started  

---

## Technologies Used

- AWS EC2
- Amazon Linux
- Bash Scripting
- Docker
- Linux System Administration

---