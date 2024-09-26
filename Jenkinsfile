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
        stage('Terraform apply please'){
            steps{
                dir('./Terraform-infra'){
                    sh 'terraform apply -auto-approve'
                }
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