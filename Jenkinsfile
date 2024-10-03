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
        stage('installing ansible please'){
            steps{
                sh 'echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc'
                // sh 'source ~/.bashrc'
                // sh 'ansible --version'
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