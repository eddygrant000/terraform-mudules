pipeline{
    agent any
    environment {
    SVC_ACCOUNT_KEY = credentials('aws_secret_id')
  }
  
     stages {
      
          stage('Terraform Init'){
              steps{
                  sh 'terraform init'
              }
          }

           stage('Terraform validate'){
              steps{
                   sh 'terraform validate'
              }
          }
         stage('Terraform plan'){
              steps{
                   sh 'terraform plan'
              }
          }
         stage('Terraform apply'){
              steps{
                   sh 'terraform apply'
              }
          }
     }
}
