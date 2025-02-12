pipeline {
    agent any

    stages {
        stage('Build') {
            
            steps {
                 sh '''
                    docker run  --rm --name simple_spring_api -v "$(pwd)/simple_spring_api":/usr/src/mymaven -w /usr/src/mymaven eclipse-temurin:11-jdk mvn clean install
                 '''
                 
            }
        }
       
    }
}
