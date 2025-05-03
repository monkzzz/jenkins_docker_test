pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('jenkins')
    }

    stages {
        stage('SCM Checkout') {
            steps {
               git branch: 'main', credentialsId: 'f8aa600a-341d-48d9-a579-d8774b5da13d', url: 'https://github.com/monkzzz/jenkins_docker_test'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t docker_image/webapp:$BUILD_NUMBER .'
            }
        }
        stage('Login to Docker Hub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push Image') {
            steps {
                sh 'docker push docker_image/webapp:$BUILD_NUMBER'
            }
        }
    }
}
