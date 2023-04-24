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
        stage('nexus artifact upload'){
            steps {
                script {
                    nexusArtifactUploader artifacts: [[artifactId: 'springboot', classifier: '', file: '/target/Uber.jar', type: 'jar']], credentialsId: 'nexus-auth', groupId: 'com.example', nexusUrl: '34.125.85.117:8081/', nexusVersion: 'nexus2', protocol: 'http', repository: 'dev', version: '1.0.0'
                }
            }
        }
        stage('Quality Gate Status'){
                
                steps{
                    
                    script{
                        
                        waitForQualityGate abortPipeline: false, credentialsId: 'sonar-api'
                    }
                }
        }
    }
}
        
