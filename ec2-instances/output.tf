
output "dev_vpc" {
  value = aws_vpc.dev_vpc.id 
}

output "dev-subnet" {
value = aws_subnet.dev_subnet.id
  
}

output "dev_ec2" {
 value = aws_instance.dev_ec2.id 
}