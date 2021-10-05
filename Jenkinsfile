pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh 'echo "Un primer paso simple"'
        sh '''
          echo "pasos multilinea"
          cd /tmp
          ls -lrt
          '''
      }
    }

    stage('aprobacion') {
      steps {
        sh 'echo "paso de aprobacion"'
      }
    }

    stage('deploy:prod') {
      input {
        message 'presiona ok'
        submitter 'user1,user2'
        parameters {
          string(name: 'username', defaultValue: 'user', description: 'Nombre de usuario picando')
        }
      }
      steps {
        sh 'echo "paso de deploy:prod"'
      }
    }

  }
}