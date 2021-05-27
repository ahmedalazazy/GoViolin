pipeline {
    agent any
    environment {
        registry = "ahmedal3zazy/instabug"
        registryCredential = "docker-cred"
        REPORTING_EMAIL = "ahmedal3zazy900@gmail.com"
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
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push("latest")
                    }
            }
            
        }
       
    }


  }
}
