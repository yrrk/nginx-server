pipeline{
    agent any
    stages{
        stage('verify az installed'){
            steps{
                sh 'az --version'
                }
       }
       stage('Installing Terraform'){
        steps{
            dir('/home/jenkins'){
                sh 'wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg'
                sh 'echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list'
                sh 'sudo apt update && sudo apt install terraform'
            }
        }
       }
    }
}