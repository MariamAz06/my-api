pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', 
                    url: 'https://github.com/MariamAz06/my-api.git', 
                    credentialsId: 'github-cred'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                   bat 'docker build -t my-api:latest .'
                }
            }
        }
        stage('Push to DockerHub') {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'dockerhub-cred', url: '']) {
                        bat 'docker push my-api:latest'
                    }
                }
            }
        }
        stage('Deploy Docker Container') {
            steps {
                script {
                    bat 'docker run -d -p 3002:3002 my-api:latest'
                }
            }
        }
    }
}
