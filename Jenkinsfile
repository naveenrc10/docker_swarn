pipeline {
    agent any
        options {
            reuseNode true
        }
    stages {
        stage('Build') {
            agent {
                docker{
                    image: 'eclipse-temurin:11-jdk-alpine'

                }
            }
            steps {
                sh 'echo Building...'
            }
        }
        
    }
}
