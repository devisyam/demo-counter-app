pipeline{
    
    agent any 
    
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
        stage('Maven build'){
            
            steps{
                
                script{
                    
                    sh 'mvn clean install'
                }
            }
        }
        stage('Static code analysis'){
            
            steps{
                 withSonarQubeEnv('sonar-api') {
                        
                        sh '''mvn clean package sonar:sonar'
                            -Dsonar.projectKey=java 
                            -Dsonar.host.url=http://34.125.85.117:9000 
                            -Dsonar.login=sqp_45fb4cc16c071730a5bcbe35e3908d19060c311f'''
                     
                     
                     
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
