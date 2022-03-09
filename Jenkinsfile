pipeline {
    agent any

    environment {
        imageName = 'mn7025/spring-boot-docker-cicd-v2'
        registryCredential = 'DockerCredential'
        dockerImage = ''
    }

    triggers {
        pollSCM('* * * * *') //polling for changes, here once a minute
    }

    stages {
        stage('Stage 1: Starting Job') {
            steps {
                echo 'Starting job, cleaning workspace'
                deleteDir()
            }
        }
        stage('Stage 2: Code checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/mamun7025/spring-boot-docker-cicd.git']]])
            }
        }
        stage('Stage 3: Gradle build') {
            steps {
                bat 'gradlew.bat clean build'
            }
        }
        stage('Stage 3: Test') {
             steps {
                echo 'Starting test'
            }

        }

        stage('Stage 4: Building docker image') {
            steps{
                script {
                    dockerImage = docker.build imageName
                }
            }
        }

        stage('Stage 5: Push image to dockerhub') {
        	steps{
        		script {
        			docker.withRegistry( '', registryCredential ) {
        				dockerImage.push("$BUILD_NUMBER")
        				dockerImage.push('latest')
        			}
        		}
        	}
        }


        stage('Stage 6: Deploy') {
             steps {
               echo 'Starting deploy'
            }

        }

    }
    post {
        always {
            echo 'Finished CI/CD Job'
        }
    }
}