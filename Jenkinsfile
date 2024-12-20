pipeline {
    agent any

        environment {
            DOCKER_IMAGE = 'my-node-docker-test/my-node-docker-test:latest'
            DOCKER_CREDENTIALS = 'dockerhub-credentials'
            GIT_REPO = 'https://github.com/prtamil/my-node-docker-test.git'
        }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'develop', url: "${GIT_REPO}"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using the Docker Pipeline plugin
                    docker.build("${DOCKER_IMAGE}", ".")
                }
            }
        }

    }

    post {
        always {
            echo 'Pipeline completed.'
        }
    }
}

