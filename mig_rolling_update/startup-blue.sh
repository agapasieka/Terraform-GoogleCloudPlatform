#!/bin/bash
      apt-get update
      apt-get install apache2 -y
      service apache2 restart
      echo "
<h3>Apache Web Server: blue deployment</h3>" | tee /var/www/html/index.html