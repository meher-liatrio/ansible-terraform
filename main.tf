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
  profile = "meher"
  region = "us-east-1"
}

resource "aws_instance" "self_hosted_runner" {
  associate_public_ip_address = true
  vpc_security_group_ids = ["sg-06198c96f581e0a30"]
  subnet_id              = "subnet-019c03f7b62349192"
  ami                    = "ami-07caf09b362be10b8"
  instance_type          = "t2.micro"
  key_name               = "gh-runner-key"
  tags = {
    Name          = var.instance_name
    Client        = "Internal"
    Project       = "DOB"
    Owner         = "Meher"
    Application   = "self-hosted-runner"
    Environment   = "test"
  }
  provisioner "local-exec" {
    command = "chmod +x ./run_playbook.sh && ./run_playbook.sh ${self.public_ip}"
  }
}

