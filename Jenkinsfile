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
                    def readPomVersion = readMavenPom file: 'pom.xml'
                    //def nexusRepo = readPomVersion.Version.endsWith("SNAPSHOT") ? "dev-snapshot" : "dev"
                    nexusArtifactUploader artifacts: 
                    [
                        [
                            artifactId: 'springboot',
                            classifier: '',
                            file: 'target/Uber.jar',
                            type: 'jar'
                        ]
                    ],
                    credentialsId: 'nexus-auth',
                    groupId: 'com.example',
                    nexusUrl: '34.16.150.227:8081',
                    nexusVersion: 'nexus3',
                    protocol: 'http',
                    repository: 'dev',
                    version: "${readPomVersion.version}"
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
                sh "docker run -itd --name don -p 8008:8008 sen"
            }
        }
    }
}
