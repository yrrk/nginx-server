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
        stage('az login'){
            steps{
                sh 'az login --service-principal --username 1375150f-b39a-4e54-975d-5376eb31fad2 --password b3747b7a-9a88-4905-9ff9-e152e8399f44 --tenant d93033c2-5537-4549-8737-f852287a0896'
            }
        }
    }
}