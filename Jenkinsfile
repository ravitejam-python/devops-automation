pipeline{
    agent any
        tools{
            maven 'Maven3'
        }
    
stages{
        stage('Build Maven'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ravitejam-python/devops-automation.git']])
                sh 'mvn clean install'
            }
        }
        
        stage('Build Docker Image'){
             steps{
                  script{
                      sh 'docker build -t ravitejamusinuridocker/jenkinsautomation5 .'
                  }
             }
        }
        
        stage('Push images to DockerHub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerpwd', variable: 'dockerpwd')]) {
                        sh 'docker login -u ravitejamusinuridocker -p ${dockerpwd}'
                    }
                    
                    sh 'docker push ravitejamusinuridocker/jenkinsautomation5'            
                }
            }
        }

        stage('Deploy to K8s'){
            steps{
                script{
                    kubernetesDeploy (configs: 'deploymentservice.yaml', kubeconfigId: 'k8sconfigpwd')

                }
            }
        }


        
}

}