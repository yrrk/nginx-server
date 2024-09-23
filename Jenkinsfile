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
            sh 'az login --service-principal --username 1375150f-b39a-4e54-975d-5376eb31fad2 --password b3747b7a-9a88-4905-9ff9-e152e8399f44 --tenant 8c0fa24a-0b95-469c-a372-b313faad17d4'
        }
    }
}