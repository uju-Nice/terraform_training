# This is for terraform_training documentation    
Download Terraform on OS:
https://www.terraform.io/downloads
               
Install terraform on  Linux CLI:                                                                                             curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
           sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
          sudo apt-get update && sudo apt-get install terraform sudo apt-get update && sudo apt-get install terraform


Prerequisites
The Terraform CLI (0.14.9+) should have installed installed.
Login into aws and download AWS CLI so aws cli should have been installed.
Create I AM User and generate aws access key and secret access credentias from aws console 
Authenticate the Terraform with AWS provider then you need to set the AWS_ACCESS_KEY_ID environment variable.
export AWS_ACCESS_KEY_ID="<YOUR_AWS_ACCESS_KEY_ID>"
export AWS_SECRET_ACCESS_KEY="<YOUR_AWS_SECRET_ACCESS_KEY>"
export AWS_DEFAULT_REGION="<YOUR_AWS_DEFAULT_REGION>"
