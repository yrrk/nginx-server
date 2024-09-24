pipeline{
    agent any
    stages{
        stage("install azure due to new slave"){
            steps{
                sh 'curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash'
            }
        }
        // stage('Terraform init'){
        //     steps{
        //         dir('./Terraform-infra'){
        //             sh 'terraform init'
        //         }
        //     }
        // }
        // stage('Terraform plan'){
        //     steps{
        //         dir('./Terraform-infra'){
        //             sh 'terraform plan'
        //         }
        //     }
        // }
        // stage('Terraform apply'){
        //     steps{
        //         dir('./Terraform-infra'){
        //             sh 'terraform apply -auto-approve'
        //         }
        //     }
        // }
        // stage('Terraform Destroy'){
        //     steps{
        //         dir('./Terraform-infra'){
        //             sh 'terraform destroy -auto-approve'
        //         }
        //     }
        // }
    }
}