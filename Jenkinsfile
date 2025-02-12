pipeline {
    agent any
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'eclipse-temurin:17-jdk-alpine'
                    reuseNode true
                }
            } 
            steps {
                sh '''
                ch simple_spring_api
                mvn clean install
                '''
                
            }
        }
        
    }
}
