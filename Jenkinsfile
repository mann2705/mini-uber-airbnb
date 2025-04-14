pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                echo "🧹 Cleaning workspace..."
                deleteDir()

                echo "📥 Cloning repository..."
                checkout scm

                echo "📂 Workspace contents:"
                sh 'ls -la'

                echo "📄 Showing Dockerfile:"
                sh 'cat Dockerfile || echo "❌ Dockerfile not found!"'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "🐳 Building Docker image..."
                sh '/usr/local/bin/docker build -t mini-app .'
            }
        }

        stage('Load to Minikube') {
            steps {
                echo "📦 Loading image into Minikube..."
                sh '/opt/homebrew/bin/minikube image load mini-app'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo "🚀 Deploying to Kubernetes..."
                sh '/usr/local/bin/kubectl apply -f k8s/deployment.yaml'
                sh '/usr/local/bin/kubectl apply -f k8s/service.yaml'
            }
        }
    }
}
