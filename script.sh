#!/bin/bash

sudo apt-get update -y
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
echo "Hello from automated server" | sudo tee /var/www/html/index.html
