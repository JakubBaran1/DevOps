pipeline {
    agent any 
    stages {
        stage('Clone the repo') {
            steps {
                echo 'clone the repo'
                sh 'rm -fr html'
                sh 'rm -fr DevOps'
                sh 'git clone https://github.com/z3r0tru5t/DevOps.git'
            }
        }
        stage('Debug SSH') {
            steps {
                script {
                    sh 'whoami' // Print Jenkins user
                    sh 'env' // Print environment variables for debugging
                    // Add other debug commands or information as needed
                }
            }
        }
         stage('push repo to remote host') {
            steps {
                echo 'connect to remote host and pull down the latest version'
                sh ' ssh -i "/var/lib/jenkins/key1.pem" -o StrictHostKeyChecking=no ec2-user@16.171.193.95 sudo git -C /var/www/html pull https://github.com/z3r0tru5t/DevOps.git'
            }
        }
        stage('Check website is up') {
            steps {
                echo 'Check website is up'
                sh 'curl -Is 16.171.193.95 | head -n 1'
            }
        }
        stage('Run Unit Tests') {
            steps {
                echo 'Running Unit Tests'
                // Add commands to execute unit tests
                sh 'npm install' // Example command for Node.js projects
                sh 'npm test' // Example command to run unit tests
            }
        }
    }
}
