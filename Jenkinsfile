pipeline {
    agent any

    stages {
        stage('Build') {
            agent {
                docker {
                    image 'eclipse-temurin:11-jdk'
                    reuseNode true
                    args '-v $WORKSPACE:/simple_spring_api -w /simple_spring_api'
                }
            }
            steps {
                 sh 'cd simple_spring_api'
                 sh 'pwd'
            }
        }
       
    }
}
