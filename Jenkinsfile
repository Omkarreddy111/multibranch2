pipeline {
    agent any

    stages {
        stage('removing old version') {
            steps {
                
                sh 'sudo docker rmi testimage'
            }
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
               sh 'sudo docker run -d testimage'
            }
        }
        
        }
    }
}
