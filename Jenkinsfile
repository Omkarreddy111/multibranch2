
String branchName = env.BRANCH_NAMEString 
env = env.BRANCH_NAME

def featureEnv = env.BRANCH_NAME != 'master'


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
        stage('Pushing to ECR') {
            steps {
                sh 'sudo docker tag testimage:latest public.ecr.aws/m4p7d9s0/test:latest'
                sh 'sudo docker push public.ecr.aws/m4p7d9s0/test:latest'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh '''
                chmod +x deploy.sh
                bash $WORKSPACE/deploy.sh
                '''
         stage('QA_Deploy') {
            steps {
                echo 'Deploying TO QA....'
                sh '''
                chmod +x deploy.sh
                bash $WORKSPACE/deploy.sh
              

            }
        }
    }
}
