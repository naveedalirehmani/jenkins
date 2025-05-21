// Jenkinsfile
pipeline {
  agent any

  environment {
    DOCKER_IMAGE = 'naveedalirehmani/hello-world-server'
    APP_SERVER_IP = '13.201.228.171'
    SSH_USER = 'ubuntu'
    CONTAINER_NAME = 'hello-app'
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/naveedalirehmani/jenkins.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t $DOCKER_IMAGE .'
      }
    }

    stage('Push to Docker Hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh """
            echo $PASSWORD | docker login -u $USERNAME --password-stdin
            docker push $DOCKER_IMAGE
          """
        }
      }
    }

    stage('Deploy to App Server') {
      steps {
        sshagent(['ec2-ssh-key']) {
          sh """
          ssh -o StrictHostKeyChecking=no $SSH_USER@$APP_SERVER_IP << EOF
            docker pull $DOCKER_IMAGE
            docker rm -f $CONTAINER_NAME || true
            docker run -d --name $CONTAINER_NAME -p 3000:3000 $DOCKER_IMAGE
          EOF
          """
        }
      }
    }
  }
}