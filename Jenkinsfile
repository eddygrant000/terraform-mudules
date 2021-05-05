pipeline{
    agent any
    parameters {
       choice(name: 'INPUT', choices: ['CREATE ','DESTROY'])
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
                  withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws_cd', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                       if  (params.INPUT == "CREATE" )
                      {
                         sh 'terraform plan'
                      }
                  }
              }
         }
       
         stage('Terraform apply'){
              steps{
                  withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws_cd', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                       if  (params.INPUT == "CREATE" )
                      {
                          sh 'terraform apply -auto-approve'
                      }
                  }
              }
         }
     }
}
