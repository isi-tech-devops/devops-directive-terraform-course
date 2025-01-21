terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"
 # count         = 4 
  for_each      = toset(["Instance_1", "Instance_2", "Instance_3",  "Instance_4"])
}

tags          = {
 Name         = "server-${each.key}"
}
