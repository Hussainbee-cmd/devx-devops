pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    docker.build('hussainbeecmd/devx-devops-pipeline')
                }
            }
        }
        stage('Push') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        docker.image('hussainbeecmd/devx-devops-pipeline').push('latest')
                    }
                }
            }
        }
    }
}
