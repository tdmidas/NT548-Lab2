provider "aws" {
  region = var.region
}

locals {
  project_name = "lab2-group13"
}


resource "aws_security_group" "public_ssh-sg" {
  vpc_id      = var.vpc_id
  description = "Allow SSH to EC2 instances in public subnet from a specific IP address"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.cidr_block]
    description = "Allow SSH from a specific IP address"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all traffic to the internet"
  }
  tags = {
    Name = "${local.project_name}-public-ssh-sg"
  }
}

resource "aws_security_group" "private_ssh-sg" {
  vpc_id      = var.vpc_id
  description = "Allow SSH to EC2 instances in private subnet from bastion host"
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.public_ssh-sg.id]
    description     = "Allow SSH from bastion host"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all traffic to the internet"
  }
  tags = {
    Name = "${local.project_name}-private-ssh-sg"
  }
}