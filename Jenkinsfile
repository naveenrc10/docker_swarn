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
                    mvn -f ./simple_spring_api/pom.xml clean install
                 '''
                 
            }
        }
       
    }
}
