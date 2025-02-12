pipeline {
    agent any

    stages {
        stage('Build') {
            agent {
                docker {
                    image 'maven:3.9.9-eclipse-temurin-11'
                    reuseNode true
                }
            }
            steps {
                 sh '''
                    cd simple_spring_api
                    mvn clean install
                    cd ../simple_spring_web
                    mvn clean install
                 '''
                 
            }
        }
       
    }
}
