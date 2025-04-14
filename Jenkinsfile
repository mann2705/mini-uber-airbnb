pipeline {
    agent any

    environment {
        PATH = "/opt/homebrew/bin:$PATH"  // Ensure Jenkins can access kubectl + minikube
    }

    stages {

        stage('Clone Repo') {
            steps {
                echo '🧹 Cleaning workspace...'
                deleteDir()
                echo '📥 Cloning repository...'
                checkout scm
                echo '📂 Workspace contents:'
                sh 'ls -la'
                echo '📄 Showing Dockerfile:'
                sh 'cat Dockerfile'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo '🐳 Building Docker image (flask-app-demo)...'
                // Avoid using credential helpers that Jenkins doesn't support
                sh 'DOCKER_CONFIG=/tmp/docker docker build -t flask-app-demo .'
            }
        }

        stage('Load to Minikube') {
            steps {
                echo '📦 Loading Docker image into Minikube...'
                sh 'minikube image load flask-app-demo'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo '🚀 Deploying to Kubernetes...'
                sh 'kubectl apply -f k8s/deployment.yaml'
                sh 'kubectl apply -f k8s/service.yaml'
            }
        }
    }
}
