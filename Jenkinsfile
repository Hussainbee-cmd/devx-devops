pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    docker.build('hussainbeecmd/devx-devops')
                }
            }
        }
        stage('Push') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        docker.image('hussainbeecmd/devx-devops').push('latest')
                    }
                }
            }
        }
    }
}
