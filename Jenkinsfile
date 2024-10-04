pipeline{
    agent any
    stages{
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
        
        stage("Testing"){
            steps{
                sh 'pwd'
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