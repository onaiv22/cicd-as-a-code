#!groovy
pipeline {
	environment {
	AWS_ACCESS_KEY_ID = credentials('jenkins-aws-access-key')
        AWS_SECRET_KEY_ID = credentials('jenkins-aws-secret-key')
    }
    agent { dockerfile true}
    stages {
        stage('terraform init') {
            steps {
                sh 'terraform init -input=false'
            }
        }
        stage('checkout') {
            steps {
                sh 'git clone https://github.com/onaiv22/terraform-jenkins-aws.git'
            }
        }
        stage('terraform plan') {
            steps {
                sh 'terraform plan -input=false out tfplan'
            }
        }
        stage('terraform apply') {
            steps {
                sh 'terraform apply -input=false out tfplan'
            }
        }
    }
}
    





    



