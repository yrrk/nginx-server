pipeline{
    agent any
    stages{
        stage('Terraform init'){
            steps{
                dir('./Terraform-infra'){
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform plan'){
            steps{
                dir('./Terraform-infra'){
                    sh 'terraform plan'
                }
            }
        }
        stage('Terraform apply'){
            steps{
                dir('./Terraform-infra'){
                    sh 'terraform apply -auto-approve'
                }
            }
        }
        stage('installing ansible'){
            steps{
                sh 'sudo apt update'
                sh 'sudo apt install python3 python3-pip -y'
                sh 'pip3 install ansible -y'
                sh 'ansible --version'
            }
        }
        // stage('Terraform Destroy'){
        //     steps{
        //         dir('./Terraform-infra'){
        //             sh 'terraform destroy -auto-approve'
        //         }
        //     }
        // }
    }
}