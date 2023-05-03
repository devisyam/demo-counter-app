pipeline {
    agent any
    tools {
        maven 'maven'
    }
    
    stages {
        
        stage('Git Checkout'){
            
            steps{
                
                script{
                    
                    git branch: 'main', url: 'https://github.com/devisyam/demo-counter-app.git'
                }
            }
        }
        stage('UNIT testing'){
            
            steps{
                sh 'mvn test'
            }
        }
        stage('Integration testing'){
            
            steps{
                
                
                    
                    sh 'mvn verify -DskipUnitTests'
                
            }
        }
        stage('Static code analysis'){   
            steps{
                script {
                    
                    withSonarQubeEnv(credentialsId: 'sonar-api') {
                        
                        sh 'mvn clean install sonar:sonar'
                    }
                }
            }
        }
        stage('docker build'){
            steps {
                sh "docker build -t sen ."
            }
        }
        stage('docker host') {
            steps {
                sh "docker run -itd -p 8383:8080 sen"
            }
        }
    }
}
