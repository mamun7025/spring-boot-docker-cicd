pipeline {
    agent any
    stages {
        stage('Stage 1') {
            steps {
                echo 'Hello world!.... Al-Mamun'
            }
        }
        stage('Stage 2') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/mamun7025/spring-boot-docker-cicd.git']]])
            }
        }

    }
}