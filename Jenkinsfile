pipeline {
    agent { label 'ubuntu' }
    environment {
        GIT_MAIN_BRANCH = 'main'
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
                    //Build the Docker Image
                    def customImage = docker.build('monkzz/test_repo:$BUILD_NUMBER'}

                    //Create the container
                    
                }
            }
        }
        // Run tests
        stage('Test') {
            steps {
                script {
                    // Start Docker
                    sh 'docker run customImage'
                }
            }
         }
        stage('Compile C') {
             steps {
                 customImage.inside {
                     sh 'gcc -o hello_c hello.c'
                 }
            }
        }
        stage('Compile C++') {
            steps {
                customImage.inside {
                    sh 'g++ -o hello_cpp hello.cpp'
                }
            }
        }
        stage('Run C') {
             steps {
                 customImage.inside {
                     sh './hello_c'
                 }
            }
        }
        stage('Run C++') {
             steps {
                customImage.inside {
                    sh './hello_cpp'
                }
            }
        }
        stage('Run Python 3.10') {
             steps {
                 customImage.inside {
                     sh 'python3 hello.py'
                 }
            }
        }
    }
}
