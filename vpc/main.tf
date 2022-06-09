provider "aws" {
  //  access_key = ""
  //  secret_key = ""
  //  backend = "aws"
      region  = "us-east-1"
}

resource "aws_vpc"  "dev_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "dev-vpc"
  }

}

resource "aws_subnet" "dev_subnet" {
  cidr_block = "10.0.0.0/24"
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name = "dev-subnet"
  }

  // generating keypair (Optional)
resource "aws_key_pair" "devops_keypair" {
  key_name   = "devops_keypair"
  public_key = "${file("id_rsa.pub")}"
}

resource "aws_instance" "devops_ec2" {
  instance_type = "t2.micro"
  ami = "ami-0022f774911c1d690"

  tags = {
  Name = "dev-instance"    
  }

 user_data = <<-EOF
   #!/bin/bash
   sudo apt update && apt install -y http
   sudo systemctl enable http && systemctl start http
   sudo systemctl status http
   sudo chown _R $USER:$USER /var/www/html
   sudo echo "<html><body><h1> Welcome to Devops world" </h1></body></html>  >>  /var/www/html/index.html
EOF

}
