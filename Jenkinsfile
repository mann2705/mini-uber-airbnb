pipeline {
    agent any

    environment {
        PATH = "/opt/homebrew/bin:/usr/local/bin:$PATH"
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
                sh 'DOCKER_CONFIG=/tmp/docker /usr/local/bin/docker build -t flask-app-demo .'
            }
        }

        stage('Load to Minikube') {
            steps {
                echo '📦 Loading Docker image into Minikube...'
                sh '/opt/homebrew/bin/minikube image load flask-app-demo'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo '🚀 Deploying to Kubernetes...'
                sh '/usr/local/bin/kubectl apply -f k8s/deployment.yaml'
                sh '/usr/local/bin/kubectl apply -f k8s/service.yaml'
            }
        }
    }
}
