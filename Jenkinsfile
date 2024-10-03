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
        stage('Installing Ansible') {
            steps {
                script {
                    env.PATH = "${env.HOME}/.local/bin:${env.PATH}"
                    }

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