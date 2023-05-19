pipeline {
    agent any

    stages {
        stage('Cleaning') {
            steps {
                
                sh 'sudo docker rmi testimage'
            }
            }
        stage('Build') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh 'cd $WORKSPACE'
                sh 'pwd' 
                echo 'Building..'
                sh 'sudo docker build -t testimage .'
                }
            }
        }
        stage('Creating container') {
            steps {
               sh 'sudo docker run -d testimage'
            }
        }
        
        }
    }
