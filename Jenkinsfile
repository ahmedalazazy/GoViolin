pipeline {
    agent any
    environment {
        registry = "ahmedal3zazy/instabug"
        registryCredential = "docker-cred"
        kubeconfigId = "kubeconfigId"
    }
    stages{

        stage('building image ') {
            steps {
                sh 'docker build -t ahmedal3zazy/instabug:3 . '
            }
        }
       
        stage('pushing image') {
            steps {
                withDockerRg
                sh 'docker push ahmedal3zazy/instabug:3 '
            }
            
        }
       
    }


}
