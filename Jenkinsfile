pipeline{
    agent any
    tools  {
          terraform 'terraform-11'
     }
     stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main',
           
                url: 'https://github.com/navneetguraya/aprilterraform.git'
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
