#!groovy
pipeline {
    agent {
        node {
            label 'master'
        }
    }
	environment {
	    AWS_ACCESS_KEY_ID = credentials('jenkins-aws-access-key')
        AWS_SECRET_KEY_ID = credentials('jenkins-aws-secret-key')
        TERRAFORM_CMD = 'docker run -w /app -v /var/lib/jenkins/workspace/git-terraform-jenkins-aws/terraform-jenkins-aws/:/app -v /root/.aws:/root/.aws -v `pwd`:/app hashicorp/terraform:light'
    }
    stages {
        stage('git-checkout') {
            steps {
                sh 'rm -rf *;git clone https://github.com/onaiv22/terraform-jenkins-aws.git'
            }
        }
        stage('pull terraform light image') {
            steps {
                sh 'docker pull hashicorp/terraform:light'
            }
        }
        stage('output terraform version') {
            steps {
                sh '${TERRAFORM_CMD} --version'
            }
        }
        
        stage('terraform init') {
            steps {
                sh '${TERRAFORM_CMD} init -input=false'
            }
        }
        stage('terraform plan') {
            steps {
                sh '${TERRAFORM_CMD} plan -input=false -out=tfplan.out'
            }
        }

    }
}
