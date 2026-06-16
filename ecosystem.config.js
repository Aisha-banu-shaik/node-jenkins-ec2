
module.exports = {
  apps: [
    {
      name: "app",
      script: "app.js",
      instances: 1,
      autorestart: true,
      watch: false
    }
  ]
};
