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
                sh 'cat Dockerfile || echo \"❌ Dockerfile not found!\"'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "🐳 Building Docker image (flask-app-demo)..."
                sh '/usr/local/bin/docker build -t flask-app-demo .'
            }
        }

        stage('Load to Minikube') {
            steps {
                echo "📦 Loading flask-app-demo into Minikube..."
                sh '/opt/homebrew/bin/minikube image load flask-app-demo'
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
