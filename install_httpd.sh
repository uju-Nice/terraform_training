  #!/bin/bash
   sudo apt install -y http  && apt update 
   sudo systemctl enable http && systemctl start http
   sudo systemctl status http
   sudo chown -R $USER:$USER /var/www/html
   sudo echo "<html><body><h1> Welcome to Devops world" </h1></body></html>  >  /var/www/html/index.html

