terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami             = "ami-04902260ca3d33422"
  instance_type   = "t2.micro"
  key_name        = "ntrvw"
  user_data	= file("file.sh")
  
 
  tags = {
    Name = "ExampleAppServerInstance"
  }
}



output "dns"{

value =aws_instance.app_server.public_dns

}
