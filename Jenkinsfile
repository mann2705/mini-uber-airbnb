pipeline {
    agent any

    stage('Clone Repo') {
    steps {
        deleteDir()             // clean workspace
        checkout scm            // clone fresh repo
        sh 'ls -la'             // check what's actually there
        sh 'cat Dockerfile'     // debug: confirm file exists
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
