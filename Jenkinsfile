pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '/usr/local/bin/docker build -t mini-app .'
            }
        }

        stage('Load to Minikube') {
            steps {
                sh '/opt/homebrew/bin/minikube image load mini-app'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '/usr/local/bin/kubectl apply -f k8s/deployment.yaml'
                sh '/usr/local/bin/kubectl apply -f k8s/service.yaml'
            }
        }
    }
}
