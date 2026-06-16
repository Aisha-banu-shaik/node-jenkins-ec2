
pipeline {
    agent any

    
stages {
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }
    }


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

        stage('Install Dependencies') {
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
                sshagent(credentials: [env.SSH_CREDENTIALS]) {
                    sh """
                        ssh -o StrictHostKeyChecking=no ${EC2_USER}@${EC2_HOST} << 'EOF'

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
