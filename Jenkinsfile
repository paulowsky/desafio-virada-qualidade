node {
  stage('Checkout'){
    checkout scm
  }

  stage('build') {
    docker.build('backend', 'backend/.')
    docker.build('frontend', 'frontend/.')
  }

  stage('backend') {
    sh "docker run -t backend"
  }

  stage('frontend') {
    sh "docker run -t frontend"
  }

}
