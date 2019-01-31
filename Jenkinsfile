#!groovy
pipeline {
	environment {
	AWS_ACCESS_KEY_ID = credentials('jenkins-aws-access-key')
        AWS_SECRET_KEY_ID = credentials('jenkins-aws-secret-key')
    }
    agent any
    stages {
        stage('git-checkout') {
            steps {
                sh 'rm -rf *;git clone https://github.com/onaiv22/terraform-jenkins-aws.git'
            }
        }
        stage('terraform init') {
            steps {
                sh 'terraform init -input=false'
            }
        }
        stage('terraform plan') {
            steps {
                sh 'terraform plan -input=false out tfplan'
            }
        }

    }
}
