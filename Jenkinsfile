#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-2"
    }
    stages {
        stage("Create an EKS Cluster") {
            steps {
                script {
                    dir('terraform') {
                        sh "terraform init"
                        sh "terraform destroy -lock=false"
                        sh "echo "cluster created""
                    }
                }
            }
        }
        stage("Deploy to EKS") {
            steps {
                script {
                    dir('kubernetes') {
                        sh "aws eks update-kubeconfig --name socks-eks-cluster"
                        sh "echo "kubeconfig updated""
                        sh "kubectl create namespace sock-shop"
                        sh "echo "namespace created""
                        sh "kubectl apply -f complete-demo.yaml"
                        sh "echo "complete demo done""
                        sh "kubectl apply -f manifests-monitoring" 
                        sh "echo "monitoring done""
                        
                    }
                }
            }
        }
    }
}
