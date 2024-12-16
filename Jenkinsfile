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
                   bat 'docker build -t mariam02/my-api:latest .'  // Ajoutez votre nom d'utilisateur DockerHub ici
                }
            }
        }
        stage('Push to DockerHub') {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'dockerhub-creds', url: 'https://index.docker.io/v1/']) {
                        bat 'docker push mariam02/my-api:latest'  // Utilisez le bon tag avec votre nom d'utilisateur
                    }
                }
            }
        }
        stage('Deploy Docker Container') {
            steps {
                script {
                    bat 'docker run -d -p 3002:3002 mariam02/my-api:latest'  // Assurez-vous que le conteneur expose bien le port 3002
                }
            }
        }
    }
}
