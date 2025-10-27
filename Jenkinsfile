pipeline {
  agent any

  environment {
    IMAGE_NAME = 'sheetal79/static-weather-app'
  }

  stages {
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
          docker.withRegistry('', 'dockerhub-creds') {
            docker.image(IMAGE_NAME).push()
          }
        }
      }
    }

    stage('Deploy Locally') {
      steps {
        bat 'docker rm -f static-weather || exit 0'
        bat 'docker run -d --name static-weather -p 8000:8000 sheetal79/static-weather-app'
      }
    }
  }
}
