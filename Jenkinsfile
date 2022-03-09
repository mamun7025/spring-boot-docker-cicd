pipeline {
    agent any

    environment {
        imagename = 'mn7025/spring-boot-docker-cicd-v2'
        containerName = 'spring-boot-docker-cicd-v2'
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
                    dockerImage = docker.build imagename
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

        // Stopping Docker containers for cleaner Docker run
        stage('docker stop container') {
            steps {
                // for windows
                bat 'docker images'
                bat 'docker ps'
                bat "docker container stop ${env.containerName}"
                bat "docker container rm ${env.containerName}"


                // for linux
                //sh 'docker ps -f name=mypythonappContainer -q | xargs --no-run-if-empty docker container stop'
                //sh 'docker container ls -a -fname=mypythonappContainer -q | xargs -r docker container rm'
            }
        }


        stage('Run Docker container on local machine') {
            steps {
                echo 'Run Docker container on local machine...'
                // windows
                bat "docker run --name ${env.containerName} -d -p 8585:9696 ${env.imagename}"
                // linux
                // sh "docker run -d -p 4030:80 nikhilnidhi/nginxtest"
            }
        }

        stage('Run Docker container on remote hosts') {
            steps {
                echo 'Run Docker container on remote hosts'
                // sh "docker -H ssh://jenkins@172.31.28.25 run -d -p 4001:80 nikhilnidhi/nginxtest"
            }
        }


    }
    post {
        always {
            echo 'Finished CI/CD Job'
        }
    }
}