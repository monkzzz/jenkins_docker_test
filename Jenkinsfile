pipeline {
    agent { label 'ubuntu' }
    environment {
        GIT_MAIN_BRANCH = 'main'
    }
    options {
        ansiColor('xterm')
    }

    stages {
        // Retrieve the project code from the repository.
        stage('SCM Checkout') {
            steps {
               git branch: 'main', credentialsId: 'f8aa600a-341d-48d9-a579-d8774b5da13d', url: 'https://github.com/monkzzz/jenkins_docker_test'
            }
        }
        // Prepare and build the Docker Image
        stage('Prepare') {
            steps {
                script {
                    //Build the Docker Image
                    sh 'docker build -t monkzz/test_repo:$BUILD_NUMBER .'

                    //Create the container
                    
                }
            }
        }
        // Run tests
        stage('Test') {
            steps {
                script {
                    // Start Docker
                    sh 'docker run monkzz/test_repo:${BUILD_NUMBER}'
                }
            }
         }
        stage('Compile C') {
             steps {
                 sh 'gcc -o hello_c hello.c'
            }
        }
        stage('Compile C++') {
             steps {
                 sh 'g++ -o hello_cpp hello.cpp'
            }
        }
        stage('Run C') {
             steps {
                 sh './hello_c'
            }
        }
        stage('Run C++') {
             steps {
                sh './hello_cpp'
            }
        }
        stage('Run Python 3.10') {
             steps {
                 sh 'python3 hello.py'
            }
        }
    }
}
