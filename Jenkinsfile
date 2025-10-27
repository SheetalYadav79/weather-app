pipeline {
  agent any

  environment {
    IMAGE_NAME = 'sheetal79/static-weather-app'
  }

  stages {
    stage('Clone') {
      steps {
        git 'https://github.com/SheetalYadav79/weather-app.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          docker.build(IMAGE_NAME)
        }
      }
    }

    stage('Push to Docker Hub') {
      steps {
        script {
          docker.withRegistry('', 'docker-hub-creds') {
            docker.image(IMAGE_NAME).push()
          }
        }
      }
    }

    stage('Deploy Locally') {
      steps {
        sh 'docker rm -f static-weather || true'
        sh 'docker run -d --name static-weather -p 8000:8000 ' + IMAGE_NAME
      }
    }
  }
}
