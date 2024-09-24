pipeline{
    agent any
    stages{
        stage('Azure Cli Login'){
        steps{
                sh 'az login --service-principal --username 1375150f-b39a-4e54-975d-5376eb31fad2 --password LmS8Q~3P1-vxykMZvSR27A7EOIUanqVG0D.X4c2S --tenant d93033c2-5537-4549-8737-f852287a0896'
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