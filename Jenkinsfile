pipeline {
  agent any
  stages {
    stage('Corriendo en pralelo') {
      parallel {
        stage('a') {
          steps {
            echo 'Test en linux'
          }
        }

        stage('b') {
          steps {
            echo 'Test en windo'
          }
        }

      }
    }

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
        sh 'echo "paso test: integracion y calidad"'
        sh 'pwd'
        sh 'chmod 777 ./miscript.sh'
        sh 'miscript.sh'
      }
    }

    stage('test: funcional') {
      when {
        branch 'test'
      }
      steps {
        sh 'echo "paso test en rama de test" '
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
  post {
    always {
      echo 'Exito maximo'
    }

    failure {
      echo 'No se pudo correr el pipeline'
      mail(to: 'mfabian@na-at.com.mx', subject: 'Se ejecuto el pipeline del ejercicio del curso de docker.', body: 'Cuerpo del correo')
    }

    aborted {
      echo 'Abortado'
    }

  }
}