pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                
                sh 'cd $WORKSPACE'
                sh 'pwd' 
                echo 'Building..'
                sh 'sudo docker build -t qaimage .'
                
            }
        }
        stage('Tagging Image') {
            steps {
                
                sh 'sudo docker tag  qaimage:latest 688117735572.dkr.ecr.us-east-2.amazonaws.com/demo_app:QA'
                
            }
        }
        stage('Pushing Image') {
            steps {
                
                sh 'sudo docker push 688117735572.dkr.ecr.us-east-2.amazonaws.com/demo_app:QA'
                
            }
        }
        stage('Deploy to ECS') {
            steps {
                sh 'cd $WORKSPACE'
                sh './deploy.sh'
                sh 'echo Deployed to QA environment'
            
            }
        }
        
        }
    }
