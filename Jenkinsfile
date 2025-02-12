pipeline {
    agent any

    stages {
        stage('Build') {
            agent {
                docker {
                    image 'eclipse-temurin:11-jdk'
                    reuseNode true
                    args '-v ${WORKSPACE}/simple_spring_api:/app -w /app'
                }
            }
            steps {
                 sh 'cd simple_spring_api'
                 sh 'pwd'
            }
        }
       
    }
}
