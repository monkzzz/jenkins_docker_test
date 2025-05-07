pipeline {
    agent { label 'ubuntu' }
    environment {
        DOCKERHUB_CREDENTIALS = credentials('jenkins')
    }

    stages {
        stage('SCM Checkout') {
            steps {
               git branch: 'main', credentialsId: 'f8aa600a-341d-48d9-a579-d8774b5da13d', url: 'https://github.com/monkzzz/jenkins_docker_test'
            }
        }
        stage('Check coompiler versions') {
             steps {
                 sh 'python3 hello.py'
            }
        }
        stage('Clear old Images/Containers') {
             steps {
                sh '''
                docker container prune -f
                docker image prune -a -f
                '''
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t monkzz/test_repo:$BUILD_NUMBER .'
            }
        }
        stage('Login to Docker Hub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push Image') {
            steps {
                sh 'docker push monkzz/test_repo:$BUILD_NUMBER'
            }
        }
        stage('Deploy Application') {
            steps{
                sh '''
                docker stop $(docker ps -a -q) || true
                docker run --rm -d -p 3000:3000 --name webapp_ctr monkzz/test_repo:${BUILD_NUMBER}
                '''
            }
        }
    }
}
