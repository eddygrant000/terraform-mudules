pipeline{
    agent any
  
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
