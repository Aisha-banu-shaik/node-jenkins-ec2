
pipeline {
    agent any

    environment {
        EC2_HOST = 'YOUR_EC2_PUBLIC_IP'
        EC2_USER = 'ec2-user'
        SSH_CREDENTIALS = 'ec2-ssh-key-id'
    }
    
    stages {

        stage('Clone Repository') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Aisha-banu-shaik/node-jenkins-ec2.git'
            }
        }

        stage('Install dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'npm test'
            }
        }

        stage('Deploy to AWS EC2') {
            steps {
                sshagent(credentials: ['6404acf4-b109-4899-a954-d8e0d7be69c0']) {
                    sh """
                        ssh -o StrictHostKeyChecking=no -i /var/lib/jenkins/.ssh/my_pem.pem ubuntu@3.27.255.175<< 'EOF'

                        if [ ! -d "app" ]; then
                          git clone https://github.com/YOUR_USERNAME/node-jenkins-ec2.git app
                        fi

                        cd app
                        git pull origin main
                        npm install

                        pm2 restart app || pm2 start app.js --name app

                        EOF
                    """
                }
            }
        }
    }
}
