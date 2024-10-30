terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.region
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
}

resource "aws_security_group" "sg_terraform" {
    vpc_id = "vpc-00669716a637583f3"  # Existing VPC ID
    
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere (can be restricted)
    }
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP
    }
    
    tags = {
      Name = "sg_terraform"
    }
}

resource "aws_instance" "ec2_app_server" {
  ami                    = var.amiID
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg_terraform.id]
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  tags = {
    Name = "TerraformGitHubActionsEc2"
  }
}
