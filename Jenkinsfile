pipeline {
    agent { label 'ubuntu' }
    environment {
        GIT_MAIN_BRANCH = 'main'
    }
    stages {
        // Retrieve the project code from the repository.
        stage('SCM Checkout') {
            steps {
                //Github
                git branch: 'main', credentialsId: 'f8aa600a-341d-48d9-a579-d8774b5da13d', url: 'https://github.com/monkzzz/jenkins_docker_test'
                //Bitbucket
                //Use the credentials stored in jenkins
                //withCredentials([usernamePassword(credentialsId: 'jenkins', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    //sh 'git pull https://${USERNAME}:${PASSWORD}@bitbucket.org/monkzzz/jenkins_docker_test.git board_fw'
                //}
            }
        }
        // Prepare and build the Docker Image
        stage('Build Image') {
            steps {
                script {
                    //Build the Docker Image
                    sh 'docker build -t monkzz/test_repo:$BUILD_NUMBER .'
                }
            }
        }
        // Run tests
        stage('Test Image') {
            steps {
                script {
                    // Start Docker
                    sh 'docker run --rm monkzz/test_repo:$BUILD_NUMBER'
                }
            }
        }
    }

    //post {
    //    failure {
    //        emailext{
    //            to: 'someone@email.com',
    //            subject: '${JOB_NAME}.${BUILD_NUMBER} FAILED',
    //            body: '${JOB_NAME}.${BUILD_NUMBER} FAILED',
    //            mimeType: 'text/html'
    //        }
    //    }
    //    success {
    //        emailext{
    //            to: 'someone@email.com',
    //            subject: '${JOB_NAME}.${BUILD_NUMBER} PASSED',
    //            body: '${JOB_NAME}.${BUILD_NUMBER} PASSED',
    //            mimeType: 'text/html'
    //        }
    //    }
        //always {
        //    sh 'docker stop app && docker rm app'
        //}
    //}
}
