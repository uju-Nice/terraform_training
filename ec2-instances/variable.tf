
variable "aws_vpc"{
cidr_block = "10.0.0.0/16"
}

variable "dev_subnet " {
  subnet_cidr = "10.0.0.0/24"
  vpc_id = "aws_subnet.dev-subnet.id"
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-west-1a"]
  availability_zone_names =["us-east-1a","us-west-1c"]
}


variable "instance_type" {
  description = "An ec2 instance"
  type = string
}




