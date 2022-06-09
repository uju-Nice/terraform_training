pipeline {
    agent any 

    stages{
        stage('Git Checkout'){
           steps{
             git credentialsId: '09820cf9-0047-4f02-93d4-a31e09ce5b38', url: 'https://github.com/uju-Nice/terraform_training.git'
           }
        } 
       
        stage("terraform init"){
           steps{
             sh 'terraform init' 
               sh 'set +e &&  git commit -m "File update" && set -e'
           } 
        }
        stage("Terraform fmt"){
            steps{
             sh 'terraform fmt'
          }
        }
        
        stage("terraform plan"){
            steps{
             sh 'terraform plan'
          }
        }
        
         stage("Terraform apply"){
            steps{
               sh 'terraform apply --auto-approve' 
            }
         }
            
    }
}

    
    
    
    
