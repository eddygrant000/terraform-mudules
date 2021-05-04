pipeline{
    agent any
    tools  {
          terraform 'terraform-11'
     }
     stages{
          stage('Git Checkout'){
              steps{
                  git credentialsId: 'git-credentials', url: 'https://github.com/cloudtechner/cloudtechner-automation.git'
               }

          }
          stage('Terraform Init'){
              steps{
                  sh 'terraform init'
              }
          }

           stage('Terraform Plan'){
              steps{
                   sh 'terraform validate'
              }
          }
}
