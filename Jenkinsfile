pipeline{
    agent any
    stages{
        stage('verify az installed'){
            steps{
                sh 'az --version'
                }
       }

       stage('verify terraform installed'){
            steps{
                sh'terraform version'
            }
        }
        stage('az verify'){
            steps{
                sh 'az account show'
            }
        }
    }
}