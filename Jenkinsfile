pipeline {
    agent any

    triggers {
        pollSCM('* * * * *') //polling for changes, here once a minute
    }

    stages {
        stage('Stage 1-Starting Job') {
            steps {
                echo 'Starting job check'
                deleteDir()
            }
        }
        stage('Stage 2-Code checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/mamun7025/spring-boot-docker-cicd.git']]])
            }
        }
        stage('build') {
            steps {
                echo 'Starting build'
            }

        }
        stage('Gradle Build') {
            steps {
                bat 'gradlew.bat clean build'
            }
        }
        stage('test') {
             steps {
                echo 'Starting test'
            }

        }
        stage('deploy') {
             steps {
               echo 'Starting deploy'
            }

        }

    }
    post {
        always {
            echo 'I will always say Hello again!'
        }
    }
}