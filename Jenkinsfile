pipeline {
    agent any
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'maven:3.8.4-openjdk-17'
                    reuseNode true
                }
            } 
            steps {
                sh 'mvn clean install'
            }
        }
        
    }
}
