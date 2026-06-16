

stage('Deploy to AWS EC2') {
    steps {
        sh '''
        ssh -o StrictHostKeyChecking=no -i /var/lib/jenkins/.ssh/my_pem.pem ubuntu@3.25.52.34 << 'EOF'
        set -e

        cd /home/ubuntu

        if [ ! -d "node-jenkins-ec2" ]; then
          git clone https://github.com/Aisha-banu-shaik/node-jenkins-ec2.git
        fi

        cd node-jenkins-ec2
        git pull

        npm install

        pm2 restart app || pm2 start app.js

        EOF
        '''
    }
}
