# terraform {
#   backend "s3" {
#     bucket = "devops_bucket"    // name of your bucket
#     key = "key/bucket/Terraform_statefiles"     // Path to where to keep your bucket 
#   }
# }



provider "aws" {
  //region = "us-east-1"
  region  = var.region
  //access_key = ""
  //secret_key = ""
}


#  data "aws_instance" "dev_instance" {
#   // filters the particular instace you want from multiple resources
#   filter {
#    name = "tag:Name"
#     values = [ "dev-instance" ]
#   }

#   depends_on = [
#     aws_instance.devops_ec2
#   ]
# }

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
#   public_key = "${file("id_rsa.pub")}"
# }

resource "aws_instance" "devops_ec2" {
  //instance_type = "t2.micro"
  instance_type = var.my_instance
  ami = var.ami

  tags = {
  Name = "${local.instance_name}-instance"    
  }

  user_data = "${file("install_httpd.sh")}"

#This user-date is inside the install.sh file 
#    user_data = <<-EOF
#    #!/bin/bash 
#    sudo apt install -y http  && apt update 
#    sudo systemctl enable http && systemctl start http
#    sudo systemctl status http
#    sudo chown -R $USER:$USER /var/www/html
#    sudo echo "<html><body><h1> Welcome to Devops world" </h1></body></html>  >>  /var/www/html/index.html
# EOF

}


# resource "aws_s3_bucket" "bucket" {
#   bucket = "devop-bucket"

#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
# }

# resource "aws_s3_bucket_acl" "bucket_acl" {
#   bucket = aws_s3_bucket.bucket.id
#   acl    = "private"
# }

// These are the variables to be used in the configuration file 

variable "region" {
  default = "us-east-1"
  
}
variable "my_vpc" {
  default = "10.0.0.0/16"
}

variable "my_subnet" {
  default = "10.0.0.0/24"
}

variable "availability_zones" {
  default = ["us-east-1a", "us-east-1b"]
  type = list 
}

variable "my_instance" {
 default = "t2.micro"
  description = "An ec2 instance"
  type = string
  
}

variable "ami" {
  default =  "ami-0022f774911c1d690"
}


output "get_ip_of-ec2" {
 value =  aws_instance.devops_ec2.public_ip
}

output "get_id_of-ec2" {
 value2 = aws_instance.devops_ec2.id
}











