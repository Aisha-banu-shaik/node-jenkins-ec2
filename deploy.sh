


stage('Deploy to EC2') {
    steps {
        sh '''
ssh -o StrictHostKeyChecking=no -i /var/lib/jenkins/.ssh/my_pem.pem ubuntu@3.27.255.175 <<EOF
set -e

cd /home/ubuntu

# Clone repo if not exists
if [ ! -d "app" ]; then
  git clone https://github.com/Aisha-banu-shaik/node-jenkins-ec2.git app
fi

cd app

git pull origin main

npm install

pm2 restart app || pm2 start app.js --name app

EOF
        '''
    }
}


