node{
    stage("SCM checkout"){
        git branch: 'main', credentialsId: '7d00dc2e-fce9-40f9-b78e-2bb85fb102b1', url: 'https://github.com/Hussainbee-cmd/devx-devops.git'

    }
    stage("Mvn package"){
        sh 'mvn clean package'

    }
    stage("Build docker image"){
        sh 'docker build -t hussainbeecmd/devx-devops .'
    }
    stage("Push docker image"){
        withCredentials([string(credentialsId: 'ec92c4c0-da45-425f-8f00-e5a2aff766e6', variable: 'dockerhubpwd')]) {
        sh 'docker login -u hussainbeecmd -p ${dockerhubpwd}'
        }
        sh 'docker push hussainbeecmd/devx-devops'
    }
}