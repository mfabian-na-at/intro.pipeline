pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh 'echo "un paso sencillo de una linea"'
        sh '''
        echo "pasos multilinea"
        cd /tmp
        ls -lrt
        '''
      }
    }

    stage('test: integracion y calidad') {
      steps {
        sh 'echo "paso test"'
      }
    }

    stage('test: funcional') {
      steps {
        sh 'echo "paso test" '
      }
    }

    stage('test: aprobacion') {
      steps {
        sh 'echo "paso test" '
      }
    }

    stage('deploy:prod') {
      input {
        message 'presiona ok para continuar'
        submitter 'user1,user2'
        parameters {
          string(name: 'username', defaultValue: 'user', description: 'nombre del usuario que esta dando ok')
        }
      }
      steps {
        sh 'echo "a produccion " '
        echo "User: ${username} dijo que ok"
      }
    }

  }
  environment {
    OUTPUT_PATH = './tmp'
  }
}