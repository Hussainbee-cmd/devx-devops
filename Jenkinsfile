pipeline {
    agent any

    stages {
        stage("SCM Checkout") {
            steps {
                git branch: 'main', credentialsId: '7d00dc2e-fce9-40f9-b78e-2bb85fb102b1', url: 'https://github.com/Hussainbee-cmd/devx-devops-pipeline.git'
            }
        }

        stage("Maven Package") {
            steps {
                sh 'mvn clean package'
            }
        }

        stage("Build Docker Image") {
            steps {
                // Explicitly tag the Docker image
                sh 'docker build -t hussainbeecmd/devx-devops-pipeline:latest .'
            }
        }

        stage("Push Docker Image") {
            steps {
                withCredentials([string(credentialsId: 'ec92c4c0-da45-425f-8f00-e5a2aff766e6', variable: 'dockerhubpwd')]) {
                    sh 'echo ${dockerhubpwd} | docker login -u hussainbeecmd --password-stdin'
                }
                sh 'docker push hussainbeecmd/devx-devops-pipeline:latest'
            }
        }

        stage("Deploy to Kubernetes") {
            steps {
                withKubeConfig([credentialsId: 'kubeconfig-credential-id']) {
                    sh 'kubectl set image deployment/devx-devops-pipeline devx-devops-pipeline=hussainbeecmd/devx-devops:latest -n default'
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
