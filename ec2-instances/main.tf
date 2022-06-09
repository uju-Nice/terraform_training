
# terraform {
#   backend "s3" {
#     bucket = "devops_bucket"
#     key = "key/bucket_folder"
#   }
# }



provider "aws" {
  region  = "us-east-1"
  //access_key = ""
  //secret_key = ""
}

# module "instances" {
#   source  = "../modules/instances/" 
# }


data "aws_instance" "dev_instance" {
// filters the particular instace you want from multiple resources
  filter {
   name = "tag:Name"
    values = ["dev-instance"]
  }

  depends_on = [
    aws_instance.devops_ec2
  ]


}


locals {
  instance_name = "dev"
}

// Creating resource vpc
resource "aws_vpc"  "dev_vpc" {
   cidr_block = var.my_vpc
   // cidr_block = "10.0.0.0/16"
  

  tags = {
    Name = "${local.instance_name}-vpc"
  }

}

resource "aws_subnet" "dev_subnet" {
    cidr_block = var.my_subnet
   // cidr_block = "10.0.0.0/24"
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name = "${local.instance_name}-subnet"
  }
}

#  resource "aws_key_pair" "devops_keypair" {
#   key_name   = "devops_keypair"
#   public_key = "${file("public_key")}"
# }

resource "aws_instance" "devops_ec2" {
  //instance_type = "t2.micro"
  instance_type = var.my_instance
  ami = var.ami

  tags = {
  Name = "${local.instance_name}-instance"    
  }

  user_data = "${file("install_httpd.sh")}"



}

