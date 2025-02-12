pipeline {
    agent any

    stages {
        stage('Build') {
            agent {
                docker {
                    image 'eclipse-temurin:11-jdk'
                    args '-v ${WORKSPACE}/simple_spring_api:/app -w /app'
                }
            }
            steps {
                 sh 'ls -l'
                 
            }
        }
       
    }
}
