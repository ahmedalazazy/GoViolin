pipeline {
    agent any
    environment {
        registry = "ahmedal3zazy/instabug"
        registryCredential = "docker-cred"
        REPORTING_EMAIL = "ahmedal3zazy900@gmail.com"
        kubeconfigId = "kubeconfigId"
    }
    stages{
        stage("Building image") {
            steps {
                catchError {
                    script {
                        dockerImage = docker.build(registry + ":$BUILD_NUMBER")
                    }
                }
            }

            post {
                failure {
                    mail bcc: "", body: "Project: $JOB_NAME<br>Build Number: $BUILD_NUMBER<br>build URL: $BUILD_URL", cc: "", charset: "UTF-8", from: "", mimeType: "text/html", replyTo: "", subject: "ERROR CI: Project name -> $JOB_NAME", to: "$REPORTING_EMAIL";  
                }
            }
        }

        stage("Pushing image") {
            steps {
                script {
                    docker.withRegistry("", registryCredential) {
                        dockerImage.push("latest")
                    }
                }
            }
        }

        stage("Removing local image") {
            steps {
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }

        stage("Deploying") {
            steps {
                script {
                   kubernetesDeploy(configs: "deployment.yml", kubeconfigId: kubeconfigId)
                }
            }
        }
    }
}
