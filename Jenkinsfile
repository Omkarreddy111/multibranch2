pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                
                sh 'cd $WORKSPACE'
                sh 'pwd' 
                echo 'Building..'
                sh 'sudo docker build -t prodimage .'
                
            }
        }
        stage('Tagging Image') {
            steps {
                
                sh 'sudo docker tag  prodimage:latest 688117735572.dkr.ecr.us-east-2.amazonaws.com/demo_app:PROD'
                
            }
        }
        stage('Pushing Image') {
            steps {
                
                sh 'sudo docker push 688117735572.dkr.ecr.us-east-2.amazonaws.com/demo_app:PROD'
                
            }
        }
        stage('Deploy to ECS') {
            steps {
                sh 'cd $WORKSPACE'
                sh 'chmod +x deploy.sh'
                sh './deploy.sh'
                sh 'echo Deployed to PROD environment'
            
            }
        }
        
        }
    }
