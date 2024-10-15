pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/naveedalirehmani/jenkins.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh 'sudo docker-compose up --build -d'
                }
            }
        }
        stage('Deploy to Nginx on EC2') {
            steps {
                script {
                    // Run the container on EC2
                    sh 'sudo docker-compose down'
                    sh 'sudo docker-compose up -d'
                }
            }
        }
    }
}
