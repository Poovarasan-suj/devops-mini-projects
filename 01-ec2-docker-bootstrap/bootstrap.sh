#!/bin/bash

yum update -y && yum install docker -y

if [ $? -eq 0 ]; then
    usermod -aG docker ec2-user
    systemctl enable --now docker
else
    exit 1
fi