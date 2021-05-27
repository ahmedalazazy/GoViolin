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
            post {
                failure {
                    mail bcc: "", body: "Project: $JOB_NAME<br>Build Number: $BUILD_NUMBER<br>build URL: $BUILD_URL", cc: "", charset: "UTF-8", from: "", mimeType: "text/html", replyTo: "", subject: "ERROR CI: Project name -> $JOB_NAME", to: "$REPORTING_EMAIL";  
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
