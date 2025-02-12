pipeline {
    agent any

    stages {
        stage('Build') {
            agent {
                docker {
                    image 'eclipse-temurin:11-jdk'
                    reuseNode true
                }
            }
            steps {
                sh 'cd simple_spring_api'
                sh 'pwd'
                sh 'mvn clean install'
            }
        }
       
    }
}
