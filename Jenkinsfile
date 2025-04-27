pipeline {
  agent any // This runs on any available agent (in this case, your EC2 instance running Jenkins)

  environment {
    DEPLOY_DIR = '/home/ubuntu/app' // The path where the server code is located
  }

  stages {
    stage('Clone Repository') {
      steps {
        // This clones your latest code from GitHub.
        // You can add credentials if it's a private repo.
        git branch: 'main', url: 'https://github.com/naveedalirehmani/jenkins.git'
      }
    }

    stage('Stop Existing Container') {
      steps {
        script {
          // Safely stops and removes the existing container
          // `|| true` prevents Jenkins from failing the job if the container isn't running
          sh "cd $DEPLOY_DIR/deployment && docker compose down || true"
        }
      }
    }

    stage('Build & Deploy') {
      steps {
        script {
          // This builds the updated image and brings the container up
          sh "cd $DEPLOY_DIR/deployment && docker compose up --build -d"
        }
      }
    }
  }
}