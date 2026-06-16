
#!/bin/bash#!/bin ]; then
    git clone https://github.com/YOUR_USERNAME/node-jenkins-ec2.git $APP_DIR
fi

cd $APP_DIR

git pull origin main
npm install

pm2 restart app || pm2 start app.js --name app
``

APP_DIR="/home/ec2-user/app"

