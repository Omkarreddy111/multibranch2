pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                
                sh 'cd $WORKSPACE'
                sh 'pwd' 
                echo 'Building..'
                sh 'sudo docker build -t testimage .'
                
            }
        }
        stage('Creating container') {
            steps {
                sh 'sudo docker rm $(sudo docker ps -a -q)' 
               sh 'sudo docker run -d -p 8081:8080 testimage'
            }
        }
        
        }
    }
