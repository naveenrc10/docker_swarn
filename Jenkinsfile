pipeline {
   
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'maven:3.8.4-openjdk-17'
                }
            } 
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Test') {
            agent {
                docker {
                    image 'maven:3.8.4-openjdk-17'
                }
            }
            steps {
                sh 'mvn test'
            }
        }
        stage('Deploy') {
            agent {
                docker {
                    image 'maven:3.8.4-openjdk-17'
                }
            }
            steps {
                sh 'echo Deploying...'
            }
        }
    }
}
